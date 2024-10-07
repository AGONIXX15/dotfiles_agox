vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
        require("sebastian.keymaps.html")
				require("sebastian.autocommands.html")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        require("sebastian.keymaps.python")
				require("sebastian.autocommands.python")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        require("sebastian.keymaps.luak")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        require("sebastian.keymaps.cpp")
    end,
})
