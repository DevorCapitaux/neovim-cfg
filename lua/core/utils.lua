local U = {}
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

return U
