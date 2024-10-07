return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()
	--open the terminal in horizontal
	vim.keymap.set("n", "<leader>th", function()
		vim.cmd(vim.v.count1 .. "ToggleTerm direction=horizontal")
	end)
	--Open the terminal in vertical mode
	vim.keymap.set("n", "<leader>ty", function()
		vim.cmd(vim.v.count1 .. "ToggleTerm direction=vertical")
	end)
	--Open the terminal in float mode
		vim.keymap.set("n", "<leader>tf", function()
		vim.cmd(vim.v.count1 .. "ToggleTerm direction=float")
	end)

	-- Close the terminal
	vim.api.nvim_set_keymap("n", "<leader>tc",":bwipeout!<CR>", { noremap = true, silent = true })

	end,
}
