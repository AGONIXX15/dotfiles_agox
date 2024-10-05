local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
			capabilities = capabilities,
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
			init_options = {
				clangdFileStatus = true,
				usePlaceholders = true,
				completeUnimported = true,
				semanticHighlighting = true,
			},
		})

require("lspconfig").pyright.setup({
  on_attach = function(client, bufnr)
    -- Opciones adicionales de configuración al adjuntar el LSP al buffer
  end,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",  -- Cambia a "strict" para una comprobación más estricta
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})


--bash lsp 
-- Configuración de Lazy.nvim
require('lspconfig').bashls.setup{
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    root_dir = require('lspconfig.util').root_pattern(".git", vim.fn.getcwd()),
    settings = {
        bash = {
            linting = {
                enabled = true,
                executable = "shellcheck",  -- Asegúrate de tener ShellCheck instalado
            }
        }
    }
}


--html lsp
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true 
lspconfig.html.setup {
								capabilities = capabilities,
                cmd = { "vscode-html-language-server", "--stdio" }, -- Cambia el comando si es necesario
                filetypes = { "html", "htm" },
                settings = {
                    html = {
                        format = {
                            enable = true, -- Habilitar formato automático
                        },
                    },
                },
           }
