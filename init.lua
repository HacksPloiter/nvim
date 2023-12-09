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
require('keyconfig')             -- NVIM keymaps congis
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
--================================-> END <-===================================--


--================================-> START <-=================================--
--              FILE STRUCTURES & BACKUP INFO - WHAT TO BACKUP                --
--------------------------------------------------------------------------------
--  $HOME/.config/nvim
--  ├── 📂 init.lua (✓)
--  └── lua
--      └── config
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
