local lspconfig = require("lspconfig")

local function get_root_dir()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
end
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
		local capabilities1 = vim.lsp.protocol.make_client_capabilities()
		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
			capabilities = capabilities1,
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
			pythonPath = "usr/bin/python3",
      analysis = {
				extraPaths = {get_root_dir(),"/home/sebastian/.local/lib/python3.10/site-packages"},
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
    },
}


--html lsp
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true 
lspconfig.html.setup {
								on_attach = function(client, bufnr) 
									local opts = { noremap=true, silent=true }
										 vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
										 -- Mapeo de teclas para la definición	
								end,
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
--Enable (broadcasting) snippet capability for completion
local capabilitie = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup{
    cmd = { "vscode-css-language-server", "--stdio" },
    on_attach = function(client, bufnr)
        -- Configuraciones específicas del buffer
									local opts = { noremap=true, silent=true }
										 vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ga', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	
        -- Habilitar autocompletado

   end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Usar capacidades de nvim-cmp
    settings = {
        css = {
            validate = true, -- Validar CSS
            lint = {
                css = true,
                scss = true,
                less = true,
            },
        },
        scss = {
            validate = true, -- Validar SCSS
        },
        less = {
            validate = true, -- Validar Less
        },
    },
}

-- Ruta al servidor JDTLS
local jdtls_path = '/home/sebastian/.local/share/jdtls/jdt-language-server-1.41.0-202410021526' -- Cambia a ruta absoluta

lspconfig.jdtls.setup {
    cmd = { 
        'java', -- Usa el binario de Java
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar', -- Actualiza a la versión correcta
        '-configuration', jdtls_path .. '/config_linux',
        '-data', vim.fn.getcwd(), -- Directorio dinámico
    },

    root_dir = function(fname)
        return lspconfig.util.root_pattern('gradlew', 'mvnw', '.git')(fname) or vim.loop.os_homedir()
    end,

    settings = {
        java = {
            home = '/usr/lib/jvm/java-17-openjdk-amd64',  -- Ajusta según tu instalación de Java 17
        },
    },
}

