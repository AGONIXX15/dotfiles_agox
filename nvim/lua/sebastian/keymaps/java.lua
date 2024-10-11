
 Terminal = require("toggleterm.terminal").Terminal
 Java_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function Java_script()
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "javac " .. file_path .. " && " .. "java " .. file_path

        if not Java_terminal:is_open() then
            Java_terminal:open()
        end
        Java_terminal:send(cmd)
    else
    end
end

vim.api.nvim_set_keymap('n', '<leader>v', ':lua Java_script()<CR>', { noremap = true, silent = true })

