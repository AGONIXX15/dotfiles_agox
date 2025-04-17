local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets('python', {
    s('normalpython', {
        t({
					"if __name__ == '__main__':",
					"	pass"
        }),
    }),
})

ls.add_snippets('python', {
    s('forrange', {
        t("for "),
        i(1, "x"),  -- Nodo de inserción para la variable del bucle
        t(" in range("),
        i(2, "algo"),  -- Nodo de inserción para el límite superior
        t("):"),
        t({"", "\t"}), -- Nueva línea y tabulación para el cuerpo del bucle
        i(0),  -- Nodo de inserción para el cuerpo del bucle
    }),
})

