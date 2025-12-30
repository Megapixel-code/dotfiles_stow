return {
   "saghen/blink.cmp",
   version = "1.*",

   --- @module 'blink.cmp'
   --- @type blink.cmp.Config
   opts = {
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = { preset = "default" },

      appearance = {
         nerd_font_variant = "mono",
      },

      completion = { -- box appearing when you start typing
         documentation = { auto_show = false },
         menu = {
            border = "none",       -- same as :h winborder
            draw = {
               padding = { 1, 1 }, -- padding on both sides
            }
         },
      },
      signature = { -- box with documentation when filling function variables
         enabled = true,
         window = { border = 'single' },
      },

      snippets = {
         preset = "luasnip"
      },

      sources = {
         default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
   },
   opts_extend = { "sources.default" },
}
