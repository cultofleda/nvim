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
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"

-- Add word wrap
vim.opt.linebreak = true
vim.opt.textwidth = 80
vim.opt.wrap = true
vim.opt.wrapmargin = 2

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

vim.cmd("set nohidden")
vim.cmd("set signcolumn=yes:1")

-- Enable cross-copy-paste between WSL and nvim
if vim.fn.has("wsl") == 1 then
    if vim.fn.executable("wl-copy") == 0 then
        print("wl-clipboard not found, clipboard integration won't work")
    else
        vim.g.clipboard = {
            name = "wl-clipboard (wsl)",
            copy = {
                ["+"] = "wl-copy --foreground --type text/plain",
                ["*"] = "wl-copy --foreground --primary --type text/plain",
            },
            paste = {
                ["+"] = function()
                    return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
                end,
                ["*"] = function()
                    return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
                end,
            },
            cache_enabled = true,
        }
    end
end

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({ higroup="Visual", timeout=200 })
    augroup END
]])
