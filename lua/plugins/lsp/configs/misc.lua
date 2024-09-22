local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({})
lspconfig.pyright.setup({})

lspconfig.ltex.setup({
	settings = {
		ltex = {
			language = 'ru-RU',
		},
	},
})
