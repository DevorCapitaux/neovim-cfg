return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			highlight = { enable = true },
			indent = { enable = true },

      -- stylua: ignore
      ensure_installed = {
        'lua', 'luadoc', 'luap', 'vim', 'vimdoc', 'query',
        'markdown', 'markdown_inline','latex', 'bibtex',
        'c', 'cpp', 'c_sharp', 'arduino', 'asm', 'nasm',
        'bash', 'fish',
        'rust', 'cairo', 'toml', 'glsl',
        'make', 'cmake', 'meson', 'ninja',
        'python',
        'html', 'css', 'scss', 'javascript', 'typescript', 'sql',
        'json', 'xml', 'yaml', 'http', 'hurl', 'perl',
        'strace', 'tmux', 'diff', 'awk', 'printf',
        'llvm', 'cuda',
        'csv', 'ssh_config', 'objdump', 'passwd', 'udev', 'gpg', 'regex',
        'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',
        'dockerfile',
      },
		})
	end,
}
