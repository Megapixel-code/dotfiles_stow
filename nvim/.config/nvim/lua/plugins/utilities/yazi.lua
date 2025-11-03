return {
   "mikavilpas/yazi.nvim",
   version = "*", -- use the latest stable version
   event = "VeryLazy",
   dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
   },
   keys = {
      -- 👇 in this section, choose your own keymappings!
      {
         "<leader>y",
         mode = { "n", "v" },
         "<cmd>Yazi<cr>",
         desc = "open yazi at the current file",
      },
      {
         -- Open in the current working directory
         "<leader>yc",
         "<cmd>Yazi cwd<cr>",
         desc = "open Yazi in nvim Cwd",
      },
      {
         "<c-up>",
         "<cmd>Yazi toggle<cr>",
         desc = "Resume the last yazi session",
      },
   },
   opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
         show_help = "<f1>",
      },
   },
}
