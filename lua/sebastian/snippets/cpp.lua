local ls = require('luasnip')  -- Cargar LuaSnip
local s = ls.snippet           -- Definir snippet
local t = ls.text_node         -- Texto para el snippet
local i = ls.insert_node       -- Nodo de inserción

-- Define un snippet para cpp básico
ls.add_snippets('cpp', {
    s('normalcpp', {   -- El trigger del snippet
        t({
					"#include <iostream>",
					"#include <vector>",
					"",
					"int main()",
					"{",
					" ",
					"return 0;";
					"}"
        }),
    }),
})

-- Define un snippet para imprimir en cpp
ls.add_snippets('cpp', {
	s('print', {
		t("std::cout << "),
		i(1,""),
	}),
})

-- finalizar linea con endl
ls.add_snippets('cpp', {
	s('endl', {
		t("<< std::endl;")
	})
})

-- condicional
ls.add_snippets('cpp', {
	s('if', {
		t("if("),
		i(1,""),
		t(") {"),
		i(2,""),
		t("}")
	})
})

-- bucle for
ls.add_snippets('cpp', {
	s('for', {
		t("for("),
		i(1,""),
		t(";"),
		i(2,""),
		t(";"),
		i(3,""),
		t(") {"),
		i(4,""),
		t("}")
	})
})
	

-- vector
ls.add_snippets('cpp', {
	s('vector', {
		t("std::vector<"),
		i(1,"type"),
		t("> "),
		i(2,"name"),
		t(";")
	})
})

