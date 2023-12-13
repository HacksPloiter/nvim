--****************************************************************************--
--*                               [init.lua]                                 *--
--*                           [NVIM LAUNCH POINT]                            *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                               File Imports                                 --
--------------------------------------------------------------------------------
-- Core Config Imports
require('keycommandconfig')      -- NVIM custom commands and keymaps configs
require('optconfig')             -- NVIM options configs
-- Lazy Config Imports
require('lazyconfig')            -- NVIM Lazy configs
-- Theme Config Imports
require('draculaconfig')         -- Theme Dracula configs
require('lunarconfig')           -- Theme Lunar configs
require('onedarkproconfig')      -- Theme Onedarkpro configs
-- Plugin Config Imports
require('lualineconfig')         -- Plugin Lualine configs
require('nvimcmpconfig')         -- Plugin nvim-cmp configs
require('nvimdashboardconfig')   -- Plugin nvim-dashboard configs
require('nvimtreeconfig')        -- Plugin nvim-tree configs
require('nvimtreesitterconfig')  -- Plugin nvim-treesitter configs
require('toggletermconfig')      -- Plugin toggleterm configs
require('telescopeconfig')       -- Plugin telescope configs
require('masonconfig')           -- Plugin mason configs
require('nvimlspconfig')         -- Plugin nvim-lspconfig configs
-- Shell Apps Configs
require('lazygitconfig')         -- Lazygit app configs
--================================-> END <-===================================--


--================================-> START <-=================================--
--                            Theme Control Centre                            --
--------------------------------------------------------------------------------
-- vim.cmd 'colorscheme dracula'
-- vim.cmd 'colorscheme lunar'
vim.cmd("colorscheme onedark_vivid")
--================================-> END <-===================================--


--================================-> START <-=================================--
--               Sets neovim as git editor using neovim-remote                --
--------------------------------------------------------------------------------
--if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
--  print("testprint");
--  vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
--end
--================================-> END <-===================================--


--================================-> START <-=================================--
--              FILE STRUCTURES & BACKUP INFO - WHAT TO BACKUP                --
--------------------------------------------------------------------------------
--  $HOME/.config/nvim
--  │
--  ├── 📂 init.lua (✓)
--  │
--  └── lua
--      │
--      └── config
--          │
--          ├── 📂 keyconfig.lua (✓)
--          ├── 📂 optconfig.lua (✓)
--          ├── 📂 lazyconfig.lua (✓)
--          ├── 📂 draculaconfig.lua (✓)
--          ├── 📂 lunarconfig.lua (✓)
--          ├── 📂 onedarkproconfig.lua (✓)
--          ├── 📂 lualineconfig.lua (✓)
--          ├── 📂 nvimcmpconfig.lua (✓)
--          ├── 📂 nvimdashboardconfig.lua (✓)
--          ├── 📂 nvimtreeconfig.lua (✓)
--          └── 📂 nvimtreesitterconfig.lua (✓)
--================================-> END <-===================================--
