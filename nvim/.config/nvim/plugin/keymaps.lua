-- ~~~ [[ Basic Keymaps ]] ~~~

-- [Reload nvim config]
vim.keymap.set( "n", "<leader>o", "<cmd>update<CR> <cmd>source<CR>", { desc = "Rel[O]ad file" } )

-- [Clear highlights]
vim.keymap.set( "n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clears higlighting of search" } )

-- [Quickfix]
vim.keymap.set( "n", "<M-j>", "<cmd>cnext<CR>" )
vim.keymap.set( "n", "<M-k>", "<cmd>cprev<CR>" )

-- [Diagnostic keymaps]
vim.keymap.set( "n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" } )

-- [Auto close brackets and stuff]
vim.keymap.set( "i", "{", "{}<left>", { desc = "Autoclose brackets" } )
vim.keymap.set( "i", "[", "[]<left>", { desc = "Autoclose square brackets" } )
vim.keymap.set( "i", "(", "()<left>", { desc = "Autoclose parenteses" } )
vim.keymap.set( "i", "'", "''<left>", { desc = "Autoclose single quote" } )
vim.keymap.set( "i", '"', '""<left>', { desc = "Autoclose double quote" } )
vim.keymap.set( "i", "<", "<><left>", { desc = "Autoclose tag" } )

-- [lsp]
vim.keymap.set( "n", "K", vim.lsp.buf.hover, { desc = "Hover Information" } )

-- [terminal movement]
vim.keymap.set( "t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" } )
vim.keymap.set( "n", "<C-h>",      "<C-w><C-h>",  { desc = "Move focus to the left window" } )
vim.keymap.set( "n", "<C-l>",      "<C-w><C-l>",  { desc = "Move focus to the right window" } )
vim.keymap.set( "n", "<C-j>",      "<C-w><C-j>",  { desc = "Move focus to the lower window" } )
vim.keymap.set( "n", "<C-k>",      "<C-w><C-k>",  { desc = "Move focus to the upper window" } )
-- vim.keymap.set( "n", "<C-S-h>",    "<C-w>H",      { desc = "Move window to the left" } )
-- vim.keymap.set( "n", "<C-S-l>",    "<C-w>L",      { desc = "Move window to the right" } )
-- vim.keymap.set( "n", "<C-S-j>",    "<C-w>J",      { desc = "Move window to the lower" } )
-- vim.keymap.set( "n", "<C-S-k>",    "<C-w>K",      { desc = "Move window to the upper" } )

-- ~~~ [[ Plugins Keymaps ]] ~~~

-- [gitsigns]
vim.keymap.set( "n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>",                  { desc = "toggle Git Diff" } )
vim.keymap.set( "n", "<leader>gh", "<cmd>Gitsigns toggle_linehl<CR>",             { desc = "toggle Git Highlights" } )
vim.keymap.set( "n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "toggle Git line Blame" } )
