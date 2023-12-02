--****************************************************************************--
--*                               [init.lua]                                 *--
--*                           [NVIM LAUNCH POINT]                            *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                               File Imports                                 --
--------------------------------------------------------------------------------
require('nvmpackerconfig')  -- NVIM Packer configs
require('opts')             -- NVIM options configs
require('keys')             -- NVIM keymaps congis
require('themeplug')        -- Installed theme and plugin configs
--================================-> END <-===================================--

--================================-> START <-=================================--
--                        BACKUP INFO - WHAT TO BACKUP                        --
--------------------------------------------------------------------------------
-- $HOME/.config/nvim
--     |
--     |-- init.lua (✓)
--     |
--     |-- lua ---------
--                     |------ keys.lua (✓)
--                     |------ opts.lua (✓)
--                     |------ packer.lua (✓)
--                     |------ themeplug.lua (✓)
--
--================================-> END <-===================================--
