local function get_themes()
   local theme_table = {
      "github_dark_default",
      "vscode",
      "lackluster",
      "vague",
      "kanso-ink",
      "kanagawa-paper-ink",
      "rosebones",
      "tokyobones",
      "neobones",
      "spaceduck",
      "jellybeans-nvim",
      "base16-ashes",
      "base16-kanagawa-dragon",
      "base16-vulcan",
      "base16-tarot",

      -- [PROBATION]
   }

   local overide_dict = {
      ["github_dark_default"] = "github",
      ["jellybeans-nvim"] = "jellybeans",
   }

   local result = {}
   local name_arg

   for _, arg in ipairs( theme_table ) do
      name_arg = arg

      if overide_dict[arg] ~= nil then
         name_arg = overide_dict[arg]
      end

      vim.list_extend( result, {
         {
            colorscheme = arg,
            name = name_arg,
         },
      } )
   end
   return result
end


return {
   "zaldih/themery.nvim",
   lazy = false,
   config = function()
      vim.keymap.set( "n", "<leader>st", "<cmd>Themery<CR>", { desc = "Search Themes" } )

      require( "themery" ).setup( {
         livePreview = true,
         themes = get_themes(),
      } )
   end,
}
