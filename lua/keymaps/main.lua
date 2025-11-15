-- Lazy
vim.keymap.set("n", "<leader>l", "<CMD>Lazy<CR>", { silent = true, desc = "Lazy" })

-- Navigation
vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>", { silent = true })

-- Create splits
vim.keymap.set("n", "<leader><C-v>", "<CMD>vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader><C-h>", "<CMD>split<CR>", { silent = true })

-- Resize splits
vim.keymap.set("n", "<C-A-h>", "<CMD>vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-j>", "<CMD>horizontal resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-k>", "<CMD>horizontal resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-l>", "<CMD>vertical resize -5<CR>", { silent = true })

-- Rebind macro recording
vim.keymap.set("n", "q", "<nop>", { noremap = true })
vim.keymap.set("n", "Q", "q", { noremap = true, desc = "Record macro" })
vim.keymap.set("n", "<M-q>", "Q", { noremap = true, desc = "Replay last register" })

-- Remove search highlight after grepping through the document with `/`
vim.keymap.set("n", "<leader>hc", "<CMD>let @/=''<CR>", { noremap = true, desc = "[H]ighlight [c]lear" })
