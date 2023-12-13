--****************************************************************************--
--*                          [lazygitconfig.lua]                             *--
--*                       [LAZYGIT APP CONFIG FILE]                          *--
--*                     [Author/Credit - Tanweer Ashif]                      *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--              Lua script to check if git editor is set as nvim              --
--------------------------------------------------------------------------------
local gitconfig_path = vim.env.HOME .. '/.gitconfig'
local function checkEditorType()
  local file = io.open(gitconfig_path, "r")
  if file then
    local content = file:read("*a")
    if not content:find('nvim') then
      file:close()
      error("Editor type is not nvim. "
            .."Please change it manually in ~/.gitconfig file!")
      return false
    else
      file:close()
      return true
    end
  else
    error("File ~/.gitconfig doesn't exist. Please check if git is installed!")
    return false
  end
end
--================================-> END <-===================================--


--================================-> START <-=================================--
--             Lua script to open LazyGit directly from the terminal          --
--------------------------------------------------------------------------------
local status_ok, configs = pcall(require, "toggleterm.terminal")
local lazyexists = vim.fn.executable("lazygit") == 1
local iseditornvim = checkEditorType()
if status_ok and lazyexists and iseditornvim then
  lazygit = configs.Terminal:new({
    cmd = "lazygit",
    dir = vim.fn.expand('%:p:h'),
    direction = "float",
    float_opts = {
      border = "double",
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.9)
    }
  })
  function OpenLazyGit()
    lazygit:toggle()
  end
  vim.api.nvim_set_keymap('n',
                          '<leader>lg',
                          '<cmd>lua OpenLazyGit()<CR>',
                          {noremap = true, silent = true})
else
  return
end
--================================-> END <-===================================--
