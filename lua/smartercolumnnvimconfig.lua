--****************************************************************************--
--*                         [smartcolumnnvimconfig.lua]                      *--
--*                    [PLUGIN SMARTCOLUMN.NVIM CONFIG FILE]                 *--
--*                      [Author/Credit - Tanweer Ashif]                     *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                      Plugin Smartcolumn.Nvim Configs                       --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "smartercolumn")
if not status_ok then
  return
else
  configs.setup {
     colorcolumn = "81",
     disabled_filetypes = { "NvimTree", "lazy", "mason", "help", "checkhealth",
                            "lspinfo", "noice", "Trouble", "fish", "zsh",
                            "dashboard",},
     custom_colorcolumn = {},
     scope = "file",
     underlengthcc = 'true',
     underlengthhex = "#2e333c",
     overlengthcc = 'true',
     overlengthhex = "#f92672",
  }
end
--=================================-> END <-==================================--
