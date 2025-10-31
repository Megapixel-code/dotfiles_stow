return {
   "zaldih/themery.nvim",
   lazy = false,
   config = function()
      -- set keymap
      vim.keymap.set("n", "<leader>st", "<cmd>Themery<CR>", { desc = "Search Themes" })

      require("themery").setup({
         livePreview = true,
         themes = {
            --[[ dark themes : ]]
            {
               colorscheme = "monochrome",
               name = "monochrome",
            },
            {
               colorscheme = "github_dark_default",
               name = "github",
            },
            {
               colorscheme = "lackluster",
               name = "lackluster",
            },
            {
               colorscheme = "moonfly",
               name = "moonfly",
            },
            {
               colorscheme = "vague",
               name = "vague",
            },

            --[[ medium themes : ]]
            {
               colorscheme = "kanagawa-paper-ink",
               name = "kanagawa-paper-ink",
            },
            {
               colorscheme = "evergarden-winter",
               name = "evergarden",
            },

            --[[ original themes : ]]
            {
               colorscheme = "sonokai",
               name = "sonokai_espresso",
               before = [[
                  vim.g.sonokai_style = 'espresso'
               ]],
            },
            {
               colorscheme = "fluoromachine",
               name = "fluoromachine",
            },

            --[[ light themes : ]]
            {
               colorscheme = "gruvbox-material",
               name = "gruvbox_light",
               before = [[
                  vim.g.gruvbox_material_background = 'soft'
                  vim.cmd('set background=light')
               ]]
            },
         },
      })
   end
}
