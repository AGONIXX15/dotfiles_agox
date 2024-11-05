return {
	"pyright",
	opts = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        python = {
            pythonPath = "/usr/bin/python3",  -- Asegúrate de que la ruta sea correcta
						platform = "linux",
            analysis = {
                typeCheckingMode = "basic",  -- Cambia a "strict" para una comprobación más estricta
                autoSearchPaths = true,
                autoimportCompletions = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        },
    },
	}
}
