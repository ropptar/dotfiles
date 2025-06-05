local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('ellisonleao/gruvbox.nvim') -- colorscheme
Plug('nvim-lualine/lualine.nvim') -- status line
Plug('nvim-tree/nvim-web-devicons') -- icons
Plug('folke/which-key.nvim') -- key hints
Plug('brenoprata10/nvim-highlight-colors') -- inline color highlighting

vim.call('plug#end')

vim.cmd('colorscheme gruvbox')

require('options.keymaps')
require('options.options')

require('plugins.lualine')
require('plugins.which-key')
require('plugins.nvim-highlight-colors')
