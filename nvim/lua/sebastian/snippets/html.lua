
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node         -- Texto para el snippet
ls.add_snippets('html', {
    s('normalhtml', {
        t({
            "<!DOCTYPE html>",
            "<html lang=\"en\">",
            "<head>",
            "    <meta charset=\"UTF-8\">",
            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
            "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">",
            "    <title>Document</title>",
            "</head>",
            "<body>",
            "    ",
            "</body>",
            "</html>"
        }),
    }),
})

