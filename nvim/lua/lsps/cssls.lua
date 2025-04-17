return {
  "cssls",
  config = function(lspconfig)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
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
  end
}
