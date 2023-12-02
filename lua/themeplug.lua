--****************************************************************************--
--*                             [themeplug.lua]                              *--
--*                   [NVIM THEME AND PLUGIN CONFIG FILE]                    *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                           Theme Dracula Configs                            --
--------------------------------------------------------------------------------
-- vim.opt.syntax = "ON"
-- vim.opt.termguicolors = true
-- vim.cmd 'colorscheme dracula'
--================================-> END <-===================================--


--================================-> START <-=================================--
--                  Theme olimorris/onedarkpro.nvim Configs                   --
--------------------------------------------------------------------------------
vim.opt.syntax = "ON"
vim.opt.termguicolors = true

local status_ok, configs = pcall(require, "onedarkpro")
if not status_ok then
  return
end
configs.setup {

-- Override default colors or create your own
--   colors = {
--              onedark = { bg = "#FF0000" }, -- red
--              onelight = { bg = "#FF0000" }, -- red
--            },
--   highlights = {}, -- Override default highlight groups or create your own
--   styles = { -- For example, to apply bold and italic, use "bold,italic"
--     types = "NONE", -- Style that is applied to types
--     methods = "NONE", -- Style that is applied to methods
--     numbers = "NONE", -- Style that is applied to numbers
--     strings = "NONE", -- Style that is applied to strings
--     comments = "NONE", -- Style that is applied to comments
--     keywords = "NONE", -- Style that is applied to keywords
--     constants = "NONE", -- Style that is applied to constants
--     functions = "NONE", -- Style that is applied to functions
--     operators = "NONE", -- Style that is applied to operators
--     variables = "NONE", -- Style that is applied to variables
--     parameters = "NONE", -- Style that is applied to parameters
--     conditionals = "NONE", -- Style that is applied to conditionals
--     virtual_text = "NONE", -- Style that is applied to virtual text
--   },
--   filetypes = { -- Override which filetype highlight groups are loaded
--     comment = true,
--     go = true,
--     html = true,
--     java = true,
--     javascript = true,
--     json = true,
--     lua = true,
--     markdown = true,
--     php = true,
--     python = true,
--     ruby = true,
--     rust = true,
--     scss = true,
--     toml = true,
--     typescript = true,
--     typescriptreact = true,
--     vue = true,
--     xml = true,
--     yaml = true,
--   },
--   plugins = { -- Override which plugin highlight groups are loaded
--     aerial = true,
--     barbar = true,
--     copilot = true,
--     dashboard = true,
--     flash_nvim = true,
--     gitsigns = true,
--     hop = true,
--     indentline = true,
--     leap = true,
--     lsp_saga = true,
--     lsp_semantic_tokens = true,
--     marks = true,
--     mini_indentscope = true,
--     neotest = true,
--     neo_tree = true,
--     nvim_cmp = true,
--     nvim_bqf = true,
--     nvim_dap = true,
--     nvim_dap_ui = true,
--     nvim_hlslens = true,
--     nvim_lsp = true,
--     nvim_navic = true,
--     nvim_notify = true,
--     nvim_tree = true,
--     nvim_ts_rainbow = true,
--     op_nvim = true,
--     packer = true,
--     polygot = true,
--     rainbow_delimiters = true,
--     startify = true,
--     telescope = true,
--     toggleterm = true,
--     treesitter = true,
--     trouble = true,
--     vim_ultest = true,
--     which_key = true,
--   },

  options = {
    -- Use cursorline highlighting?
    cursorline = true,
    -- Use a transparent background?
    transparency = false,
    -- Use the theme's colors for Neovim's :terminal?
    terminal_colors = true,
    -- When the window is out of focus, change the normal background?
    highlight_inactive_windows = false,
  }
}

vim.cmd("colorscheme onedark_vivid")
--================================-> END <-===================================--


--================================-> START <-=================================--
--                         Plugin Tree-Sitter Configs                         --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
configs.setup {
  --
  -- A list of parser names, or "all" (the five listed parsers should always be
  -- installed).
  ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc", "query" },
  --
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  --
  -- Automatically install missing parsers when entering buffer.
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed
  -- locally.
  auto_install = true,
  --
  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },
  --
  -- If you need to change the installation directory of the parsers
  -- (see -> Advanced Setup).
  -- parser_install_dir = "/some/path/to/store/parsers",
  -- Remember to run:
  -- vim.opt.runtimepath:append("/some/path/to/store/parsers")
  --
  highlight = {
    --
    -- Enables highlights
    enable = true,
    --
    -- NOTE: these are the names of the parsers and not the filetype.
    -- (for example if you want to disable highlighting for the `tex` filetype,
    -- you need to include `latex` in this list as this is the name of the
    -- parser) list of language that will be disabled.
    disable = { "c", "rust" },
    --
    -- Disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --   local max_filesize = 100 * 1024 -- 100 KB
    --   local ok, stats = pcall(vim.loop.fs_stat,
    --                           vim.api.nvim_buf_get_name(buf))
    --   if ok and stats and stats.size > max_filesize then
    --     return true
    --   end
    -- end,
    --
    -- Setting this to true will run `:h syntax` and tree-sitter at the same
    -- time. Set this to `true` if you depend on 'syntax' being enabled
    -- (like for indentation). Using this option may slow down your editor, and
    -- you may see some duplicate highlights. Instead of true it can also be a
    -- list of languages
    additional_vim_regex_highlighting = true,
    --
  },
}
--================================-> END <-===================================--


--================================-> START <-=================================--
--                         Plugin Tree-Sitter Configs                         --
--------------------------------------------------------------------------------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

local status_ok, configs = pcall(require, "nvim-tree")
if not status_ok then
  return
end
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
--================================-> END <-===================================--
