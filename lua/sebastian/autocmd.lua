vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
			require("sebastian.keymaps.html")
			require("sebastian.autocommands.html")
			vim.opt.list = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      require("sebastian.keymaps.python")
			require("sebastian.autocommands.python")
			require("sebastian.snippets.python")
			vim.opt.list = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
      require("sebastian.keymaps.luak")
			vim.opt.list = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
      require("sebastian.keymaps.cpp")
			vim.opt.list = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      require("sebastian.keymaps.java")
			vim.opt.list = false
    end,
})
