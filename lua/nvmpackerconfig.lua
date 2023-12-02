--****************************************************************************--
--*                         [nvmpackerconfig.lua]                            *--
--*                       [NVIM PACKER CONFIG FILE]                          *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--      Automatically install packer when nvmpackerconfig.lua is loaded       --
--------------------------------------------------------------------------------
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim", install_path,})
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end
--================================-> END <-===================================--


--================================-> START <-=================================--
-- Autocommand that reloads neovim whenever nvmpackerconfig.lua file is saved --
--------------------------------------------------------------------------------
local fn = vim.fn
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost nvmpackerconfig.lua source <afile> | PackerSync
  augroup end
]])
--================================-> END <-===================================--


--================================-> START <-=================================--
--        Use a protected call so we don't error out on first use             --
--------------------------------------------------------------------------------
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
--================================-> END <-===================================--


--================================-> START <-=================================--
--                    Have packer use a popup window                          --
--------------------------------------------------------------------------------
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})
--================================-> END <-===================================--


--================================-> START <-=================================--
--        Install themes and plugins here. Have packer manage itself          --
--------------------------------------------------------------------------------
return packer.startup(function(use)

-- Plugins Start --
  use ("wbthomason/packer.nvim")
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  use {'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {'nvim-lua/plenary.nvim'}
      }
  use {'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'}
      }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'lewis6991/gitsigns.nvim'}
  use {"akinsho/toggleterm.nvim", tag = '*',
        config = function() require("toggleterm").setup()
        end
      }
  use {'folke/trouble.nvim',
        requires = {'nvim-tree/nvim-web-devicons'}
      }
  use {'ggandor/leap.nvim'}
  use {'chentoast/marks.nvim'}
  use {'echasnovski/mini.indentscope'}
  use { 'echasnovski/mini.nvim', branch = 'stable' }
-- Plugins End --

-- Themes Start --
  -- use {'dracula/vim', as = 'dracula'} --> Official Dracula
  use {"olimorris/onedarkpro.nvim"} --> Closest to Onedark Pro VSC
  -- use {'maxmx03/dracula.nvim'} --> Similar to Dracula VSC
-- Themes End --

end)
--================================-> END <-===================================--
