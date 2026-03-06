-- this file is run after everything
vim.diagnostic.config( {
   signs = false,

   -- use virtual_text for diagnostics
   virtual_text = true,
   virtual_lines = {
      severity = vim.diagnostic.severity.ERROR,
   },
} )

-- filetypes
vim.filetype.add( {
   extension = {
      [""] = "sh",
   },
} )
