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

-- [[ Shift + Numpad 0 closes a buffer ]]
-- Mapping Shift + Numpad 0 to execute the command MyBd
--vim.api.nvim_set_keymap('n', '<S-k0>', ':lua vim.cmd("Bd")<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
                        '<S-q>',
                        ':Bd<CR>',
                        {noremap = true, silent = true})

-- [[ TODO ]]
-- To make numpad keys work for keybindings.
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
