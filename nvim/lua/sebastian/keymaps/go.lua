local M = {}
 Terminal = require("toggleterm.terminal").Terminal
 Go_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function Go_script()
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "go run " .. file_path

        if not Go_terminal:is_open() then
            Go_terminal:open()
        end
        Go_terminal:send(cmd)
    else
    end
end

function M.setup(bufnr)
  vim.keymap.set('n', '<leader>v', function ()
    Go_script()
  end, {buffer=bufnr})
end

return M
