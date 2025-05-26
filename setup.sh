#!/bin/bash

# Ubuntu Server Setup Script
# This script sets up a fresh Ubuntu server with all necessary development tools

set -euo pipefail  # Exit on error, undefined variables, and pipe failures

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Start setup
print_status "Starting Ubuntu server setup..."

# 1. System Update
print_status "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Install essential packages
print_status "Installing essential packages..."
sudo apt install -y \
    curl \
    wget \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    unzip \
    zsh \
    git \
    tmux

# 3. Install GitHub CLI
if ! command_exists gh; then
    print_status "Installing GitHub CLI..."
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh
else
    print_status "GitHub CLI already installed"
fi

# 4. Install Homebrew
if ! command_exists brew; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
    
    # Add Homebrew to PATH
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    print_status "Homebrew already installed"
fi

# 5. Install NVM (Node Version Manager)
if [ ! -d "$HOME/.nvm" ]; then
    print_status "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    
    # Load NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
else
    print_status "NVM already installed"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# 6. Install Node.js (latest LTS)
print_status "Installing Node.js..."
nvm install --lts
nvm use --lts
nvm alias default node

# 7. Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_status "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    print_status "Oh My Zsh already installed"
fi

# 8. Install Neovim 0.11
print_status "Installing Neovim 0.11..."
if command_exists nvim; then
    current_version=$(nvim --version | head -n1 | cut -d' ' -f2)
    print_status "Current Neovim version: $current_version"
fi

# Download and install Neovim 0.11 from GitHub releases
wget https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm nvim-linux64.tar.gz

# 9. Install Tmux Plugin Manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    print_status "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    print_status "Tmux Plugin Manager already installed"
fi

# 10. Install Claude Code via Homebrew
print_status "Installing Claude Code..."
brew install anthropic/tap/claude-code

# 11. Setup dotfiles with stow (if in dotfiles directory)
if [ -d ".config" ] && command_exists stow; then
    print_status "Setting up dotfiles with stow..."
    stow .
elif [ -d ".config" ]; then
    print_status "Installing stow..."
    sudo apt install -y stow
    stow .
fi

# 12. Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    print_status "Changing default shell to zsh..."
    chsh -s $(which zsh)
    print_warning "Shell changed to zsh. Please log out and log back in for the change to take effect."
else
    print_status "Already using zsh as default shell"
fi

# Final setup instructions
print_status "Setup complete!"
echo ""
print_status "Next steps:"
echo "  1. Log out and log back in to use zsh as your default shell"
echo "  2. Run 'tmux' and press 'prefix + I' to install tmux plugins"
echo "  3. Configure git: git config --global user.name 'Your Name'"
echo "  4. Configure git: git config --global user.email 'your.email@example.com'"
echo "  5. Authenticate GitHub CLI: gh auth login"
echo ""
print_status "Enjoy your configured Ubuntu server!"