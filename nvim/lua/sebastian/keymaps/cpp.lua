
 Terminal = require("toggleterm.terminal").Terminal
 Cpp_terminal = Terminal:new({
    direction = "horizontal",
    close_on_exit = false,
})

function Cpp_script()
	--leer string
		local cadena = vim.fn.input("Ingrese el nombre del archivo: ")
    local file_path = vim.fn.expand('%:p')

    if file_path ~= "" then
        local cmd = "g++ " .. file_path .. " -o " .. cadena

        if not Cpp_terminal:is_open() then
            Cpp_terminal:open()
        end
        Cpp_terminal:send(cmd)
    else
    end
end

vim.api.nvim_set_keymap('n', '<leader>v', ':lua Cpp_script()<CR>', { noremap = true, silent = true })

