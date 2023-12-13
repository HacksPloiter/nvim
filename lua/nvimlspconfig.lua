--****************************************************************************--
--*                            [nvimlspconfig.lua]                           *--
--*                       [PLUGIN NVIM LSP CONFIG FILE]                      *--
--*                      [Author/Credit - Tanweer Ashif]                     *--
--* [LinkedIn/tanweerashif | GitHub/HacksPloiter | https://tanweerashif.com] *--
--****************************************************************************--


--================================-> START <-=================================--
--                        Plugin Nvim LspConfig Configs                       --
--------------------------------------------------------------------------------
local lsp_ok, lspconfigs = pcall(require, "lspconfig") --> Neovim's LSP client
-- Source for Neovim's LSP client
local cmplsp_ok, cmplspconfigs = pcall(require, "cmp_nvim_lsp")
if lsp_ok and cmplsp_ok then
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- Keybinds

      -- show definition, references
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      -- go to declaration
      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      -- show lsp definitions
      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      -- show lsp implementations
      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      -- show lsp type definitions
      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      -- see available code actions, in visual mode will apply to selection
      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      -- smart rename
      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      -- show  diagnostics for file
      opts.desc = "Show buffer diagnostics"
      keymap.set("n",
                 "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      -- show diagnostics for line
      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      -- jump to previous diagnostic in buffer
      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      -- jump to next diagnostic in buffer
      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      -- show documentation for what is under cursor
      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      -- mapping to restart lsp if necessary
      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    -- Enables autocompletion (assign to every lsp server config)
    local capabilities = cmplspconfigs.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = {Error = " ", Warn = " ", Hint = "󰠠 ", Info = " "}
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure C and C++ server
    lspconfigs["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure python server
    lspconfigs["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure R language server server
    lspconfigs["r_language_server"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure sql language server server
    lspconfigs["sqlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfigs["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- configure md language server server
    lspconfigs["marksman"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    --[[-- configure html server
    lspconfigs["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })]]

    --[[-- configure typescript server with plugin
    lspconfigs["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })]]

    --[[-- configure css server
    lspconfigs["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })]]

    --[[-- configure tailwindcss server
    lspconfigs["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })]]

    --[[-- configure svelte server
    lspconfigs["svelte"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    })]]

    --[[-- configure prisma orm server
    lspconfigs["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })]]

    --[[-- configure graphql language server
    lspconfigs["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })]]

    --[[-- configure emmet language server
    lspconfigs["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })]]
else
  return
end
--================================-> END <-===================================--
