local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('java', {
    s('psvm', {
        t({
					"	public static void main(String[] args) {",
					"	System.out.println(\"Hello, World!\");",
					"	}",
        }),
    }),
})

ls.add_snippets('java', {
		s('print', {
		t ("System.out.println("),
		i(1,""),
		t(");"),
		}),
})
--for
ls.add_snippets('java', {
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



