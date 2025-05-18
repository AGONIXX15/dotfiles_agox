return {
  "cmake",
  config = function(lspconfig)
    lspconfig.cmake.setup({
      cmd = { "cmake-language-server" },
      filetypes = { "cmake" },
      root_dir = require('lspconfig.util').root_pattern('CMakeLists.txt', '.git'),
    })
  end,
}
