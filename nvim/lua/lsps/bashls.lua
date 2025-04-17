return {
  "bashls",
  opts = {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash", "zsh" },
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
}
