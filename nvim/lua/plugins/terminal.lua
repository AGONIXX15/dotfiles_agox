return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()
	--open the terminal in horizontal
	vim.keymap.set("n", "<leader>th", function()
		vim.cmd("ToggleTerm direction=horizontal")
	end)
	--Open the terminal in vertical mode
	vim.keymap.set("n", "<leader>ty", function()
		vim.cmd("ToggleTerm direction=vertical")
	end)
	--Open the terminal in float mode
		vim.keymap.set("n", "<leader>tf", function()
		vim.cmd("ToggleTerm direction=float")
	end)
	-- Close the terminal
	vim.keymap.set("n", "<leader>tc", function()
		vim.cmd("bd!")
	end)

	end, 
}
