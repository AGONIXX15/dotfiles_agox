return {
  "jdtls",
  config = function(lspconfig)
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
  end
}
