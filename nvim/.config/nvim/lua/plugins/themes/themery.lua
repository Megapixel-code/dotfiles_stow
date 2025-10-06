return {
   "zaldih/themery.nvim",
   lazy = false,
   config = function()
      -- set keymap
      vim.keymap.set("n", "<leader>st", "<cmd>Themery<CR>", { desc = "Search themes" })

      require("themery").setup({
         livePreview = true,
         themes = {
            --[[ dark themes : ]]
            {
               colorscheme = "moonfly",
               name = "moonfly",
            },
            {
               colorscheme = "github_dark_default",
               name = "github",
            },

            --[[ medium themes : ]]
            {
               colorscheme = "gruvbox-material",
               name = "gruvbox",
               before = [[
                  vim.g.gruvbox_material_background = 'medium'
                  vim.cmd('set background=dark')
               ]]
            },
            {
               colorscheme = "sonokai",
               name = "sonokai",
               before = [[
                  vim.g.sonokai_style = 'default'
               ]],
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

            --[[ original themes : ]]
            {
               colorscheme = "evergarden-winter",
               name = "evergarden",
            },
            {
               colorscheme = "sonokai",
               name = "sonokai_espresso",
               before = [[
                  vim.g.sonokai_style = 'espresso'
               ]],
            },
         },
      })
   end
}
--[[
material dark medium
material light medium
--]]
