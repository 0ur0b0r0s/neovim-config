local execute = vim.api.nvim_command
local fn = vim.fn
local use = require('packer').use
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'neovim/nvim-lsp',
        opt = true
    }
    use {
        'neovim/nvim-lspconfig',
        opt = true
    }
    use 'xiyaowong/nvim-transparent'
    use 'drewtempelmeyer/palenight.vim'
    use 'Yggdroot/indentLine'
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'
    use 'junegunn/gv.vim'
    use 'hrsh7th/nvim-compe'
    use 'chrisbra/unicode.vim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{ 'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim' }}
    }
    vim.cmd('packadd nvim-lsp')
    vim.cmd('packadd nvim-lspconfig')
end)
