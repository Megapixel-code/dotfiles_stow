return {
   "mikavilpas/yazi.nvim",
   version = "*", -- use the latest stable version
   event = "VeryLazy",
   dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
   },
   opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      hooks = {
         yazi_opened = function( preselected_path, yazi_buffer_id, config )
            vim.keymap.del( "t", "<Esc><Esc>" )
         end,

         yazi_closed_successfully = function( chosen_file, config, state )
            vim.keymap.set( "t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" } )
         end,
      },
      keymaps = {
         show_help = "<f1>",
      },
   },
}
