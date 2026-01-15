local function get_themes()
   local theme_list = {
      "tes",
   }
end


return {
   "zaldih/themery.nvim",
   lazy = false,
   config = function()
      -- set keymap
      vim.keymap.set( "n", "<leader>st", "<cmd>Themery<CR>", { desc = "Search Themes" } )

      require( "themery" ).setup( {
         livePreview = true,
         themes = {
            --
            --
            --[[ dark themes : ]]
            {
               colorscheme = "github_dark_default",
               name = "github",
            },
            {
               colorscheme = "vscode",
               name = "vscode",
            },
            {
               colorscheme = "lackluster",
               name = "lackluster",
            },
            {
               colorscheme = "vague",
               name = "vague",
            },
            {
               colorscheme = "kanso-ink",
               name = "kanso-ink",
            },
            {
               colorscheme = "kanagawa-paper-ink",
               name = "kanagawa-paper-ink",
            },
            {
               colorscheme = "rosebones",
               name = "rosebones",
            },
            {
               colorscheme = "tokyobones",
               name = "tokyobones",
            },
            {
               colorscheme = "neobones",
               name = "neobones",
            },
            {
               colorscheme = "spaceduck",
               name = "spaceduck",
            },
            {
               colorscheme = "jellybeans-nvim",
               name = "jellybeans",
            },
            {
               colorscheme = "base16-ashes",
               name = "base16-ashes",
            },
            {
               colorscheme = "base16-kanagawa-dragon",
               name = "base16-kanagawa-dragon",
            },
            {
               colorscheme = "base16-vulcan",
               name = "base16-vulcan",
            },
            {
               colorscheme = "base16-tarot",
               name = "base16-tarot",
            },


            -- PROBATION

            {
               colorscheme = "tempus_classic",
               name = "tempus_classic",
            },




         },
      } )
   end,
}
