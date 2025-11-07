return {
   "stevearc/conform.nvim",
   opts = {
      formatters_by_ft = {
         sh = { "shfmt" }, -- bash formatter, look in .editorconfig
         zsh = { "shfmt" },

         lua = { "emmylua-codeformat" }, -- lua formatter, look in .editorconfig

         html = { "prettierd" },         -- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml formatter
         css = { "prettierd" },
      },
      notify_on_error = true,
      notify_no_formatters = true,
   },
}
