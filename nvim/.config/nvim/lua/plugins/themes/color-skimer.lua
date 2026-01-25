-- [[ automatically change terminal theme on quit ]]
local function autoscheme()
   if not vim.g.terminal_color_0 then
      print( "autoscheme: unable to change terminal theme, no terminal_color" )
      return
   end

   -- addapted from :
   -- https://stackoverflow.com/questions/27870682/how-to-get-the-background-color-in-vim
   local bg = vim.api.nvim_exec2( 'echo synIDattr(hlID("Normal"), "bg")', { output = true } ).output
   local fg = vim.api.nvim_exec2( 'echo synIDattr(hlID("Normal"), "fg")', { output = true } ).output

   local content =
      "background " .. bg .. "\n" ..
      "foreground " .. fg .. "\n" ..
      "selection_background " .. fg .. "\n" ..
      "selection_foreground " .. bg .. "\n" ..
      "cursor " .. fg .. "\n" ..
      "color0 " .. vim.g.terminal_color_0 .. "\n" ..
      "color1 " .. vim.g.terminal_color_1 .. "\n" ..
      "color2 " .. vim.g.terminal_color_2 .. "\n" ..
      "color3 " .. vim.g.terminal_color_3 .. "\n" ..
      "color4 " .. vim.g.terminal_color_4 .. "\n" ..
      "color5 " .. vim.g.terminal_color_5 .. "\n" ..
      "color6 " .. vim.g.terminal_color_6 .. "\n" ..
      "color7 " .. vim.g.terminal_color_7 .. "\n" ..
      "color8 " .. vim.g.terminal_color_8 .. "\n" ..
      "color9 " .. vim.g.terminal_color_9 .. "\n" ..
      "color10 " .. vim.g.terminal_color_10 .. "\n" ..
      "color11 " .. vim.g.terminal_color_11 .. "\n" ..
      "color12 " .. vim.g.terminal_color_12 .. "\n" ..
      "color13 " .. vim.g.terminal_color_13 .. "\n" ..
      "color14 " .. vim.g.terminal_color_14 .. "\n" ..
      "color15 " .. vim.g.terminal_color_15 .. "\n"

   local xdg_config_home = os.getenv( "XDG_CONFIG_HOME" )
   local file, err = io.open( xdg_config_home .. "/kitty/current-theme.conf", "w" )

   if file then
      file:write( content )
      file:close()
   else
      print( "error opening a file : err ", err )
      return
   end

   vim.cmd( "silent !kill -SIGUSR1 $(pidof kitty)" ) -- reload terminal
end



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
      "no-clown-fiesta-dark",
      "slightlyclownish",
      "base16-ashes",
      "base16-kanagawa-dragon",
      "base16-vulcan",
      "base16-tarot",

      -- [PROBATION]
      "PaperColor",
   },

   name_override = { -- < this will override the name in the preview menu
      ["github_dark_default"] = "github",
   },

   pre_function = { -- < this will be called before each preview of the colorscheme
      ["*"] = function()
         vim.o.background = "dark"
      end,
      ["PaperColor"] = function()
         vim.o.background = "light"
      end,
   },
   post_function = { -- < this will be called after each preview of the colorscheme
      -- same options as pre_function
   },

   pre_callback = { -- < this will be called before we save the colorscheme to memory
      -- same options as pre_function
   },
   post_callback = { -- < this will be called after we save the colorscheme to memory
      -- same options as pre_function
      ["*"] = function()
         autoscheme()
      end,
   },
}

return {
   -- "Megapixel-code/color-skimer.nvim",
   -- OR localy:
   dir = "~/documents/projects/color-skimer.nvim",

   opts = options,
   config = function()
      local cs = require( "color-skimer" )

      cs.setup( options )

      vim.api.nvim_set_keymap( "n", "<leader>st", "<cmd>ColorSkimerToggle<CR>", { desc = "Search themes" } )
   end,
}
