-- Lazy
vim.keymap.set("n", "<leader>l", "<CMD>Lazy<CR>", { silent = true, desc = "Lazy" })

-- Navigation
vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>", { silent = true })
-- Resize splits
vim.keymap.set("n", "<C-A-h>", "<CMD>vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-j>", "<CMD>horizontal resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-k>", "<CMD>horizontal resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-l>", "<CMD>vertical resize -5<CR>", { silent = true })
