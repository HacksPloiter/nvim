--****************************************************************************--
--*                          [lualineconfig.lua]                             *--
--*                     [PLUGIN LUALINE CONFIG FILE]                         *--
--*                    [Author/Credit - Tanweer Ashif]                       *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                          Plugin Lualine Configs                          --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "lualine")
if not status_ok then
  return
else
  --[==[
  -- Filename colour changes based on edits.
  local custom_fname = require('lualine.components.filename'):extend()
  --custom_fname.apply_icon = require('lualine.components.filetype').apply_icon
  local highlight = require'lualine.highlight'
  local default_status_colors = { saved = 'none', modified = 'white' }
  
  function custom_fname:init(options)
    custom_fname.super.init(self, options)
    self.status_colors = {
      saved = highlight.create_component_highlight_group({
                bg = default_status_colors.saved},
                'filename_status_saved', self.options),
      modified = highlight.create_component_highlight_group({
                bg = default_status_colors.modified},
                'filename_status_modified', self.options),
    }
    if self.options.color == nil then self.options.color = '' end
  end
  function custom_fname:update_status()
    local data = custom_fname.super.update_status(self)
    data = highlight.component_format_highlight(
             vim.bo.modified and
             self.status_colors.modified or
             self.status_colors.saved) .. data
    return data
  end
  ]==]
  configs.setup {
    options = {
      icons_enabled = true,
      theme = 'molokai',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      -- lualine_c = {custom_fname},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {
      lualine_a = {'filename'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}
end
--================================-> END <-===================================--
