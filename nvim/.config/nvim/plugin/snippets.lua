local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local rep = extras.rep

vim.keymap.set({ "i", "s" }, "<A-n>", function()
   if ls.expand_or_jumpable() then
      ls.expand_or_jump()
   end
end, { silent = true, desc = "go to next snippet jump" })

vim.keymap.set({ "i", "s" }, "<A-p>", function()
   if ls.jumpable(-1) then
      ls.jump(-1)
   end
end, { silent = true, desc = "go to previous snippet jump" })



ls.add_snippets("gitcommit", {
   s("git_feat", {
      t("feat("),
      i(1),
      t("): "),
      i(2),
   }),
   s("git_fix", {
      t("fix("),
      i(1),
      t("): "),
      i(2),
   }),
   s("git_docs", {
      t("docs("),
      i(1),
      t("): "),
      i(2),
   }),
   s("git_style", {
      t("style("),
      i(1),
      t("): "),
      i(2),
   }),
   s("git_refactor", {
      t("refactor("),
      i(1),
      t("): "),
      i(2),
   }),
   s("git_test", {
      t("test("),
      i(1),
      t("): "),
      i(2),
   }),
   s("git_chore", {
      t("chore("),
      i(1),
      t("): "),
      i(2),
   }),
})



ls.add_snippets("html", {
   s("tag", {
      t("<"), i(1), t(">"),
      t({ "", "\t" }), i(0),
      t({ "", "</" }), rep(1), t(">"),
   })
})
