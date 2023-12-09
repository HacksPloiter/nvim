--****************************************************************************--
--*                       [nvimtreesitterconfig.lua]                         *--
--*                   [PLUGIN NVIMTREESITTER CONFIG FILE]                    *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                         Plugin Tree-Sitter Configs                         --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
else
configs.setup {
  --
  ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,
  -- ignore_install = { "javascript" },
  --[=[
  parser_install_dir = "/some/path/to/store/parsers",
  vim.opt.runtimepath:append("/some/path/to/store/parsers")
  ]=]
  highlight = {
    enable = true,
    disable = { "rust" },
    --[=[
    -- Disable slow treesitter highlight for large files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat,
                              vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,]=]
    additional_vim_regex_highlighting = true,
  },
}
end
--================================-> END <-===================================--
