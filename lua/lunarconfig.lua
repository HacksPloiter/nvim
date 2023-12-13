--****************************************************************************--
--*                            [lunarconfig.lua]                             *--
--*                        [THEME LUNAR CONFIG FILE]                         *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                           Theme LunarVim Configs                           --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "lunar")
local islunar = vim.g.colors_name == "lunar"
if status_ok and islunar
then
  vim.opt.syntax = "ON"
  vim.opt.termguicolors = true
else
  return
end
--================================-> END <-===================================--
