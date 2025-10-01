-- use ":help lspconfig-all"
-- use ":Mason"

return {
   {
      "mason-org/mason-lspconfig.nvim",
      opts = {
         ensure_installed = { "lua_ls", "java_language_server" },

         vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      },
   },



   {
      "neovim/nvim-lspconfig",
      dependencies = {
         "folke/lazydev.nvim",
         -- ft = "lua", -- only load on lua files
         opts = {
            library = {
               -- See the configuration section for more details
               -- Load luvit types when the `vim.uv` word is found
               { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
         },
      },
      setup = function()
         vim.lsp.config("lua_ls", {})
         vim.lsp.config("java_language_server", {})
      end,
   },
}
