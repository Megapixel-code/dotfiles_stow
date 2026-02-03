return {
   -- "Megapixel-code/color-skimer.nvim",
   -- OR localy:
   dir = "~/documents/projects/aider.nvim",

   opts = {},
   config = function()
      vim.api.nvim_set_keymap( "n", "<leader>a", "<cmd>Aider<CR>", { desc = "Aider plugin" } )
   end,
}
