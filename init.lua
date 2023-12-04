--****************************************************************************--
--*                               [init.lua]                                 *--
--*                           [NVIM LAUNCH POINT]                            *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                               File Imports                                 --
--------------------------------------------------------------------------------
require('keyconfig')        -- NVIM keymaps congis
require('optconfig')        -- NVIM options configs
require('lazyconfig')       -- NVIM Lazy configs
require('themeplugconfig')  -- Installed theme and plugin configs
--================================-> END <-===================================--

--================================-> START <-=================================--
--                        BACKUP INFO - WHAT TO BACKUP                        --
--------------------------------------------------------------------------------
-- $HOME/.config/nvim
--     |
--     |-- init.lua (✓)
--     |
--     |-- lua ---------
--                     |------ keyconfig.lua (✓)
--                     |------ optconfig.lua (✓)
--                     |------ lazyconfig.lua (✓)
--                     |------ themeplugconfig.lua (✓)
--
--================================-> END <-===================================--
