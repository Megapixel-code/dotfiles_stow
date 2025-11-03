-- use ":help lspconfig-all"
-- use ":Mason"

return {
   {
      "mason-org/mason-lspconfig.nvim",
      opts = {
         ensure_installed = {
            "clangd",   -- c and cpp
            "bashls",   -- bash

            "lua_ls",   -- lua
            "jdtls",    -- java; do not configure, configured in java.lua

            "html",     -- html
            "tinymist", -- typst
         },
      },
   },

   {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      config = function()
         local ensure_installed = {}

         -- DAP
         vim.list_extend( ensure_installed, {
            "java-debug-adapter",
            "java-test",
         } )

         -- Formatters
         vim.list_extend( ensure_installed, {
            "shfmt",              -- bash

            "emmylua-codeformat", -- lua
         } )

         require( "mason-tool-installer" ).setup( {
            ensure_installed = ensure_installed,
         } )
      end,
   },

   {
      "neovim/nvim-lspconfig",
      dependencies = {
         "saghen/blink.cmp",
         "folke/lazydev.nvim",
         opts = {
            library = {
               -- See the configuration section for more details
               -- Load luvit types when the `vim.uv` word is found
               { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
         },
      },
      config = function()
         -- capabilities for completion
         local capabilities = require( "blink.cmp" ).get_lsp_capabilities()

         -- per language config, dont add jdtls here
         vim.lsp.config( "lua_ls", { capabilities = capabilities } )
         vim.lsp.config( "clangd", { capabilities = capabilities } )
         vim.lsp.config( "bashls", {
            capabilities = capabilities,
            filetypes = { "bash", "sh", "zsh" },
         } )
         vim.lsp.config( "html",     { capabilities = capabilities } )
         vim.lsp.config( "tinymist", { capabilities = capabilities } )
      end,
   },
}
