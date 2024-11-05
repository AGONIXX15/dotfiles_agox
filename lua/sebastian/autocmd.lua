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
			vim.opt.list = false
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
			require("sebastian.snippets.cpp")
			vim.opt.list = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      require("sebastian.keymaps.java")
			require("sebastian.snippets.java")
			vim.opt.list = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
		pattern = "sh",
		callback = function()
			require("sebastian.keymaps.bash")
			vim.opt.list = false
		end,
})


vim.api.nvim_create_autocmd("FileType", {
		pattern = "ruby",
		callback = function()
			require("sebastian.keymaps.ruby")
		vim.opt.list = false
		end,
})

vim.api.nvim_create_autocmd("FileType", {
		pattern = "go",
		callback = function()
			require("sebastian.keymaps.go")
			require("sebastian.snippets.go")
		vim.opt.list = false
		end,
})
