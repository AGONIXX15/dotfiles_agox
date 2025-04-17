Terminal = require("toggleterm.terminal").Terminal
Cpp_terminal = Terminal:new({
  direction = "horizontal",
  close_on_exit = false,
})

function Cpp_script()
  --leer string
  local file_path = vim.api.nvim_buf_get_name(0)
  print(file_path)
  local extension = string.match(file_path, "%a+$")
  print(extension)
  local name = string.sub(file_path, 1, -5) --main.cpp


  if file_path ~= "" then
    local cmd = "g++ " .. file_path .. " -o " .. name .. " && " .. name

    if not Cpp_terminal:is_open() then
      Cpp_terminal:open()
    end
    Cpp_terminal:send(cmd)
  else
  end
end

vim.api.nvim_set_keymap('n', '<leader>v', ':lua Cpp_script()<CR>', { noremap = true, silent = true })
