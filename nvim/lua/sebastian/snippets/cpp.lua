local ls = require('luasnip')  -- Cargar LuaSnip
local s = ls.snippet           -- Definir snippet
local t = ls.text_node         -- Texto para el snippet

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

