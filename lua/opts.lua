--****************************************************************************--
--*                                [opts.lua]                                *--
--*                        [NVIM OPTIONS CONFIG FILE]                        *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--

--================================-> START <-=================================--
--                                Opt Configs                                 --
--------------------------------------------------------------------------------
-- [[ Context ]]
vim.opt.colorcolumn = '81'       -- str:  Show col for max line length
vim.opt.number = true            -- bool: Show line numbers
vim.opt.numberwidth = 1          -- bool: Sets space before line numbers.
-- vim.opt.relativenumber = true -- bool: Show relative line numbers
vim.opt.scrolloff = 5            -- int:  Scroll when near 5 lines of top/bottom
vim.opt.signcolumn = "yes"       -- str:  Show the sign column

-- [[ Filetypes ]]
vim.opt.encoding = 'utf8'        -- str:  String encoding to use
vim.opt.fileencoding = 'utf8'    -- str:  File encoding to use

-- [[ Search ]]
vim.opt.ignorecase = true -- bool: Ignore case in search patterns
vim.opt.smartcase = true  -- bool: Override ic if search has capitals
vim.opt.incsearch = true  -- bool: Use incremental search
vim.opt.hlsearch = true   -- bool: Highlight search matches

-- [[ Whitespace ]]
vim.opt.expandtab = true -- bool: Use spaces instead of tabs
vim.opt.shiftwidth = 4   -- num:  Size of an indent
vim.opt.softtabstop = 4  -- num:  Number of spaces tabs count for in insert mode
vim.opt.tabstop = 4      -- num:  Number of spaces tabs count for

-- [[ Splits ]]
vim.opt.splitright = true -- bool: Place new window to right of current one
vim.opt.splitbelow = true -- bool: Place new window below the current one

-- [[ Miscellaneous ]]
vim.opt.wrapscan = true       -- Wrap searches around top/bottom of file
vim.opt.writebackup = false   -- No tilde files
vim.opt.switchbuf = 'useopen' -- Use an already open window if possible
vim.opt.textwidth = 0         -- Never wrap lines
--================================-> END <-===================================--
