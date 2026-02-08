return {
   "jakemason/ouroboros",
   dependency = { "nvim-lua/plenary.nvim" },

   ft = { "c", "cpp" },
   opts = {
      extension_preferences_table = {
         -- Higher numbers are a heavier weight and thus preferred.
         c = { h = 2, hpp = 1 },
         h = { c = 2, cpp = 1 },
         cpp = { hpp = 2, h = 1 },
         hpp = { cpp = 2, c = 1 },

         -- Ouroboros supports any combination of filetypes you like, simply
         -- myext = { myextsrc = 2, myextoldsrc = 1},
      },
      -- if this is true and the matching file is already open in a pane, we'll
      -- switch to that pane instead of opening it in the current buffer
      switch_to_open_pane_if_possible = true,
   },
}
