--nvim tree open
vim.keymap.set("n", "<leader>el", function()
  vim.cmd("Neotree left")
end, { desc = "Toggle Explorer Focus" })

vim.keymap.set("n", "<leader>eb", function ()
  vim.cmd("Neotree buffers")
end, { desc = "Toogle to buffers"})
vim.keymap.set("n", "<leader>ef", function ()
  vim.cmd("Neotree float")
end, { desc = "Toggle to float explorer"})

-- keymaps to move in nvimtree
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move left" })
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move down" })
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move up" })
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move right" })

-- rezise windows
vim.keymap.set("n", "<C-Up>", function()
  vim.cmd("horizontal resize -10")
end, { desc = "Resize up" })
vim.keymap.set("n", "<C-Down>", function()
  vim.cmd("horizontal resize +10")
end, { desc = "Resize down" })
vim.keymap.set("n", "<C-Right>", function()
  vim.cmd("vertical resize +10")
end, { desc = "Resize right" })
vim.keymap.set("n", "<C-Left>", function()
  vim.cmd("vertical resize -10")
end, { desc = "Resize left" })

vim.keymap.set("n", "<leader>sh", function()
  vim.cmd("split")
end, { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>sv", function()
  vim.cmd("vsplit")
end, { desc = "Split vertically" })

vim.keymap.set("n", "<C-l>", function()
  vim.cmd("TmuxNavigateRight")
end, { desc = "Navigate right" })

vim.keymap.set("n", "<C-h>", function()
  vim.cmd("TmuxNavigateLeft")
end, { desc = "Navigate left" })

vim.keymap.set("n", "<C-j>", function()
  vim.cmd("TmuxNavigateDown")
end, { desc = "Navigate down" })

vim.keymap.set("n", "<C-k>", function()
  vim.cmd("TmuxNavigateUp")
end, { desc = "Navigate up" })

vim.keymap.set("n", "<leader>ti", vim.cmd.InlayHintsToggle, { desc = "Inlay hints" })
