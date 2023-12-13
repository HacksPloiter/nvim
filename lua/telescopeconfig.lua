--****************************************************************************--
--*                        [telescopeconfig.lua]                             *--
--*                   [PLUGIN TELESCOPE CONFIG FILE]                         *--
--*                   [Author/Credit - Tanweer Ashif]                        *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                          Plugin Telescope Configs                          --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "telescope")
if not status_ok then
  return
else

  -- Keymaps
  local builtin = require('telescope.builtin')
  local themes = require('telescope.themes')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  --[[vim.keymap.set('n',
                 '<Leader>ff',
                 function()
                   -- Shows result in a dropdown menu
                   builtin.find_files(themes.get_dropdown({}))
                 end, {})]]
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  --[[vim.keymap.set('n',
                 '<Leader>fg',
                 function()
                   -- Shows result in a dropdown menu
                   builtin.live_grep(themes.get_dropdown({}))
                 end, {})]]
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

  -- Extension loading
  require('telescope').load_extension('fzf')

end
--================================-> END <-===================================--
