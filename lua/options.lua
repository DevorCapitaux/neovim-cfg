local o = vim.opt
local g = vim.g
local u = require('core.utils')

g.mapleader = ' '
g.maplocalleader = '\\'

o.number = true
o.relativenumber = true
o.cursorline = true
o.scrolloff = 5

o.splitbelow = true
o.splitright = true

o.ignorecase = true
o.smartcase = true

o.hidden = true
o.undofile = true

o.clipboard = 'unnamedplus'

u.set_indent(4)
u.set_indent(4, 'make', false) -- make needs real tabs
u.set_indent(2, 'lua')
