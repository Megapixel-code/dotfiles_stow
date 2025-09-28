--[[

=====================================================================
=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||   FORK OF          ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ fuck the \     ========
========       /:::========|  |==hjkl==:::\  \   mouse  \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

--]]

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
   vim.opt.clipboard = "unnamedplus"
end)

-- [[ Setting options ]]
--  NOTE: See `:help vim.o` more options `:help option-list`

vim.o.number = true         -- see current line number, if !relativenumber see all lines numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.cursorline = true     -- highlight the cursor line
vim.o.scrolloff = 10        -- Minimal number of screen lines to keep above and below the cursor.
vim.o.showmode = false      -- show mode in the last line, unnessesary cause we aleready show the mode elsewhere
vim.o.signcolumn = "yes"    -- Keep signcolumn on by default
vim.g.have_nerd_font = true -- true if you have a Nerd Font installed and selected in the terminal
-- Sets how neovim will display certain whitespace characters in the editor.
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.mouse = "a" -- enable mouse mode

-- Indent formating :
-- vim.g.python_recommended_style = 0
-- vim.g.rust_recommended_style = 0
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.smartindent = true -- auto indent new lines eg : after '{'
vim.opt.expandtab = true   -- in insert mode adds the correct amount of spaces when you tab
vim.o.breakindent = true   -- wrapped line will continue visually indented

vim.o.undofile = true      -- Save undo history
vim.o.confirm = true       -- ask confirmation when you quit while unsaved

-- Case-insensitive searching UNLESS or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
-- Decrease mapped sequence wait time
vim.o.timeoutlen = 500

-- Configure how new splits should be opened
vim.o.splitbelow = true
vim.o.splitright = true

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- reload nvim config :
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking (copying) text",
   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
   callback = function()
      vim.hl.on_yank()
   end,
})

-- autoformat on save
vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('my.lsp', {}),
   callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      -- Auto-format ("lint") on save.
      if not client:supports_method('textDocument/willSaveWaitUntil')
          and client:supports_method('textDocument/formatting') then
         vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            buffer = args.buf,
            callback = function()
               vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
         })
      end
   end,
})
--[[ document-higligting
autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--]]

-- [[ LOADING PLUGINS ]]
require("config.lazy")

-- loading colorscheme
vim.cmd.colorscheme("evergarden-winter")

-- loading lsp
vim.env.PATH = vim.env.PATH .. ':$HOME/.local/bin'
