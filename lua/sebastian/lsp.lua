local lspconfig = require("lspconfig")

local function get_root_dir()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
end
lspconfig.lua_ls.setup {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
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
	root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git",vim.fn.getcwd()),
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
			},
})


--bash lsp
-- Configuración de Lazy.nvim
require('lspconfig').bashls.setup {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	root_dir = require('lspconfig.util').root_pattern(".git", vim.fn.getcwd()),
	settings = {
		bash = {
			linting = {
				enabled = true,
				executable = "shellcheck", -- Asegúrate de tener ShellCheck instalado
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
		local opts = { noremap = true, silent = true }
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

lspconfig.cssls.setup {
	cmd = { "vscode-css-language-server", "--stdio" },
	on_attach = function(client, bufnr)
		-- Configuraciones específicas del buffer
		local opts = { noremap = true, silent = true }
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
local jdtls_path = '/home/sebastian/jdtls' -- Cambia a ruta absoluta
lspconfig.jdtls.setup {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=INFO', -- Cambia ALL a INFO o ERROR si quieres menos logs
		'-Xms1g',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
		'-configuration', jdtls_path .. '/config_linux',
		'-data', vim.fn.getcwd(),
	},

	root_dir = function(fname)
		return lspconfig.util.root_pattern('gradlew', 'mvnw', '.git')(fname) or vim.fn.getcwd()
	end,

	settings = {
		java = {
			home = '/usr/lib/jvm/java-17-openjdk',
		},
	},
}

lspconfig.pyright.setup({
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	settings = {
		python = {
			pythonPath = "/usr/bin/python3", -- Asegúrate de que la ruta sea correcta
			platform = "linux",
			analysis = {
				typeCheckingMode = "basic", -- Cambia a "strict" para una comprobación más estricta
				autoSearchPaths = true,
				autoimportCompletions = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})


lspconfig.pylsp.setup {
	settings = {
		pylsp = {
			plugins = {
				pyflakes = { enabled = true },
				pylint = { enabled = true },
				autopep8 = { enabled = true },
				yapf = { enabled = true },
				black = { enabled = true },
				flake8 = { enabled = true },
				mccabe = { enabled = true },
				pycodestyle = { enabled = true },
				rope_autoimport = { enabled = true }
			},
			progress = { skip_token_initialization = true },
		}
	}
}

-- Configuración de gopls para Go

lspconfig.gopls.setup {
	cmd = { "gopls" },                                       -- Especifica el comando para iniciar gopls
	filetypes = { "go" },
	root_dir = lspconfig.util.root_pattern("go.mod", ".git"), -- Directorio raíz para el proyecto
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				deadcode = true,
			},
			staticcheck = true, -- Activa Staticcheck
		},
	},
}

-- Configuración de Solargraph para Ruby
lspconfig.solargraph.setup {
	cmd = { "solargraph", "stdio" },
	filetypes = { "ruby" },
	root_dir = lspconfig.util.root_pattern("Gemfile", ".git", vim.fn.getcwd()),
	settings = {
		solargraph = {
			useBundler = true,
			diagnostics = true,
		},
	},
}

local MY_FQBN = "arduino:avr:uno"
lspconfig.arduino_language_server.setup {
	cmd = {
		"arduino-language-server",
		"-cli-config", ".arduino15/arduino-cli.yaml",
		"-fqbn",
		MY_FQBN
	}
}
