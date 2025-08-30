local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
  s("def", {
    t("def "),
    i(1, "function_name"),
    t("("),
    i(2),
    t({ "):", "    " }),
    i(0),
  }),
  s("class", {
    t("class "),
    i(1, "ClassName"),
    t({ ":", "    def __init__(self, " }),
    i(2, "args"),
    t({ "):", "        " }),
    i(0),
  }),
  s("ifmain", {
    t({ 'if __name__ == "__main__":', "    " }),
    i(0),
  }),
})
