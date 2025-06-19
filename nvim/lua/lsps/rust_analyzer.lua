return {
  "rust_analyzer",
  opts = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,        -- activa todas las features del Cargo.toml
          runBuildScripts = true,   -- permite que ejecute build.rs
        },
        checkOnSave = {
          command = "clippy",       -- usa `clippy` en lugar de `check`
        },
        diagnostics = {
          enable = true,
          experimental = {
            enable = true,          -- activa diagnósticos experimentales
          },
        },
        inlayHints = {
          enable = true,
          typeHints = true,
          chainingHints = true,
          parameterHints = true,
        },
        lens = {
          enable = true,            -- activa acciones como "Run", "Test", etc. inline
        },
        procMacro = {
          enable = true,            -- habilita soporte para macros como serde, etc.
        },
      }
    }
  }
}

