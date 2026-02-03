return {
   "nvim-treesitter/nvim-treesitter",
   branch = "master",
   lazy = false,
   build = ":TSUpdate",

   config = function()
      require( "nvim-treesitter.configs" ).setup( {
         ensure_installed = {
            "c",
            "bash",

            "cpp",
            "python",
            "java",
            "lua",

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
