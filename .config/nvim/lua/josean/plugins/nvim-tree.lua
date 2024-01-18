return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- Define the on_attach function
    local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Here you can copy the default mappings and/or add your custom mappings
      -- Example custom mapping: vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

      -- If you want all the default mappings with some modifications, you can do this:
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.del('n', 'u', { buffer = bufnr })  -- Disabling 'r' mapping
      vim.keymap.del('n', 'e', { buffer = bufnr })  -- Disabling 'r' mapping
      vim.keymap.del('n', '<C-e>', { buffer = bufnr })  -- Disabling 'r' mapping


      -- Example of removing a default mapping
      -- vim.keymap.del('n', '<C-]>', { buffer = bufnr })

      -- Example of overriding a default
      -- vim.keymap.set('n', '<C-e>', api.tree.reload, opts('Refresh'))
    end

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
     },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      -- Here you pass the my_on_attach function
      on_attach = my_on_attach,
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer "}) -- toggle file explorer

    keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer "}) -- toggle file explorer
  end,
}

