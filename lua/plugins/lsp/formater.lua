return {
	'stevearc/conform.nvim',
	config = function()
		local conform = require('conform')

		conform.setup({
			formatters_by_ft = {
				lua = { 'stylua' },
			},
		})

		local configs = vim.fn.stdpath('config') .. '/lua/plugins/lsp/fmt_configs'
		print(configs .. '/stylua.toml')
		conform.formatters.stylua = {
			prepend_args = function()
				return { '--config-path', configs .. '/stylua.toml' }
			end,
		}
	end,
}
