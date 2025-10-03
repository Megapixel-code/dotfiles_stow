-- use ":help lspconfig-all"
-- use ":Mason"

return {
   {
      "mason-org/mason-lspconfig.nvim",
      opts = {
         ensure_installed = { "lua_ls" },

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
      config = function()
         vim.lsp.config("lua_ls", {})
      end,
   },
}
