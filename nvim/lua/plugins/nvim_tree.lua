return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    -- empty setup using defaults
    require("nvim-tree").setup()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- copy default mappings here from defaults in next section
      --vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node,          opts("CD"))
      --vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer,     opts("Open: In Place"))
      ---
      -- OR use all default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- remove a default
      vim.keymap.del("n", "<C-]>", { buffer = bufnr })
      --override CD
      vim.keymap.set("n", "<leader>e", api.tree.change_root_to_node, opts("CD")) -- change directory
      -- override a default
      --@ vim.keymap.set("n", "<C-e>", api.tree.reload,                       opts("Refresh"))

      -- add your mappings
      ---
    end

    require("nvim-tree").setup({
      ---
      on_attach = my_on_attach,
      ---
    })
    -- OR setup with some options
    require("nvim-tree").setup({

      auto_reload_on_write = true, -- Actualiza el árbol cuando se escribe un archivo
      update_focused_file = {
        enable = true,             -- Enfoca el archivo actual en el árbol
        update_cwd = true,         -- Opcional: actualiza el directorio de trabajo
      },
      on_attach = my_on_attach,
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
}
