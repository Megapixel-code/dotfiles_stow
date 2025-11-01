-- ~~~~~~ [[ My nvim config :0 ]] ~~~~~~

vim.g.mapleader = " "      -- sets space as the leader key
vim.g.maplocalleader = " " -- must be before loading plugins

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
   vim.opt.clipboard = "unnamedplus"
end)

-- ~~~ [[ Setting options ]] ~~~

-- [[ interface ]]
-- sets how neovim will display certain whitespace characters in the editor
-- notice listchars is set using `vim.opt` instead of `vim.o`, used to interract with tables
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.number = true         -- see current line number, if !relativenumber see all lines numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.cursorline = true     -- highlight the cursor line
vim.o.scrolloff = 10        -- Minimal number of screen lines to keep above and below the cursor.
vim.o.showmode = false      -- show mode in the last line, disabled because we have lualine
vim.o.signcolumn = "yes"    -- Keep signcolumn on by default
vim.g.have_nerd_font = true -- true if you have a Nerd Font installed and selected in the terminal
vim.o.termguicolors = true  -- enable true color support

-- [[ formating ]]
-- vim.g.python_recommended_style = 0
-- vim.g.rust_recommended_style = 0
vim.opt.tabstop = 3        -- numbers of spaces that a <Tab> count for
vim.opt.shiftwidth = 0     -- number of spaces for each step of indent, 0 = take tabstop value
vim.opt.smartindent = true -- auto indent new lines eg : after '{'
vim.opt.expandtab = true   -- in insert mode adds the correct amount of spaces when you tab
vim.o.wrap = true          -- allow line to wrap on the right
vim.o.linebreak = true     -- wrap by word instead of letter
vim.o.breakindent = true   -- wrapped lines will be indented

-- [[ utilities ]]
vim.o.mouse = "a"          -- enable mouse mode
vim.o.undofile = true      -- Save undo history
vim.o.confirm = true       -- ask confirmation when you quit while unsaved
vim.o.ignorecase = true    -- case-insensitive searching
vim.o.smartcase = true     -- removes case-insensitive searching if one or more capital letter
vim.o.updatetime = 250     -- time with nothing typed before writing swap to disk (ex crash recovery)
vim.o.timeoutlen = 500     -- mapped sequence wait time
vim.o.inccommand = "split" -- Preview substitutions live, as you type!
vim.o.splitbelow = true    -- new splits open on the bottom
vim.o.splitright = true    -- new splits open on the right

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
