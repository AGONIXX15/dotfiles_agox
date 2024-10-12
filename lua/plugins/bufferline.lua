return {
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',

  config = function()
    -- Configuración de nvim-web-devicons
    require('nvim-web-devicons').setup {
      default = true -- Habilita íconos por defecto
    }

    -- Configuración de bufferline
    require("bufferline").setup {
      options = {
        always_show_bufferline = true,
        close_icon = "✖",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },
        numbers = "none",
        right_mouse_button = "close",
        left_mouse_button = "select",
        middle_mouse_button = "close",
        indicator_icon = "▎",
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

    -- Mapeo de teclas para la navegación en bufferline
    vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bc', ':BufferLineClose<CR>', { noremap = true, silent = true })

    -- Mapeo de teclas para ir a buffers específicos
    for i = 1, 9 do
      vim.api.nvim_set_keymap('n', '<leader>' .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', { noremap = true, silent = true })
    end

    vim.api.nvim_set_keymap('n', '<leader>$', '<Cmd>BufferLineGoToBuffer -1<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cl', ':BufferLineCloseLeft<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cr', ':BufferLineCloseRight<CR>', { noremap = true, silent = true })
  end
}

