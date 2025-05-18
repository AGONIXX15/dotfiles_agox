
local M = {}
 Terminal = require("toggleterm.terminal").Terminal
 Js_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function Js_script()
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "node " .. file_path

        if not Js_terminal:is_open() then
            Js_terminal:open()
        end
        Js_terminal:send(cmd)
    else
    end
end

function M.setup(bufnr)
  vim.keymap.set('n', '<leader>v', function ()
    Js_script()
  end, {buffer=bufnr})
end

return M

