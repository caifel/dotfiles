-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable automatic terminal/system clipboard access. In the Docker workstation on
-- macOS, LazyVim defaults to unnamedplus, which can trigger clipboard permission
-- prompts from the terminal while editing.
vim.opt.clipboard = ""
