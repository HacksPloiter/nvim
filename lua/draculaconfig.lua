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
if status_ok then
  PostDracula = function()
    vim.defer_fn(function()
      if(vim.g.colors_name == 'dracula') then
        vim.opt.syntax = "ON"
        vim.opt.termguicolors = true
      end
    end, 0)
  end
  vim.cmd[[
    augroup CheckCurrTheme
      autocmd!
      autocmd ColorScheme * lua PostDracula()
    augroup END
  ]]
else
  return
end
--================================-> END <-===================================--
