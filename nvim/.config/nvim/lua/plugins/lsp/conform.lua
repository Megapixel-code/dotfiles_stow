return {
   "stevearc/conform.nvim",
   opts = {
      formatters_by_ft = {
         sh = { "shfmt" }, -- bash formatter, look in .editorconfig
         zsh = { "shfmt" },

         lua = { "emmylua-codeformat" }, -- lua formatter, look in .editorconfig
      },
      notify_on_error = true,
      notify_no_formatters = true,
   },
}
