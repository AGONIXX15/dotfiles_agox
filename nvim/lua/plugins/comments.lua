return {
    'numToStr/Comment.nvim',
		config = function ()
		require('Comment').setup()
		require("Comment").setup({
    padding = true,                  -- Añade espacio en blanco después del comentario
    sticky = true,                   -- Mantiene el cursor en la misma posición después de comentar
    ignore = '^$',                   -- Ignora líneas vacías
    toggler = {
        line = 'gcc',                -- Tecla para comentar/descomentar líneas
        block = 'gbc',               -- Tecla para comentar/descomentar bloques
    },
    opleader = {
        line = 'gc',                 -- Tecla de operación para comentar líneas
        block = 'gb',                -- Tecla de operación para comentar bloques
    },
		mappings = {
        basic = true,  -- Habilitar los mapeos básicos (gcc, gc en visual)
        extra = true,  -- Habilitar mapeos adicionales (gco, gcO, gcA)
    },
    pre_hook = function(ctx)
    end,
    post_hook = function(ctx)
    end,
	dependencies = { "nvim-lua/plenary.nvim"},
})
		end
}

