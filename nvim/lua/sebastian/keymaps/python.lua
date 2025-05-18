local M = {}

Terminal = require("toggleterm.terminal").Terminal
Python_terminal = Terminal:new({
  direction = "horizontal",
  close_on_exit = false,
})

function Python_script()
  local file_path = vim.fn.expand('%:p')

  if file_path ~= "" then
    local cmd = "python " .. file_path

    if not Python_terminal:is_open() then
      Python_terminal:open()
    end
    Python_terminal:send(cmd)
  else
  end
end

function M.setup(bufnr)
  vim.keymap.set('n', '<leader>v', function()
    Python_script()
  end, { buffer = bufnr })
end

return M
