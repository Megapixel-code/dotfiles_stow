return {
   "zaldih/themery.nvim",
   lazy = false,
   config = function()
      -- set keymap
      vim.keymap.set("n", "<leader>st", "<cmd>Themery<CR>", { desc = "Search Themes" })

      require("themery").setup({
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
               colorscheme = "kanso-mist",
               name = "kanso-mist",
            },
            {
               colorscheme = "kanagawa-dragon",
               name = "kanagawa-dragon",
            },
            {
               colorscheme = "kanagawa-paper-ink",
               name = "kanagawa-paper-ink",
            },
            {
               colorscheme = "tokyobones",
               name = "tokyobones",
            },
            {
               colorscheme = "rosebones",
               name = "rosebones",
            },
            {
               colorscheme = "neobones",
               name = "neobones",
            },
            {
               colorscheme = "evergarden-winter",
               name = "evergarden",
            },
         },
      })
   end,
}
