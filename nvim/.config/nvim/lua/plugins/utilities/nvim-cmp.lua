return {
   "hrsh7th/nvim-cmp",

   dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "petertriho/cmp-git",

      "onsails/lspkind.nvim",
   },

   config = function()
      local cmp = require( "cmp" )
      local cmp_autopairs = require( "nvim-autopairs.completion.cmp" )
      local lspkind = require( "lspkind" )
      local luasnip = require( "luasnip" )

      cmp.setup( {
         expand = function( args )
            luasnip.lsp_expand( args.body )
         end,
         window = {
            completion = cmp.config.window.bordered( { max_height = 8 } ),
            documentation = cmp.config.window.bordered( { max_height = 8 } ),
         },
         mapping = cmp.mapping.preset.insert( {
            ["<C-u>"] = cmp.mapping.scroll_docs( 4 ),
            ["<C-d>"] = cmp.mapping.scroll_docs( -4 ),
            ["<c-y>"] = cmp.mapping.confirm( { select = true } ), -- accept even if not explicitly selected
         } ),
         sources = cmp.config.sources( {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
         } ),
         formatting = {
            fields = { "abbr", "icon", "kind", "menu" },
            format = lspkind.cmp_format( {
               with_text = false;
               menu = {
                  buffer = "[buf]",
                  nvim_lsp = "[lsp]",
                  path = "[path]",
                  luasnip = "[snip]",
                  git = "[git]",
               },
            } ),
         },
      } )

      cmp.setup.filetype( "gitcommit", {
         sources = cmp.config.sources( {
            { name = "luasnip", priority = 100 },
            { name = "git" },
            { name = "buffer" },
         } ),
      } )

      cmp.setup.cmdline( { "/", "?" }, {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = "buffer" },
         },
      } )

      cmp.setup.cmdline( ":", {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources( {
            { name = "path" },
            { name = "cmdline" },
         } ),
         --- disable the prompt for some cmds
         enabled = function()
            local disabled_commands = {
               q = true,
               w = true,
               wq = true,
            }
            -- first word of the cmdline
            local cmd = vim.fn.getcmdline():match( "%S+" )

            -- true if cmd not disabled
            -- else call and return cmp.close() which return false
            return not disabled_commands[cmd] or cmp.close()
         end,
         -- matching = { disallow_symbol_nonprefix_matching = false },
      } )

      -- add parentheses after selecting function
      cmp.event:on( "confirm_done", cmp_autopairs.on_confirm_done() )
   end,
}
