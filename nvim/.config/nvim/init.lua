-- ~~~~~~ [[ My nvim config :0 ]] ~~~~~~

vim.g.mapleader = " "      -- sets space as the leader key
vim.g.maplocalleader = " " -- must be before loading plugins

-- ~~~ [[ SETTING OPTIONS ]] ~~~

-- [[ interface ]]
-- sets how Neovim will display certain whitespace characters in the editor
-- notice listchars is set using `vim.opt` instead of `vim.o`, used to interact with tables
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.number = true         -- see current line number, if !relativenumber see all lines numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.cursorline = true     -- highlight the cursor line
vim.o.scrolloff = 10        -- minimal number of screen lines to keep above and below the cursor.
vim.o.showmode = false      -- show mode in the last line, disabled because we have lualine
vim.o.signcolumn = "yes"    -- keep signcolumn on by default
vim.g.have_nerd_font = true -- true if you have a Nerd Font installed and selected in the terminal
vim.o.termguicolors = true  -- enable true color support
vim.o.winborder = "single"  -- default win border type

-- [[ formatting ]]
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
vim.o.mouse = ""                 -- enable mouse mode
vim.o.undofile = true            -- save undo history
vim.o.confirm = true             -- ask confirmation when you quit while unsaved
vim.o.ignorecase = true          -- case-insensitive searching
vim.o.smartcase = true           -- removes case-insensitive searching if one or more capital letter
vim.o.updatetime = 250           -- time with nothing typed before writing swap to disk (ex crash recovery)
vim.o.timeoutlen = 500           -- mapped sequence wait time
vim.o.inccommand = "split"       -- preview substitutions live, as you type!
vim.o.splitbelow = true          -- new splits open on the bottom
vim.o.splitright = true          -- new splits open on the right
vim.cmd( "set spelllang=en_us" ) -- choose English spelling

-- ~~~ [[ OTHER ]] ~~~
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule( function()
   vim.opt.clipboard = "unnamedplus"
end )

-- ~~~ [[ LOADING PLUGINS ]] ~~~
require( "config.lazy" )

-- ~~~ [[ MY-PLUGINS ]] ~~~
local options = {
   colorscheme = { -- < your colorschemes names
      "github_dark_default",
      "vscode",
      "lackluster",
      "vague",
      "kanso-ink",
      "kanagawa-paper-ink",
      "rosebones",
      "tokyobones",
      "neobones",
      "spaceduck",
      "slightlyclownish",
      "base16-ashes",
      "base16-kanagawa-dragon",
      "base16-vulcan",
      "base16-tarot",

      -- [PROBATION]
      "friffle",
      -- TODO: look back at the paper theme with the light theme
   },

   name_override = { -- < this will override the name in the preview menu
      ["github_dark_default"] = "github",
   },

   pre_function = { -- < this will be called before each preview of the colorscheme
      ["*"] = function()
         -- you can use the star to execute before each
         -- unless the colorscheme is in the table
         -- [Example]
         -- Here it would print "aww" for every colorscheme
         -- exept github_dark_default where it would print "eww"
         print( "aww !" )
      end,
      ["vscode"] = function()
         print( "eww" )
      end,
   },
   post_function = { -- < this will be called after each preview of the colorscheme
      -- same options as pre_function
   },

   pre_callback = { -- < this will be called before we save the colorscheme
      -- same options as pre_function
   },
   post_callback = { -- < this will be called after we save the colorscheme
      -- same options as pre_function
      ["*"] = function()
         print( "colorscheme set !" )
      end,
   },
}

require( "my-plugins.color-skimer.color-skimer" ).setup( options )
