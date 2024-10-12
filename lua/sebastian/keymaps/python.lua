
 Terminal = require("toggleterm.terminal").Terminal
 Python_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function Python_script()
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "python3 " .. file_path

        if not Python_terminal:is_open() then
            Python_terminal:open()
        end
        Python_terminal:send(cmd)
    else
    end
end

vim.api.nvim_set_keymap('n', '<leader>v', ':lua Python_script()<CR>', { noremap = true, silent = true })

