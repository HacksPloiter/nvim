--****************************************************************************--
--*                       [toggletermconfig.lua]                             *--
--*                   [PLUGIN TOGGLETERM CONFIG FILE]                        *--
--*                   [Author/Credit - Tanweer Ashif]                        *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                        Plugin ToggleTerm Configs                           --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "toggleterm")
if not status_ok then
  return
else
  vim.api.nvim_set_keymap('n',
                          '<leader>tt',
                          ':ToggleTerm<CR>',
                          {noremap = true, silent = true})
end
--================================-> END <-===================================--
