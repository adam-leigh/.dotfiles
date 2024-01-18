return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
  config = function()
    local cmp = require("cmp")
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local kind_icons = {
	--Text = "",
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
	--Copilot = "",
  Copilot = ""
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},

  	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
				copilot = "[Copilot]",
			})[entry.source.name]
			return vim_item
		end,
	},


	mapping = cmp.mapping.preset.insert({
    -- navigate down cmp suggestions
    ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    -- map ctrl + down arrow to cmp suggestions
    ["<C-Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),

    -- navigate up cmp suggestions
    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

		["<C-j>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),

		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		-- ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-Right>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		-- Copilot Source
		{ name = "copilot", group_index = 2 },
		-- Other Sources
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "path", group_index = 2 },
		{ name = "luasnip", group_index = 2 },
	}),
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
  end,
}

-- Copilot
