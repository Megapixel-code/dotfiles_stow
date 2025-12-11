return {
   "stevearc/conform.nvim",
   opts = {
      formatters_by_ft = {
         sh = { "shfmt" },      -- bash, look in .editorconfig
         zsh = { "shfmt" },     -- ^

         css = { "prettierd" }, -- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml formatter

         -- typst = { "typstyle" }, -- typst
         nix = { "nixfmt" }, -- nix
      },
      -- formatters = {
      --    typstyle = {
      --       inherit = false,
      --       stdin = false,
      --       command = "typstyle",
      --       args = { "-i", "@%" },
      --    },
      -- },

      notify_on_error = true,
      notify_no_formatters = true,
      log_level = vim.log.levels.TRACE,
   },
}
