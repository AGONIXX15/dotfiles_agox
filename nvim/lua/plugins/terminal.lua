return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup()
    --open the terminal in horizontal
    vim.keymap.set("n", "<leader>tt", function()
    end)
    vim.keymap.set("n", "<leader>th", function()
      vim.cmd(vim.v.count1 .. "ToggleTerm direction=horizontal")
    end)
    --Open the terminal in vertical mode
    vim.keymap.set("n", "<leader>tv", function()
      vim.cmd(vim.v.count1 .. "ToggleTerm direction=vertical")
    end)
    --Open the terminal in float mode
    vim.keymap.set("n", "<leader>tf", function()
      vim.cmd(vim.v.count1 .. "ToggleTerm direction=float")
    end)
    function CountTerms()
      local buffers = vim.api.nvim_list_bufs()
      local terminal_count = 0

      for _, buf in ipairs(buffers) do
        if vim.bo[buf].buftype == "terminal" then
          terminal_count = terminal_count + 1
        end
      end
      return terminal_count
    end

    vim.keymap.set("n", "<leader>tn", function()
	local command = CountTerms() + 1 .. "ToggleTerm"
	vim.cmd(command)
end, { noremap = true, silent = true, desc = "New" })


    -- Close the terminal
    vim.api.nvim_set_keymap("n", "<leader>tc", ":bwipeout!<CR>", { noremap = true, silent = true })
  end,
}
