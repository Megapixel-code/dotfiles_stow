-- ~~~ [[ Basic Keymaps ]] ~~~

-- [Reload file]
vim.keymap.set( "n", "<leader>o", "<cmd>update<CR><cmd>source<CR>", { desc = "Rel[O]ad file" } )

-- [Toggle settings]
vim.keymap.set( "n", "<leader>ts", "<cmd>set spell!<CR>", { desc = "Toggle Spelling" } )

-- [Clear highlights]
vim.keymap.set( "n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clears higlighting of search" } )

-- [Quickfix]
vim.keymap.set( "n", "<M-j>", "<cmd>cnext<CR>" )
vim.keymap.set( "n", "<M-k>", "<cmd>cprev<CR>" )

-- [Diagnostic keymaps]
vim.keymap.set( "n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" } )

-- [lsp]
vim.keymap.set( "n", "K", vim.lsp.buf.hover, { desc = "Hover Information" } )

-- [terminal movement]
vim.keymap.set( "n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" } )
vim.keymap.set( "n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" } )
vim.keymap.set( "n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" } )
vim.keymap.set( "n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" } )
-- vim.keymap.set( "n", "<C-S-h>",    "<C-w>H",      { desc = "Move window to the left" } )
-- vim.keymap.set( "n", "<C-S-l>",    "<C-w>L",      { desc = "Move window to the right" } )
-- vim.keymap.set( "n", "<C-S-j>",    "<C-w>J",      { desc = "Move window to the lower" } )
-- vim.keymap.set( "n", "<C-S-k>",    "<C-w>K",      { desc = "Move window to the upper" } )

-- ~~~ [[ Plugins Keymaps ]] ~~~

-- [luasnip]

local luasnip = require( "luasnip" )
-- disable tab and s-tab keymap that would otherwise expand the snippet
vim.keymap.set( { "i", "s" }, "<Tab>",   "<Tab>" )
vim.keymap.set( { "i", "s" }, "<S-Tab>", "<S-Tab>" )
vim.keymap.set( { "i", "s" }, "<c-j>", function()
                   if luasnip.expand_or_jumpable() then
                      luasnip.expand_or_jump()
                   end
                end, { silent = true, desc = "go to next snippet jump" } )

vim.keymap.set( { "i", "s" }, "<c-k>", function()
                   if luasnip.jumpable( -1 ) then
                      luasnip.jump( -1 )
                   end
                end, { silent = true, desc = "go to previous snippet jump" } )

-- [typst/markdown]
-- NOTE: more info :h expand
-- % file path relative to CWD
-- %:p full path from /
-- %:t file name alone (tail)
-- %:h file directory alone (head)
-- %:r file with one less extension
-- %:e file extension
-- %:p:h directory of the file from /
-- %:t:r the file name alone without the extension
vim.keymap.set( "n", "<leader>tc", "", {
   callback = function()
      local ft = vim.o.filetype
      if ft == "typst" then
         local file_dir = vim.fn.expand( "%:p:h" )
         print( file_dir )
         os.execute( "mkdir -p " .. file_dir .. "/out" )
         vim.cmd( "!typst compile %:p %:p:h/out/%:t:r.pdf" )
      elseif ft == "markdown" then
         -- TODO: look pandoc
      end
   end,
   desc = "Compile typ or md file",
} )

vim.keymap.set( "n", "<leader>tp", "", {
   callback = function()
      local ft = vim.o.filetype
      if ft == "typst" then
         vim.cmd( "TypstPreview" )
      elseif ft == "markdown" then
         vim.cmd( "MarkdownPreview" )
      end
   end,
   desc = "Preview md or typ file",
} )


-- [telescope]
local telescope_builtins = require( "telescope.builtin" )
local telescope_config = require( "config.telescope" )
local telescope_todo_keywords = {
   "FIX",
   "FIXME",
   "BUG",
   "FIXIT",
   "ISSUE",
   "WARN",
   "WARNING",
   "XXX",
   "OPTIMIZE",
   "TODO",
}

vim.keymap.set( "n", "<leader>sf", telescope_builtins.find_files,    { desc = "Search Files" } )
vim.keymap.set( "n", "<leader>sh", telescope_builtins.help_tags,     { desc = "Search Help" } )
vim.keymap.set( "n", "<leader>sm", telescope_builtins.marks,         { desc = "Search Marks" } )
vim.keymap.set( "n", "<leader>ss", telescope_builtins.spell_suggest, { desc = "Search Spelling" } )
vim.keymap.set( "n", "<leader>sn", function()
                   telescope_builtins.find_files( {
                      cwd = vim.fn.stdpath( "config" ),
                   } )
                end, { desc = "Search Neovim" } )
vim.keymap.set( "n", "<leader>sp", function()
                   telescope_builtins.find_files( {
                      cwd = vim.fs.joinpath( vim.fn.stdpath( "data" ), "lazy" ),
                   } )
                end, { desc = "Search Plugins" } )
vim.keymap.set( "n", "<leader>sg", telescope_config.multigrep, { desc = "Search Grep" } )
vim.keymap.set( "n", "<leader>st",
                "<cmd>TodoTelescope keywords=" .. table.concat( telescope_todo_keywords, "," ) .. "<CR>",
                {
                   desc = "Search TODOS",
                } ) -- [todo-comments]
vim.keymap.set( "n", "<leader>sc", "<cmd>ColorSkimerToggle<CR>", {
   desc =
   "Search Colorschemes",
} ) -- [color-skimer]

-- [gitsigns]
vim.keymap.set( "n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>",                  { desc = "toggle Git Diff" } )
vim.keymap.set( "n", "<leader>gh", "<cmd>Gitsigns toggle_linehl<CR>",             { desc = "toggle Git Highlights" } )
vim.keymap.set( "n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "toggle Git line Blame" } )

-- [ccc]
vim.keymap.set(
   "n",
   "<leader>rc",
   "<cmd>CccHighlighterDisable<CR><cmd>CccHighlighterEnable<CR>",
   { desc = "Refresh CCC plugin" }
)

-- [yazi]
vim.keymap.set( "n", "<leader>yy", "<cmd>Yazi<cr>",        { desc = "open Yazi at the current file" } )
vim.keymap.set( "n", "<leader>ys", "<cmd>Yazi toggle<cr>", { desc = "Resume the last yazi session" } )
vim.keymap.set( "n", "<leader>yc", function()
                   require( "yazi" ).yazi( { change_neovim_cwd_on_close = true } )
                end, { desc = "Yazi Change CWD" } )
