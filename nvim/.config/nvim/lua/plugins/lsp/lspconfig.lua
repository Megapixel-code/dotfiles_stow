-- use ":help lspconfig-all"
-- use ":Mason"

return {
   {
      "mason-org/mason-lspconfig.nvim",
      cond = function()
         if os.getenv( "NIXOS_NVIM" ) == "1" then
            return false
         end
         return true
      end,
      opts = {
         ensure_installed = {
            "clangd",   -- c and cpp
            "bashls",   -- bash

            "lua_ls",   -- lua
            "jdtls",    -- java; do not configure, configured in java.lua

            "html",     -- html
            "tinymist", -- typst
            "qmlls",    -- qml
            -- "nixd", -- nix
            "nil_ls",   -- nix also
         },
      },
   },

   {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      cond = function()
         if os.getenv( "NIXOS_NVIM" ) == "1" then
            return false
         end
         return true
      end,
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

            "prettierd",          -- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml
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
      },
      config = function()
         -- capabilities for completion
         local capabilities = require( "blink.cmp" ).get_lsp_capabilities()

         if os.getenv( "NIXOS_NVIM" ) == "1" then
            -- [[ NIXOS CONFIG HERE ]]
            M = {
               {
                  name = "lua_ls",
                  args = {
                     capabilities = capabilities,
                  },
               },
               {
                  name = "clangd",
                  args = {
                     capabilities = capabilities,
                  },
               },
               {
                  name = "bashls",
                  args = {
                     capabilities = capabilities,
                     filetypes = { "bash", "sh", "zsh" },
                  },
               },
               { -- TODO: cant find ?
                  name = "html",
                  args = {
                     capabilities = capabilities,
                  },
               },
               {
                  name = "tinymist",
                  args = {
                     capabilities = capabilities,
                     settings = { formatterMode = "typstyle" },
                  },
               },
               {
                  name = "nil_ls",
                  args = {
                     capabilities = capabilities,
                  },
               },
               {
                  name = "nixd",
                  args = {
                     capabilities = capabilities,
                  },
               },
               { -- TODO: cant find ?
                  name = "qmlls",
                  args = {
                     capabilities = capabilities,
                  },
               },
            }

            --- @diagnostic disable-next-line: unused-local
            for i, server in ipairs( M ) do
               vim.lsp.config( server.name, server.args )
               vim.lsp.enable( server.name )
            end
         else
            -- [[ OTHER DISTROS CONFIG HERE ]]
            -- per language config, dont add jdtls here
            vim.lsp.config( "lua_ls", { capabilities = capabilities } )
            vim.lsp.config( "clangd", { capabilities = capabilities } )
            vim.lsp.config( "bashls", {
               capabilities = capabilities,
               filetypes = { "bash", "sh", "zsh" },
            } )
            vim.lsp.config( "html", { capabilities = capabilities } )
            vim.lsp.config( "tinymist", {
               capabilities = capabilities,
               settings = { formatterMode = "typstyle" },
            } )
            vim.lsp.config( "qmlls", { capabilities = capabilities } )
         end
      end,
   },
}
