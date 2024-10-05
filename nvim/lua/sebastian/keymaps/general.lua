
-- nvim tree open 
vim.keymap.set("n", "<leader>eo", function()
	vim.cmd("NvimTreeOpen")
end)
--nvim tree close
vim.keymap.set("n", "<leader>ec", function()
	vim.cmd("NvimTreeClose")
end)

-- keymaps to move in nvimtree 
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move left" })
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move down" })
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move up" })
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move right" })
