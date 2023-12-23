--****************************************************************************--
--*                         [nvimcmpconfig.lua]                              *--
--*                      [PLUGIN NVIMCMP CONFIG FILE]                        *--
--*                    [Author/Credit - Tanweer Ashif]                       *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                           Plugin nvim-cmp Configs                          --
--------------------------------------------------------------------------------
local cmp_status_ok, cmp = pcall(require, "cmp")
local snip_status_ok, luasnip = pcall(require, "luasnip")
local cmpluasnip_status_ok, cmpluasnip = pcall(require, "cmp_luasnip")

if (cmp_status_ok and snip_status_ok and cmpluasnip_status_ok) then
  require("luasnip/loaders/from_vscode").lazy_load()

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = " ",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = " ",
    Misc = " ",
  }
  -- find more here: https://www.nerdfonts.com/cheat-sheet

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ["<up>"] = cmp.mapping.select_prev_item(),
      ["<down>"] = cmp.mapping.select_next_item(),
      ["<S-down>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<S-up>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      -- Bring out full suggestion
      ["<C-l>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      -- Specify `cmp.config.disable` if you want to remove the default mapping.
      ["<C-y>"] = cmp.config.disable,
      ["<S-CR>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm {select = true},
      --[[ SuperTAB
      ["<down>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<up>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),]]
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        --[[ -- Below concatonates the icons with the name of the item kind
        vim_item.kind = string.format('%s %s',
                                      kind_icons[vim_item.kind],
                                      vim_item.kind)]]
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },

    --[[
    Guide to borders:
    Pmenu – normal item
    PmenuSel – selected item
    PmenuSbar – scrollbar
    PmenuThumb – thumb of the scrollbar]]
    window = {
      documentation = cmp.config.window.bordered({
        winhighlight = "Normal:CmpDocNormal,"..          -->In theme config file
                       "FloatBorder:CmpDocFloatBorder,"..-->In theme config file
                       "Search:None",
      }),
      completion = cmp.config.window.bordered({
        winhighlight = "Normal:CmpComNormal,"..          -->In theme config file
                       "FloatBorder:CmpComFloatBorder,"..-->In theme config file
                       "CursorLine:PmenuSel,"..
                       "Search:None",
      }),
      --scrollbar = {
      --  winhighlight = "PmenuSbar:CmpSbPmenuSbar,"..
      --                 "Scrollbar:CmpSbScrollbar,"..
      --                 "PmenuThumb:CmpSbPmenuThumb,",
      --},
    },

    -- LSP settings (for overriding per client)
    experimental = {
      ghost_text = false,
      native_menu = false,
    },
  }

else
  return
end
--================================-> END <-===================================--
