return {
  {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup {
        options = {
 					hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        	},
          numbers = "none",
          close_icon = "",
          right_mouse_button = "close",
          left_mouse_button = "select",
          middle_mouse_button = "close",
          indicator_icon = "▎",
          buffer_close_icon = "",
          modified_icon = "●",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            return "(" .. count .. ")"
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            }
          },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
        }
      }

      vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>bc', ':BufferLineClose<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>$', '<Cmd>BufferLineGoToBuffer -1<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>cl', ':BufferLineCloseLeft<CR>', {noremap = true, silent = true})
			vim.api.nvim_set_keymap('n', '<leader>cr', ':BufferLineCloseRight<CR>', {noremap = true, silent = true})

    end
  }
}

