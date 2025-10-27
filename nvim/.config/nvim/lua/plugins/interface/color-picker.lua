return {
   "uga-rosa/ccc.nvim",
   config = function()
      local ccc = require("ccc")
      local mapping = ccc.mapping

      ccc.setup({
         highlighter = {
            auto_enable = true, -- start the highlighter on file open
            excludes = {},      --ft to deactivate highlight
         },
         outputs = {
            ccc.output.hex.setup({ upercase = true }),
            ccc.output.hex_short.setup({ upercase = true }),
            ccc.output.css_rgb,
            ccc.output.css_rgba,
            ccc.output.css_hsl,
         },
         convert = {
            { ccc.picker.hex,      ccc.output.css_rgb },
            { ccc.picker.css_rgb,  ccc.output.css_rgba },
            { ccc.picker.css_rgba, ccc.output.css_hsl },
            { ccc.picker.css_hsl,  ccc.output.hex },
         },
         pickers = {
            ccc.picker.custom_entries({ -- custom pickers when a word apears
               red = "#ff0000",
               green = "#00ff00",
            }),
         },
      })
   end
}
