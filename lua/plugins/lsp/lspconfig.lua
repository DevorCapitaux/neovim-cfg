return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim', -- For easy downloading lsp, linters and others
		'nvim-lua/plenary.nvim', -- For loading lsp configs from other files
		'hrsh7th/cmp-nvim-lsp',
		'stevearc/conform.nvim',
	},
	config = function()
		local sign = function(opts)
			vim.fn.sign_define(opts.name, {
				texthl = opts.name,
				text = opts.text,
				numhl = '',
			})
		end

		sign({ name = 'DiagnosticSignError', text = '󰅙' })
		sign({ name = 'DiagnosticSignWarn', text = '󰋼' })
		sign({ name = 'DiagnosticSignHint', text = '󰌵' })
		sign({ name = 'DiagnosticSignInfo', text = '' })

		vim.diagnostic.config({
			virtual_text = false,
			severity_sort = true,
		})

		-- Default options for all lsp
		local lsp_defaults = {
			capabilities = require('cmp_nvim_lsp').default_capabilities(),
			on_attach = function(client, bufnr)
				local M = {
					n = {
						['K'] = { vim.lsp.buf.hover, desc = 'Hover' },
						['gD'] = { vim.lsp.buf.declaration, desc = 'Show declaration' },
						['gd'] = { vim.lsp.buf.definition, desc = 'Show definition' },
						['gi'] = { vim.lsp.buf.implementation, desc = 'Show implementation' },
						['gr'] = { vim.lsp.buf.references, desc = 'Show references' },
						['<F2>'] = { vim.lsp.buf.rename, desc = 'Rename' },
						['<F4>'] = { vim.lsp.buf.code_action, desc = 'Code action' },
						['gl'] = { vim.diagnostic.open_float, desc = 'Show diagnostic info' },
						['[d'] = { vim.diagnostic.goto_next, desc = 'Show next diagnostic' },
						[']d'] = { vim.diagnostic.goto_prev, desc = 'Show prev diagnostic' },

						['<leader>l'] = { group = 'LSP' },
						['<leader>lh'] = { vim.lsp.buf.hover, desc = 'Hover' },
						['<leader>lD'] = { vim.lsp.buf.declaration, desc = 'Show declaration' },
						['<leader>ld'] = { vim.lsp.buf.definition, desc = 'Show definition' },
						['<leader>li'] = {
							vim.lsp.buf.implementation,
							desc = 'Show implementation',
						},
						['<leader>lR'] = { vim.lsp.buf.references, desc = 'Show references' },
						['<leader>ls'] = {
							vim.lsp.buf.signature_help,
							desc = 'Show signature_help',
						},
						['<leader>lr'] = { vim.lsp.buf.rename, desc = 'Rename' },
						['<leader>la'] = { vim.lsp.buf.code_action, desc = 'Code action' },
						['<leader>ll'] = {
							vim.diagnostic.open_float,
							desc = 'Show diagnostic info',
						},
						['<leader>ln'] = {
							vim.diagnostic.goto_next,
							desc = 'Show next diagnostic',
						},
						['<leader>lp'] = {
							vim.diagnostic.goto_prev,
							desc = 'Show prev diagnostic',
						},
					},
				}

				require('core.utils').load_maps(M, { buffer = bufnr })

				if client.supports_method('textDocument/formatting') and vim.g.autoformat then
					local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })

					for _, ft in pairs(vim.g.autoformat or {}) do
						if ft == filetype then
							local fmt_M = {
								n = {
									['<leader>lf'] = { group = 'formatting' },
									['<leader>lft'] = { '', desc = 'Toggle autocomplete' },
								},
							}
							require('core.utils').load_maps(fmt_M, { buffer = bufnr })

							vim.api.nvim_create_autocmd('BufWritePre', {
								buffer = bufnr,
								callback = function()
									-- vim.lsp.buf.format { async = false }
									require('conform').format({ bufnr = bufnr })
								end,
							})
						end
					end
				end
			end,
		}

		local lspconfig = require('lspconfig')
		lspconfig.util.default_config =
			vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

		-- Load lsp configs
		local scan = require('plenary.scandir')
		local config_path = vim.fn.stdpath('config') .. '/lua/plugins/lsp/configs'
		for _, file in pairs(scan.scan_dir(config_path, { depth = 1 })) do
			require(file:match('(plugins/lsp/configs/.*).lua$'))
		end
	end,
}
