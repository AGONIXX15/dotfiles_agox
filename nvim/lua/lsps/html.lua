return {
  "html",
  config = function(lspconfig)
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
  end
}
