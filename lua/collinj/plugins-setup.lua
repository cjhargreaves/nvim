local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("scottmckendry/cyberdream.nvim")
  
  -- dependency plugin
  use("nvim-lua/plenary.nvim")
  -- split window navigator
  use("christoomey/vim-tmux-navigator")
  use("szw/vim-maximizer") -- maximizes and restores windows

  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- commenting
  use("numToStr/Comment.nvim")
  
  -- file explorer
  use("nvim-tree/nvim-tree.lua")
  
  -- icons
  use("kyazdani42/nvim-web-devicons")
  
  -- statusline
  use("nvim-lualine/lualine.nvim")
  
  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- auto closing
  use("jiangmiao/auto-pairs")

  -- auto completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

   -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets
  
  -- managing LSP servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configuring LSP servers
  use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) 

  -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  
  -- autoclose tags
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) 
  


  -- terminal toggle
  use("akinsho/toggleterm.nvim")

  use 'stevearc/dressing.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'MeanderingProgrammer/render-markdown.nvim'

  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    config = function()
      require('avante_lib').load()
      require('avante').setup()
    end
  }
  
  if packer_bootstrap then
    require("packer").sync()
  end
end)
