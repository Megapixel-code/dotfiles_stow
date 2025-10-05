return {
   "zaldih/themery.nvim",
   lazy = false,
   config = function()
      -- set keymap
      vim.keymap.set("n", "<leader>st", "<cmd>Themery<CR>", { desc = "Search themes" })

      require("themery").setup({
         livePreview = true,
         themes = {
            "evergarden-winter",
            "github_dark_default",
            {
               colorscheme = "sonokai",
               name = "sonokai",
               before = [[
                  vim.g.sonokai_style = 'default'
               ]],
            },
            {
               colorscheme = "sonokai",
               name = "sonokai espresso",
               before = [[
                  vim.g.sonokai_style = 'espresso'
               ]],
            },
         },
      })
   end
}
