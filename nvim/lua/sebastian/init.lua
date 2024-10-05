vim.g.mapleader = " "
require("sebastian.keymaps.general")
require("sebastian.lazy")
require("sebastian.opciones")
require("sebastian.lsp")
require("sebastian.colores")


vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
        require("sebastian.keymaps.html")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        require("sebastian.keymaps.python")
    end,
})

--snippets
require("sebastian.snippets.html")
require("sebastian.snippets.cpp")
