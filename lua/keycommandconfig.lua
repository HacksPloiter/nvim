--****************************************************************************--
--*                          [keycommandconfig.lua]                          *--
--*           [NVIM CUSTOM COMMANDS AND KEYMAPPINGS CONFIG FILE]             *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                                Key Configs                                 --
--------------------------------------------------------------------------------
-- [[ Timeout ]]
vim.o.timeout = true
vim.o.timeoutlen = 5000

-- [[ LEADER ]]
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '\\', '<Nop>', { silent = true, noremap = false })
vim.g.maplocalleader = '\\'

-- [[ Shift + Arrow cycles through buffer ]]
vim.api.nvim_set_keymap('n',
                        '<S-Left>',
                        ':bp<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',
                        '<S-Right>',
                        ':bn<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n',
                        '<S-q>',
                        ':Bd<CR>',
                        {noremap = true, silent = true})

-- [[ TODO ]]
-- To make numpad keys work for keybindings.
-- [[ Shift + Numpad 0 closes a buffer ]]
-- Mapping Shift + Numpad 0 to execute the command MyBd
-- vim.api.nvim_set_keymap('n',
--                         '<S-k0>',
--                         ':lua vim.cmd("Bd")<CR>',
--                         { noremap = true, silent = true })
--================================-> END <-===================================--


--================================-> START <-=================================--
--                              Custom Commands                               --
--------------------------------------------------------------------------------
-- [[ Buffer kill doesn't kill window ]]
vim.cmd([[
command! -nargs=0 Bd execute 'bp | bd #' | redraw!
]])
--================================-> END <-===================================--


--================================-> START <-=================================--
--    Function to export key mappings to a file and open it in a new buffer   --
--                     Use command :ExportKeyMappings                         --
--------------------------------------------------------------------------------
function ExportKeyMappings()
  local nvim_dir = vim.fn.stdpath('config')
  local file_path = nvim_dir .. "/keymaps.log"
  local file = io.open(file_path, "w") -- Open the file in write mode
  io.output(file) -- Redirect stdout to the file
  local mappings = vim.api.nvim_get_keymap('')

  for _, mapping in ipairs(mappings) do
    io.write(
      string.format(
        "Mode: %s | LHS: %s | RHS: %s | Buffer: %s | Expr: %s\n",
        mapping.mode,
        mapping.lhs,
        mapping.rhs,
        mapping.buffer,
        mapping.expr
      )
    )
  end

  io.close(file)
  vim.cmd("edit "..file_path)
end

vim.cmd("command! ExportKeyMappings lua ExportKeyMappings()")
--================================-> END <-===================================--

--================================-> START <-=================================--
--                            Useful AutoCommands.                            --
--------------------------------------------------------------------------------
local function mdesc(opt, description)
    return vim.tbl_extend("force", opt, { desc = description })
end

local map = function(mode, lhs, rhs, opts, desc)
    opts = opts and opts or {}
    opts = mdesc(opts, desc)
    vim.keymap.set(mode, lhs, rhs, opts)
end

local autocmd = vim.api.nvim_create_autocmd

local augroup = function(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- define autocmd in a group so that you can clear it easily
autocmd({ "TermOpen" }, {
    group = augroup("Terminal"),
    pattern = { "*" },
    callback = function()
        vim.wo.number = false
        vim.wo.relativenumber = false
        vim.api.nvim_command("startinsert")
    end,
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("wincmd =")
        vim.cmd("tabdo wincmd =")
    end,
})

-- go to the last known loc/position when opening a file/buffer
-- :h restore-position and :h restore-cursor
autocmd("BufReadPost", {
    group = augroup("restore cursor"),
    pattern = { "*" },
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] >= 1 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- close some filetypes with <q>
autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "query", -- :InspectTree
        "spectre_panel",
        "startuptime",
        "tsplayground",
    },
    callback = function(event)
        -- :help api-autocmd
        -- nvim_create_autocmd's callback receives a table argument with fields
        -- event = {id,event,group?,match,buf,file,data(arbituary data)}
        vim.bo[event.buf].buflisted = false
        map("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true },
            "close some filetype windows with <q>")
    end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown", "norg" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- TODO: Automatically show diagnostics on current line
--================================-> END <-===================================--
