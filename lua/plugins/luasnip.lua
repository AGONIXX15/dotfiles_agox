return {
  -- Configura LuaSnip
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Última versión
    build = "make install_jsregexp", -- Opcional, si necesitas jsregexp
    config = function()
      local ls = require("luasnip")

      -- Mapeo de teclas para expandir y navegar entre snippets
      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})

      -- Cargar snippets desde friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },

  -- Agrega friendly-snippets
  { "rafamadriz/friendly-snippets" },
}
