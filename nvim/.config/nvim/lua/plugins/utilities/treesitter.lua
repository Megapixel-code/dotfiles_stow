return {
   "nvim-treesitter/nvim-treesitter",
   branch = "master",
   lazy = false,
   build = ":TSUpdate",

   config = function()
      --- @diagnostic disable-next-line
      require( "nvim-treesitter.configs" ).setup( {
         ensure_installed = {
            "c",
            "bash",

            "cpp",
            "python",
            "java",
            "lua",
            "pascal",

            "scala",
            "nix",

            "html",
            "css",
            "javascript",

            "typst",
            "markdown",
            "markdown_inline",
            "gitcommit",
         },

         highlight = {
            enable = true,
         },
      } )
   end,
}
