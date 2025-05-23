
local M = {}
 Terminal = require("toggleterm.terminal").Terminal
 Ruby_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function Ruby_script()
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "ruby " .. file_path

        if not Ruby_terminal:is_open() then
            Ruby_terminal:open()
        end
        Ruby_terminal:send(cmd)
    else
    end
end


function M.setup(bufnr)
  vim.keymap.set('n', '<leader>v', function ()
    Ruby_script()
  end, {buffer=bufnr})
 end


return M
