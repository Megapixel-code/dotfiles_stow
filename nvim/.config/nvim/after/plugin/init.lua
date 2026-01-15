-- this file is run after everything
vim.diagnostic.config({ signs = false, virtual_text = true }) -- use virtual_text for diagnostics

-- filetypes
vim.filetype.add({
   extension = {
      [""] = "sh",
   }
})
