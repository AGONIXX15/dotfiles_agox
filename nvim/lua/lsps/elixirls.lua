return {
  "elixirls",
  config = function(lspconfig)
    lspconfig.elixirls.setup {
      cmd = { "/home/sebastian/.local/share/nvim/mason/bin/elixir-ls" },
    }
  end
}
