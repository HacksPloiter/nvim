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
local isdracula = vim.g.colors_name == "dracula"
if status_ok and isdracula then
  vim.opt.syntax = "ON"
  vim.opt.termguicolors = true
else
  return
end
--================================-> END <-===================================--
