local function map(m, k, v, o)
	vim.keymap.set(m, k, v, o)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>cd", vim.cmd.Ex, { desc = "Open netrw" })
