return {
  "pyright",
  opts = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
      python = {
        pythonPath = { "/usr/bin/python3", vim.env.VIRTUAL_ENV }, -- Ruta al intérprete de Python
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
  }
}
