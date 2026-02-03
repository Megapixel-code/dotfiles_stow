return {
   "rockerBOO/boo-colorscheme-nvim",

   config = function()
      require( "boo-colorscheme" ).use( {
         italics = false,
      } )
   end,
}
