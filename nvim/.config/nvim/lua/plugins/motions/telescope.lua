return {
   "nvim-telescope/telescope.nvim",
   version = "*",
   dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   },
   config = function()
      local telescope = require( "telescope" )

      telescope.setup( {
         defaults = {
            layout_strategy = "vertical",
            layout_config = {
               -- TODO: adjust with editor width and height
               vertical = {
                  prompt_position = "bottom",
                  height = 0.9,
                  width = 0.6,
               },
            },
            prompt_prefix = "λ ",
            selection_caret = " ",
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

            file_ignore_patterns = {
               ".git/",
               "%.pdf",
               "%.mp4",
               "%.mkv",
               "%.png",
            },
         },

         pickers = {
            find_files = {
               hidden = true,
            },
         },
         fzf = {},
      } )

      telescope.load_extension( "fzf" )

      require( "config.telescope.multigrep" ).setup()
   end,
}
