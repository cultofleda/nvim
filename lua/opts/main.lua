-- Set leader key to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.editorconfig = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"

-- Add word wrap
-- vim.opt.linebreak = true
-- vim.opt.textwidth = 80
-- vim.opt.wrap = true
-- vim.opt.wrapmargin = 2

-- Configure how splits should be opened (to the right and to the bottom)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.signcolumn = "yes:1"
