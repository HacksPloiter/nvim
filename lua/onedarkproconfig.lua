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
if status_ok then
  -- Nvim-Cmp onedarkpro suitable configurations
  vim.cmd([[
  highlight CmpDocNormal guibg=#282c34 guifg=none
  highlight CmpComNormal guibg=#282c34 guifg=none
  highlight CmpDocFloatBorder guibg=none guifg=#00ff00
  highlight CmpComFloatBorder guibg=none guifg=#00ff00
  ]])

  configs.setup {
    highlights = {
      Search = { fg = "#232526", bg = "#66d9ef", italic = true },
      -- Highlights incremental search on cursor but before pressing enter
      IncSearch = { fg = "#232526", bg = "#f92672", italic = true },
      -- Highlights current search result with this colour after pressing enter.
      CurSearch = { fg = "#232526", bg = "#a6e22e", italic = true },
    },
    options = {
      cursorline = true,        --Use cursorline highlighting?
      transparency = false,     --Use a transparent background?
      terminal_colors = true,   --Use the theme's colors for Neovim's terminal?
      highlight_inactive_windows = true, --Highlight inactive window background?
    },
  }
  PostOneDark = function()
    vim.defer_fn(function()
      if(vim.g.colors_name == 'onedark_vivid') then
        vim.opt.syntax = "ON"
        vim.opt.termguicolors = true
      end
    end, 0)
  end
  vim.cmd[[
    augroup CheckCurrTheme
      autocmd!
      autocmd ColorScheme * lua PostOneDark()
    augroup END
  ]]
else
  return
end
--================================-> END <-===================================--
