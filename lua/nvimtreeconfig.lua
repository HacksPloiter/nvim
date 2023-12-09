--****************************************************************************--
--*                         [nvimtreeconfig.lua]                             *--
--*                    [PLUGIN NVIMTREE CONFIG FILE]                         *--
--*                   [Author/Credit - Tanweer Ashif]                        *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                          Plugin Nvim-Tree Configs                          --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "nvim-tree")
if not status_ok then
  return
else 
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  configs.setup {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  }
end
--================================-> END <-===================================--
