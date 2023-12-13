--****************************************************************************--
--*                         [onedarkproconfig.lua]                           *--
--*                    [THEME ONEDARKPRO CONFIG FILE]                        *--
--*                   [Author/Credit - Tanweer Ashif]                        *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                  Theme olimorris/onedarkpro.nvim Configs                   --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "onedarkpro")
local isonedarkprovivid = vim.g.colors_name == "onedark_vivid"
if status_ok and isonedarkprovivid then
  configs.setup {
    options = {
      cursorline = true,        --Use cursorline highlighting?
      transparency = false,     --Use a transparent background?
      terminal_colors = true,   --Use the theme's colors for Neovim's terminal?
      highlight_inactive_windows = true, --Highlight inactive window background?
    }
  }
  vim.opt.syntax = "ON"
  vim.opt.termguicolors = true
else
  return
end
--================================-> END <-===================================--
