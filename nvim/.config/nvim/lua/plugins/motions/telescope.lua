return {
   "nvim-telescope/telescope.nvim",
   tag = "0.1.8",
   dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   },
   config = function()
      require( "telescope" ).setup( {
         defaults = {
            layout_strategy = "vertical",
            layout_config = {
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
            },
         },

         pickers = {
            find_files = {
               hidden = true,
            },
         },
         fzf = {},
      } )

      require( "telescope" ).load_extension( "fzf" )

      vim.keymap.set( "n", "<leader>sf", require( "telescope.builtin" ).find_files, { desc = "Search Files" } )
      vim.keymap.set( "n", "<leader>sh", require( "telescope.builtin" ).help_tags,  { desc = "Search Help" } )
      vim.keymap.set( "n", "<leader>sn", function()
                         require( "telescope.builtin" ).find_files( {
                            cwd = vim.fn.stdpath( "config" ),
                         } )
                      end, { desc = "Search Neovim" } )
      vim.keymap.set( "n", "<leader>sp", function()
                         require( "telescope.builtin" ).find_files( {
                            cwd = vim.fs.joinpath( vim.fn.stdpath( "data" ), "lazy" ),
                         } )
                      end, { desc = "Search Plugins" } )

      require( "config.telescope.multigrep" ).setup()
   end,
}
