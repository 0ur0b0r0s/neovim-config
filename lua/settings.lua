--
-- See `:help vim.o`
--
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.swapfile = false
vim.o.backup = false
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.softtabstop = 0
vim.o.syntax = 'on'
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.wrap = false
vim.o.completeopt = 'menuone,noselect'
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

vim.cmd [[
        silent! colorscheme tokyonight-night
        autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
        autocmd ColorScheme * highlight LineNr guibg=NONE guifg=white 
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
        set laststatus=3
    ]]

