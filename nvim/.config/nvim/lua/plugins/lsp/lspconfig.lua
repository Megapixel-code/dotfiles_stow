-- :h lspconfig-all
-- TODO: remove mason

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
         "hrsh7th/cmp-nvim-lsp",
      },
      config = function()
         -- capabilities for completion
         local capabilities = require( "cmp_nvim_lsp" ).default_capabilities()
         -- FIX: lsp snippet uses tab instad of c-j c-k

         if os.getenv( "NIXOS_NVIM" ) == "1" then
            -- [[ NIXOS CONFIG HERE ]]
            M = {
               { -- Lua lsp
                  name = "lua_ls",
                  args = {
                     capabilities = capabilities,
                  },
               },
               {                    -- Python lsp
                  name = "pyrefly", -- FIXME: not working ?
                  args = {
                     capabilities = capabilities,
                  },
               },
               { -- C, Cpp, ... lsp
                  name = "clangd",
                  args = {
                     capabilities = capabilities,
                  },
               },
               { -- Bash, Zsh lsp
                  name = "bashls",
                  args = {
                     capabilities = capabilities,
                     filetypes = { "bash", "sh", "zsh" },
                  },
               },
               { -- Json, Jsonc lsp
                  name = "jsonls",
                  args = {
                     capabilities = capabilities,
                  },
               },
               { -- CSS lsp
                  name = "cssls",
                  args = {
                     capabilities = capabilities,
                  },
               },
               { -- Html lsp
                  name = "superhtml",
                  args = {
                     capabilities = capabilities,
                  },
               },
               { -- Typst lsp
                  name = "tinymist",
                  args = {
                     capabilities = capabilities,
                     settings = { formatterMode = "typstyle" },
                  },
               },
               { -- Nix lsp
                  name = "nil_ls",
                  args = {
                     capabilities = capabilities,
                  },
               },
               { -- Nix lsp
                  name = "nixd",
                  args = {
                     capabilities = capabilities,
                  },
               },
               { -- Scala lsp
                  name = "metals",
                  args = {
                     capabilities = capabilities,
                  },
               },
               {                  -- QML lsp
                  name = "qmlls", -- TODO: cant find ?
                  args = {
                     capabilities = capabilities,
                  },
               },
            }

            for _, server in ipairs( M ) do
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
