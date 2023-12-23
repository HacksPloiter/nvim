# Notes
This file will contain some useful information about Nvim and Lua!


## Protected calls
You would have seen below code snippet.
```
local status_ok, configs = pcall(require, "pluginname")
if not status_ok then
  return
else
  -- Do something
end
```

How do you get this 'pluginname' if you didn't it from the documentation?
Remember it is not always the directory name or the git repo name.

Ok, so here is how to get it in case where repo name or directory name doesn't
work. Inside nvim, type
```
: set rtp?
```

It will show the runtime path of all the plugins. These can be used for those
protected calls.


## Pretty cool websites
https://github.com/rockerBOO/awesome-neovim

https://neovimcraft.com

https://dotfyle.com

## Understanding Neovim LSP
```mermaid
%%{init: {"flowchart": {"htmlLabels": false}} }%%
flowchart LR
  subgraph LSP
    subgraph lsp.install [Install language servers]
      subgraph mason-pkg [Local to neovim]
        mason.nvim
      end
      system-pkg["System
      package managers"]
      subgraph coc-install ["coc.nvim (Local to (neo)vim)"]
        :CocInstall
      end
    end
    mason.nvim ==usually paired with==> mason-lspconfig
    mason.nvim -.-> config.manual
    coc-install -.-> coc-config
    system-pkg --> nvim-lspconfig & config.manual
    subgraph lsp.config [LSP configuration]
      subgraph config.easy [Convienient setup]
        subgraph Adapter + autoconfigure
          mason-lspconfig
        end
        mason-lspconfig --> nvim-lspconfig
        nvim-lspconfig
      end
      subgraph config.manual [Manual setup]
        vim.lsp.start["vim.lsp.start()
        + ftplugins"]
      end
      subgraph coc-config [coc.nvim + json]
        :CocConfig
      end
    end
    coc-config -.-> coc.nvim
    config.easy --> neovim
    config.manual --> neovim
    subgraph lsp.client [LSP clients]
      neovim
      coc.nvim
    end
  end
```
