local U = {}
local extend = vim.tbl_deep_extend
local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup
local o = vim.opt

U.set_indent = function(indent, filetypes, expand)
	create_autocmd('FileType', {
		desc = 'Set indention',
		pattern = filetypes or '*',
		group = create_augroup(
			'set_indention_' .. indent .. (expand ~= false and 'e' or 'n'),
			{ clear = true }
		),
		callback = function()
			o.tabstop = indent
			o.softtabstop = indent
			o.shiftwidth = indent
			o.expandtab = expand ~= false
		end,
	})
end

U.load_maps = function(map_tbl, opt_tbl)
	vim.schedule(function()
		local default_opts = { silent = true }
		opt_tbl = extend('force', default_opts, opt_tbl or {})
		for mode, maps in pairs(map_tbl) do
			for keys, opts in pairs(maps) do
				local cmd = opts[1]
				opts[1] = nil
				opts = extend('force', opt_tbl, opts)

				mode = (mode == 'other') and (opts.mode or 'n') or mode
				opts.mode = nil

				if not cmd then
					if not opts.group then
						vim.notify('No which-key group', vim.log.levels.ERROR)
						return
					end

					local key = extend('force', { keys }, opts)
					require('which-key').add({ key })
				else
					vim.keymap.set(mode, keys, cmd, opts)
				end
			end
		end
	end)
end

return U
