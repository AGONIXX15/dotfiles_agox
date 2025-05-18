
local M = {}
 Terminal = require("toggleterm.terminal").Terminal
 Lua_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function Lua_script()
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "lua " .. file_path

        if not Lua_terminal:is_open() then
            Lua_terminal:open()
        end
        Lua_terminal:send(cmd)
    else
    end
end

function M.setup(bufnr)
  vim.keymap.set('n', '<leader>v', function ()
    Lua_script()
  end, {buffer = bufnr})
end

return M
