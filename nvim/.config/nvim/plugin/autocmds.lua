-- ~~~ [[ Autocommands ]] ~~~

-- [[ highlight when yanking text ]]
vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking text",
   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
   callback = function()
      vim.hl.on_yank()
   end,
})

-- [[ options when opening a terminal ]]
vim.api.nvim_create_autocmd("TermOpen", {
   group = vim.api.nvim_create_augroup("term-open", { clear = true }),
   callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
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
