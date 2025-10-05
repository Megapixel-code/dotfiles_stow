-- use ":help lspconfig-all"
-- use ":Mason"

return {
   {
      "mason-org/mason-lspconfig.nvim",
      opts = {
         ensure_installed = {
            "lua_ls",
            "jdtls",
         },
         automatic_installation = true,

         vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      },
   },

   {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      config = function()
         require('mason-tool-installer').setup({
            ensure_installed = {
               "java-debug-adapter",
               "java-test",
            }
         })
      end
   },

   {
      "neovim/nvim-lspconfig",
      dependencies = {
         'saghen/blink.cmp',
         'folke/lazydev.nvim',
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
         -- capabilities for completion
         local capabilities = require('blink.cmp').get_lsp_capabilities()

         -- per language config, dont add jdtls here
         vim.lsp.config("lua_ls", { capabilities = capabilities })

         -- Auto-format ("lint") on save.
         vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
               local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
               if not client then return end

               if client:supports_method('textDocument/formatting') then
                  vim.api.nvim_create_autocmd('BufWritePre', {
                     group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                     buffer = args.buf,
                     callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                     end,
                  })
               end
            end,
         })
      end,
   },
}
