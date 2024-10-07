return {
  "lewis6991/gitsigns.nvim",
  config = function()
		require('gitsigns').setup {
    signs = {
        add = { text = '│' },            -- Signo para líneas añadidas
        change = { text = '│' },         -- Signo para líneas cambiadas
        delete = { text = '_' },         -- Signo para líneas borradas
        topdelete = { text = '‾' },      -- Signo para líneas borradas en la parte superior
        changedelete = { text = '~' },   -- Signo para líneas cambiadas y borradas
    },
    on_attach = function(bufnr)
				vim.keymap.set('n', '<leader>gn', '<cmd>Gitsigns next_hunk<CR>', { buffer = bufnr, desc = 'Next Hunk' })
        vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns prev_hunk<CR>', { buffer = bufnr, desc = 'Previous Hunk' })
        vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns preview_hunk<CR>', { buffer = bufnr, desc = 'Preview Hunk' })
        vim.keymap.set('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', { buffer = bufnr, desc = 'Reset Hunk' })
        vim.keymap.set('n', '<leader>gR', '<cmd>Gitsigns reset_buffer<CR>', { buffer = bufnr, desc = 'Reset Buffer' })
        vim.keymap.set('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', { buffer = bufnr, desc = 'Stage Hunk' })
        vim.keymap.set('n', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>', { buffer = bufnr, desc = 'Undo Stage Hunk' })
        vim.keymap.set('n', '<leader>gt', '<cmd>ToggleTerm cmd="git"<CR>', { buffer = bufnr, desc = 'Git Terminal' })
    end,
}

-- Define los highlights
vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })
	end
}

