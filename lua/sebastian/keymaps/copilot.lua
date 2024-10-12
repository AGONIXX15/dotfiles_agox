
function ToggleCopilot()
	print(vim.g.copilot_enabled)
  if vim.g.copilot_enabled == 1 then
    vim.cmd('Copilot disable')
		print("Copilot deshabilitado")
	else
    vim.cmd('Copilot enable')
    print("Copilot habilitado")
  end
end



vim.api.nvim_set_keymap('n', '<leader>ct', ':lua ToggleCopilot()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-e>', 'copilot#Accept()', { silent = true, expr = true })
