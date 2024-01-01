--****************************************************************************--
--*                        [retrailnvimconfig.lua]                           *--
--*                   [PLUGIN RETRAIL.NVIM CONFIG FILE]                      *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                                Key Configs                                 --
--------------------------------------------------------------------------------

local status_ok, configs = pcall(require, "retrail")
if not status_ok then
  return
else
  -- Define a highlight group to use for highlighting
  vim.api.nvim_command('highlight TrailingHl guifg=#232526 guibg=#f92672')

  -- Trim trailing whitespace. Count doesn't show EOL substituition.
  vim.api.nvim_set_keymap('n',
                          '<Leader>wt',
                          ':RetrailTrimWhitespace<CR>',
                          {noremap = true, silent = true})
  -- Toggle whitespace highlighting for the current buffer
  vim.api.nvim_set_keymap('n',
                          '<Leader>wh',
                          ':RetrailToggle<CR>',
                          {noremap = true, silent = true})
  configs.setup {
    -- Highlight group to use for trailing whitespace.
    hlgroup = "TrailingHl",
    -- Pattern to match trailing whitespace against. Edit with caution!
    -- pattern = "\\v((.*%#)@!|%#)\\s+$", --> Doesn't highlight non-trailing tab
    pattern = "\\v((.*%#)@!|%#)\\s+$|\\t", --> Highlights non-trailing tabs also
    -- Enabled filetypes.
    filetype = {
      -- Strictly enable only on `include`ed filetypes. When false, only
      -- disabled on an `exclude`ed filetype.
      strict = false,
      -- Included filetype list.
      include = {},
      -- Excluded filetype list. Overrides `include` list.
      exclude = {
        "aerial",
        "alpha",
        "checkhealth",
        "cmp_menu",
        "dashboard",
        "diff",
        "lazy",
        "lspinfo",
        "man",
        "mason",
        "TelescopePrompt",
        "Trouble",
        "WhichKey",
        "toggleterm",
      },
    },
    -- Enabled buftypes.
    buftype = {
      -- Strictly enable only on `include`ed buftypes. When false, only disabled
      -- on an `exclude`ed buftype.
      strict = false,
      -- Included buftype list.
      include = {},
      -- Excluded buftype list. Overrides `include` list.
      exclude = {
        "help",
        "nofile",
        "prompt",
        "quickfix",
        "terminal",
      }
    },
    -- Trim on write behaviour.
    trim = {
      -- Auto trim or not on saving file
      auto = false,
      -- Does trimming apply to whitespaces?
      whitespace = true,
      -- Remove last line if it doesn't have non-whitespace character.
      blanklines = true,
    }
  }
end
--=================================-> END <-==================================--
