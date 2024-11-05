vim.cmd("colorscheme catppuccin")

local is_transparent = false -- Variable para controlar el estado

function toggle_transparency()
	if is_transparent then
		-- Restablecer a opacidad normal (ajusta según tus preferencias)
		vim.cmd("highlight Normal guibg=#282828")     -- Color de fondo normal
		is_transparent = false
	else
		-- Hacer transparente
		vim.cmd("highlight Normal guibg=none")     -- Fondo transparente
		is_transparent = true
	end
end

-- Mapeo de teclas para activar la función (ejemplo: <Leader>t)
vim.api.nvim_set_keymap('n', '<Leader>ns', ':lua toggle_transparency()<CR>', { noremap = true, silent = true })
