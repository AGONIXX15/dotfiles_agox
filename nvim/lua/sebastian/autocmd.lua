vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
			require("sebastian.keymaps.html")
			require("sebastian.autocommands.html")
			require("sebastian.snippets.html")
			vim.opt.list = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      require("sebastian.keymaps.python").setup(bufnr)
			require("sebastian.autocommands.python").setup(bufnr)
			require("sebastian.snippets.python").setup(bufnr)
			vim.opt.list = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      require("sebastian.keymaps.luak").setup(bufnr)
			vim.opt.list = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      require("sebastian.keymaps.cpp").setup(bufnr)
			require("sebastian.snippets.cpp").setup(bufnr)
			vim.opt.list = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"js","javascript","typescript"},
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      require("sebastian.keymaps.javascript").setup(bufnr)
			vim.opt.list = false
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      require("sebastian.keymaps.java").setup(bufnr)
			require("sebastian.snippets.java").setup(bufnr)
			vim.opt.list = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
		pattern = {"zsh","sh"},
		callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
			require("sebastian.keymaps.bash").setup(bufnr)
			vim.opt.list = false
		end,
})


vim.api.nvim_create_autocmd("FileType", {
		pattern = "ruby",
		callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
			require("sebastian.keymaps.ruby").setup(bufnr)
		vim.opt.list = false
		end,
})

vim.api.nvim_create_autocmd("FileType", {
		pattern = "go",
		callback = function()
			require("sebastian.keymaps.go").setup(bufnr)
			require("sebastian.snippets.go").setup(bufnr)
		vim.opt.list = false
		end,
})

