return {
   'nvim-telescope/telescope.nvim',
   tag = '0.1.8',
   dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
   },
   config = function()
      require('telescope').setup {
         pickers = {
            find_files = {
               theme = "dropdown",
               hidden = true,
            },
         },
         fzf = {},
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<leader>sf", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<leader>sh", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<leader>sn", function()
         require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath('config')
         }
      end)
      vim.keymap.set("n", "<leader>sp", function()
         require('telescope.builtin').find_files {
            cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy')
         }
      end)

      require('config.telescope.multigrep').setup()
   end,
}
