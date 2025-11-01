-- ~~~~~~[[ My nvim config :0 ]]~~~~~~


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
vim.o.termguicolors = true  -- enable true color support

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
vim.o.wrap = true          -- allow line to wrap on the right
vim.o.linebreak = true     -- wrap by word instead of letter
vim.o.breakindent = true   -- wrapped lines will be indent

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

-- [[ Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking text",
   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
   callback = function()
      vim.hl.on_yank()
   end,
})


-- [[ automatically change terminal theme on quit ]]
local function autoscheme()
   if not vim.g.terminal_color_0 then
      return
   end

   vim.cmd("e $HOME/.config/kitty/current-theme.conf")
   vim.api.nvim_win_set_cursor(0, { 1, 0 })
   vim.cmd(".,$d")

   -- https://stackoverflow.com/questions/27870682/how-to-get-the-background-color-in-vim
   local bg = vim.api.nvim_exec2('echo synIDattr(hlID("Normal"), "bg")', { output = true }).output
   local fg = vim.api.nvim_exec2('echo synIDattr(hlID("Normal"), "fg")', { output = true }).output

   vim.api.nvim_buf_set_lines(0, 0, 25, false, {
      "background " .. bg,
      "foreground " .. fg,
      "selection_background " .. fg,
      "selection_foreground " .. bg,
      "cursor " .. fg,
      "color0 " .. vim.g.terminal_color_0,
      "color1 " .. vim.g.terminal_color_1,
      "color2 " .. vim.g.terminal_color_2,
      "color3 " .. vim.g.terminal_color_3,
      "color4 " .. vim.g.terminal_color_4,
      "color5 " .. vim.g.terminal_color_5,
      "color6 " .. vim.g.terminal_color_6,
      "color7 " .. vim.g.terminal_color_7,
      "color8 " .. vim.g.terminal_color_8,
      "color9 " .. vim.g.terminal_color_9,
      "color10 " .. vim.g.terminal_color_10,
      "color11 " .. vim.g.terminal_color_11,
      "color12 " .. vim.g.terminal_color_12,
      "color13 " .. vim.g.terminal_color_13,
      "color14 " .. vim.g.terminal_color_14,
      "color15 " .. vim.g.terminal_color_15,
   })
   vim.cmd("w | noh | bd")

   vim.cmd("term kill -SIGUSR1 $(pidof kitty)") -- reload terminal
end
vim.api.nvim_create_autocmd("VimLeavePre", {
   desc = "Set terminal theme when nvim quit",
   callback = autoscheme,
})


--[[ document-higligting
autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--]]

-- [[ LOADING PLUGINS ]]
require("config.lazy")
