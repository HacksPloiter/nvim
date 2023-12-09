--****************************************************************************--
--*                            [lazyconfig.lua]                              *--
--*                         [NVIM LAZY CONFIG FILE]                          *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--         Automatically install lazy when lazyconfig.lua is loaded           --
--------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--================================-> END <-===================================--


--================================-> START <-=================================--
--    Autocommand that reloads neovim whenever lazyconfig.lua file is saved   --
--------------------------------------------------------------------------------
vim.cmd([[
  augroup lazy_user_config
    autocmd!
    autocmd BufWritePost lazyconfig.lua lua vim.cmd("Lazy install")
    autocmd BufWritePost lazyconfig.lua lua vim.cmd("Lazy clean")
    autocmd BufWritePost lazyconfig.lua lua vim.cmd("Lazy sync")
  augroup end
]])
--================================-> END <-===================================--


--================================-> START <-=================================--
--                     Install themes and plugins here.                       --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "lazy")
if not status_ok then
  return
else
  return configs.setup({
    -- Plugins Start --
    {'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = {'nvim-lua/plenary.nvim'},
    },
    {'nvim-tree/nvim-tree.lua',
      dependencies = {'nvim-tree/nvim-web-devicons'}
    },
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    {'hrsh7th/nvim-cmp',                             --> Completion engine
      dependencies = {'L3MON4D3/LuaSnip',            --> Snippet Engine
        dependencies = {'saadparwaiz1/cmp_luasnip',} --> Snippet source
      },
    },
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'lewis6991/gitsigns.nvim'},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'folke/trouble.nvim',
      dependencies = {'nvim-tree/nvim-web-devicons'}
    },
    {'ggandor/leap.nvim'},
    {'chentoast/marks.nvim'},
    {'echasnovski/mini.nvim', branch = 'stable'},
    {'nvim-lualine/lualine.nvim',
      dependencies = {'nvim-tree/nvim-web-devicons', opt = true}
    },
    {'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      dependencies = {{'nvim-tree/nvim-web-devicons'}}
    },
    -- Plugins End --
    -- Themes Start --
    {"olimorris/onedarkpro.nvim"}, --> Closest to Onedark Pro VSC
    {"lunarvim/lunar.nvim"},       --> Lunar Vim theme
    {'maxmx03/dracula.nvim'},      --> Similar to Dracula VSC
    -- Themes End --
  })
end
--================================-> END <-===================================--
