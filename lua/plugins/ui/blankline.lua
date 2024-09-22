-- stylua: ignore
local excluded_fs = {
  'help', 'alpha', 'dashboard', 'neo-tree',
  'Trouble', 'trouble', 'lazy', 'mason',
  'notify', 'toggleterm', 'lazyterm',
  'lspinfo',
}

return {
	{
		'lukas-reineke/indent-blankline.nvim',
		event = 'VeryLazy',
		main = 'ibl',
		opts = {
			indent = {
				char = '┆',
				smart_indent_cap = true,
			},
			scope = { enabled = false },
			exclude = { filetypes = excluded_fs },
		},
	},
	{
		'echasnovski/mini.indentscope',
		event = 'VeryLazy',
		opts = {
			symbol = '┆',
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd('Filetype', {
				pattern = excluded_fs,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
