return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
			}, {
				{ name = 'path' },
			}),
			window = {
				completion = {
					border = 'rounded',
				},
				documentation = {
					max_width = 65,
					max_height = 24,
				},
			},
			experimental = { ghost_text = true },
			mapping = cmp.mapping.preset.insert({
				['<A-j>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-n>'] = cmp.mapping.scroll_docs(1),
				['<C-p>'] = cmp.mapping.scroll_docs(-1),
				['<Tab>'] = cmp.mapping(function(fallback)
					local col = vim.fn.col('.') - 1

					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.jumpable() then
						luasnip.jump(1)
					elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
						fallback()
					else
						cmp.complete()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),
			}),
		})
	end,
}
