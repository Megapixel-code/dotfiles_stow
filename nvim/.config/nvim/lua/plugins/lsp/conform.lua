return {
   "stevearc/conform.nvim",
   opts = {
      formatters_by_ft = {
         lua = { "emmylua-codeformat" }, -- lua formatter, look in .editorconfig

         sh = { "shfmt" },               -- bash formatter, look in .editorconfig
         zsh = { "shfmt" },
      },
      notify_on_error = true,
      notify_no_formatters = true,
   },
}
