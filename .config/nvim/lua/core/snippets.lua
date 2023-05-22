ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.setup({
	history = true,
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxGreen" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

-- keymaps
vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end)
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

ls.add_snippets("all", {
	s(
		"()",
		fmt(
			[[
  () => {{
    {}
  }}
  ]],
			{
				i(1, "statements"),
			}
		)
	),
	s(
		"proc",
		fmt(
			[[
  process.env.{}
  ]],
			{
				i(1, "environment_variable"),
			}
		)
	),
	s(
		"creq",
		fmt(
			[[
    const {} = require("{}");
    ]],
			{
				i(1, "package_name"),
				i(2, "package_name"),
			}
		)
	),
	s(
		"clg",
		fmt(
			[[
    console.log({});
    ]],
			{
				i(1, " "),
			}
		)
	),
	s(
		"docce",
		fmt(
			[[
    document.createElement("{}");
    ]],
			{
				i(1, "html_element"),
			}
		)
	),
	s(
		"docgi",
		fmt(
			[[
    document.getElementById("{}");
    ]],
			{
				i(1, "css_selector"),
			}
		)
	),
	s(
		"docgc",
		fmt(
			[[
    document.getElementsByClassName("{}");
    ]],
			{
				i(1, "css_selector"),
			}
		)
	),
	s(
		"docqs",
		fmt(
			[[
    document.querySelector("{}");
    ]],
			{
				i(1, "css_selector"),
			}
		)
	),
	s(
		"docqsa",
		fmt(
			[[
    document.querySelectorAll("{}");
    ]],
			{
				i(1, "css_selector"),
			}
		)
	),
	s("ternary", {
		i(1, "cond"),
		t(" ? "),
		i(2, "then"),
		t(" : "),
		i(3, "else"),
	}),
	s(
		"useS",
		fmt(
			[[
    const [{}, set{}] = useState({});
    ]],
			{
				i(1, "value"),
				i(2, "Value"),
				i(3, ""),
			}
		)
	),
	s(
		"rafce",
		fmt(
			[[
const {} = () => {{
  return (
    <>
      <h1>{}</h1>
    </>
  )
}};

export default {};
  ]],
			{
				i(1, "App"),
				rep(1),
				rep(1),
			}
		)
	),
	s(
		"fmt1",
		fmt("To {title} {} {}.", {
			i(2, "Name"),
			i(3, "Surname"),
			title = c(1, { t("Mr."), t("Ms.") }),
		})
	),
})
