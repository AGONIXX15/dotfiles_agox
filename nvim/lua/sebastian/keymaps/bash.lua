local M = {}

 Terminal = require("toggleterm.terminal").Terminal
 Bash_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function Bash_script()
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "chmod +x " .. file_path .. " && " .. file_path

        if not Bash_terminal:is_open() then
            Bash_terminal:open()
        end
        Bash_terminal:send(cmd)
    else
    end
end

function M.setup(bufnr)
  vim.keymap.set('n', '<leader>v', function ()
    Bash_script()
  end, {buffer=bufnr})
end

return M
