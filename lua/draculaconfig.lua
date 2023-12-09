--****************************************************************************--
--*                          [draculaconfig.lua]                             *--
--*                      [THEME DRACULA CONFIG FILE]                         *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                           Theme Dracula Configs                            --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "dracula")
if not status_ok then
  return
else
  -- vim.opt.syntax = "ON"
  -- vim.opt.termguicolors = true
  -- vim.cmd 'colorscheme dracula'
end
--================================-> END <-===================================--
