--****************************************************************************--
--*                            [masonconfig.lua]                             *--
--*                        [PLUGIN MASON CONFIG FILE]                        *--
--*                      [Author/Credit - Tanweer Ashif]                     *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                            Plugin Mason Configs                            --
--------------------------------------------------------------------------------
local masonstatus_ok, masonconfigs = pcall(require, "mason")
local masonlsp_ok, masonlspconfigs = pcall(require, "mason-lspconfig")
if masonstatus_ok and masonlsp_ok then

  masonconfigs.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  masonlspconfigs.setup({
    ensure_installed = {
      "clangd",
      "pyright",
      "r_language_server",
      "sqlls",
      "lua_ls",
      "marksman",
    },
    automatic_installaation = true,
  })

else
  return
end
--================================-> END <-===================================--
