-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Exit Insert Mode instantly by smashing 'jk' on the home row
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Keep cursor dead-center on the screen when scrolling half-pages
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Clear distracting search highlights easily with Space + h
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
