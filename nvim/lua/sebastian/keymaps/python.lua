
local Terminal = require("toggleterm.terminal").Terminal
local python_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function python_script()
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "python3 " .. file_path

        if not python_terminal:is_open() then
            python_terminal:open()
        end
        python_terminal:send(cmd)
    else
    end
end

vim.api.nvim_set_keymap('n', '<leader>v', ':lua python_script()<CR>', { noremap = true, silent = true })

