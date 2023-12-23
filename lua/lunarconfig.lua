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
if status_ok then
  PostLunar = function()
    vim.defer_fn(function()
      if(vim.g.colors_name == 'lunar') then
        vim.opt.syntax = "ON"
        vim.opt.termguicolors = true
      end
    end, 0)
  end
  vim.cmd[[
    augroup CheckCurrTheme
      autocmd!
      autocmd ColorScheme * lua PostLunar()
    augroup END
  ]]
else
  return
end
--================================-> END <-===================================--
