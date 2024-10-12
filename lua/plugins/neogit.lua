return {
    "TimUntersberger/neogit",
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup({})
    end
}

