-- NOTE: more info :h expand
-- % file path relative to CWD
-- %:p full path from /
-- %:t file name alone (tail)
-- %:h file directory alone (head)
-- %:r file with one less extension
-- %:e file extension
-- %:p:h directory of the file from /
-- %:t:r the file name alone without the extension
vim.keymap.set( "n", "<leader>tc", ":!typst compile %:p %:p:h/out/%:t:r.pdf<CR>", { desc = "Compile typst file" } )
vim.keymap.set( "n", "<leader>tp", ":TypstPreview<CR>",                           { desc = "Preview typst file" } )

vim.o.spell = true -- enable spelling
