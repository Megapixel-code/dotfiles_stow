return {
   "nvim-telescope/telescope.nvim",
   tag = "0.1.8",
   dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   },
   config = function()
      local telescope = require( "telescope" )
      local telescope_builtins = require( "telescope.builtin" )

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

      vim.keymap.set( "n", "<leader>sf", telescope_builtins.find_files,    { desc = "Search Files" } )
      vim.keymap.set( "n", "<leader>sh", telescope_builtins.help_tags,     { desc = "Search Help" } )
      vim.keymap.set( "n", "<leader>sm", telescope_builtins.marks,         { desc = "Search Marks" } )
      vim.keymap.set( "n", "<leader>ss", telescope_builtins.spell_suggest, { desc = "Search Spelling" } )
      vim.keymap.set( "n", "<leader>sn", function()
                         telescope_builtins.find_files( {
                            cwd = vim.fn.stdpath( "config" ),
                         } )
                      end, { desc = "Search Neovim" } )
      vim.keymap.set( "n", "<leader>sp", function()
                         telescope_builtins.find_files( {
                            cwd = vim.fs.joinpath( vim.fn.stdpath( "data" ), "lazy" ),
                         } )
                      end, { desc = "Search Plugins" } )

      require( "config.telescope.multigrep" ).setup()
   end,
}
