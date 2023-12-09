--****************************************************************************--
--*                        [nvimdashboardconfig.lua]                         *--
--*                   [PLUGIN NVIM DASHBOARD CONFIG FILE]                    *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                          Plugin Dashboard Configs                          --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "dashboard")
if not status_ok then
  return
else
  configs.setup {
  }
end
--================================-> END <-===================================--
