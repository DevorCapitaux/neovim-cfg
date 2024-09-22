return {
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		keys = {
			{
				'<leader>?',
				function()
					require('which-key').show({ global = false })
				end,
				desc = 'Buffer local keymaps',
			},
		},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		'lewis6991/gitsigns.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'folke/noice.nvim',
		dependencies = {
			'MuniTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
		event = 'VeryLazy',
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				lsp_doc_border = 'rounded',
			},
		},
	},
}
