#!/bin/bash

# Remove files from Git and stage the deletion
git rm .config/karabiner/assets/complex_modifications/1705441733.json
git rm bash/.bash_history
git rm bash/.bash_profile
git rm iterm/.config/iterm/JetBrains.itermcolors
git rm iterm/.config/iterm/jan-2024.itermcolors
git rm karabiner/.config/karabiner/assets/complex_modifications/1671542693.json
git rm karabiner/.config/karabiner/assets/complex_modifications/1705009697.json
git rm karabiner/.config/karabiner/automatic_backups/karabiner_20221220.json
git rm karabiner/.config/karabiner/automatic_backups/karabiner_20221221.json
git rm karabiner/.config/karabiner/automatic_backups/karabiner_20230107.json
git rm karabiner/.config/karabiner/automatic_backups/karabiner_20240111.json
git rm karabiner/.config/karabiner/karabiner.json
git rm nvim/.config/nvim
git rm tmux/.config/tmux/renew_env.sh
git rm tmux/.config/tmux/statusline.conf
git rm tmux/.config/tmux/tmux.conf
git rm tmux/.config/tmux/tmux.remote.conf
git rm tmux/.config/tmux/yank.sh
git rm tmux/.tmux.conf
git rm vscode/.config/vscode/keybindings.json
git rm vscode/.config/vscode/settings.json
git rm zsh/.aliases
git rm zsh/.zsh_history
git rm zsh/.zsh_sessions/173F03F4-1417-4B55-B594-31E51DC7BDC9.session
git rm zsh/.zsh_sessions/378D11BF-7B75-499B-90BF-1BBEF99CBFBF.session
git rm zsh/.zsh_sessions/827B6FCA-1419-4027-8EBF-C92D817A594C.session
git rm zsh/.zsh_sessions/91BBBC2C-2149-423E-8F2D-3564A9183A76.session
git rm zsh/.zsh_sessions/B73EEC26-02AC-4143-8980-15DCF23E760F.session
git rm zsh/.zsh_sessions/CEB83CA7-9CEB-4D56-B5C7-D6BB
git rm zsh/.zsh_sessions/D1ED7040-6B8D-4C18-9249-1182CC4177B2.session
git rm zsh/.zsh_sessions/_expiration_check_timestamp
git rm zsh/.zshenv
git rm zsh/.zshrc
git rm zsh/.zshrc.pre-oh-my-zsh

# Verify changes
git status
