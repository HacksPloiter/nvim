--****************************************************************************--
--*                         [overlengthnvimconfig.lua]                       *--
--*                    [PLUGIN OVERLENGTH.NVIM CONFIG FILE]                  *--
--*                      [Author/Credit - Tanweer Ashif]                     *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                                Key Configs                                 --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "overlength")
if not status_ok then
  return
else
  -- setup
  configs.setup({
    enabled = true,
    colors = {
      ctermfg = 'black',
      ctermbg = 'red',
      fg = '#232526',
      bg = '#f92672',
    },
    -- Mode to use textwidth local options
    -- 0: Don't use textwidth at all, always use config.default_overlength.
    -- 1: Use `textwidth, unless it's 0, then use config.default_overlength.
    -- 2: Always use textwidth. There will be no highlighting where
    --    textwidth == 0, unless added explicitly
    textwidth_mode = 0,
    -- Default overlength with no filetype
    default_overlength = 80,
    -- How many spaces past your overlength to start highlighting
    grace_length = 1,
    -- Highlight only the column or until the end of the line
    highlight_to_eol = true,
    -- List of filetypes to disable overlength highlighting
    disable_ft = {'qf', 'help', 'man', 'checkhealth', 'lazy', 'packer',
                  'NvimTree', 'Telescope', 'WhichKey', 'dashboard',},
  })
end
--=================================-> END <-==================================--
