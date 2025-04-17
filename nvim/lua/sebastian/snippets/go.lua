local ls = require('luasnip')  -- Cargar LuaSnip
local s = ls.snippet           -- Definir snippet
local t = ls.text_node         -- Texto para el snippet
local i = ls.insert_node       -- Nodo de inserción

-- Define un snippet para go básico
ls.add_snippets('go', {
		s('normalgo', {   -- El trigger del snippet
				t({
					"package main",
					"",
					"import (",
					"	\"fmt\"",
					")",
					"",
					"func main() {",
					" ",
					"}"
				}),
		}),
})

--print
ls.add_snippets('go', {
	s('print', {
		t("fmt.Println("),
		i(1,""),
		t(")")
	}),
})

--printf
ls.add_snippets('go', {
	s('printf', {
		t("fmt.Printf("),
		i(1,""),
		t(")")
	}),
})

--Sprint para concatenar a strings
ls.add_snippets('go', {
	s('sprint', {
		t("fmt.Sprint("),
		i(1,""),
		t(")")
	}),
})
