return {
   {
      'maxmx03/fluoromachine.nvim',
      config = function()
         require("fluoromachine").setup {
            theme = 'delta',
            brightness = 0.05,
            glow = false,
            transparent = false,
            styles = {
               comments = {},
               functions = {},
               variables = {},
               numbers = {},
               constants = {},
               parameters = {},
               keywords = {},
               types = {},
            },
            colors = {},
            overrides = {},
            plugins = {
               bufferline = true,
               cmp = true,
               dashboard = true,
               editor = true,
               gitsign = true,
               hop = true,
               ibl = true,
               illuminate = true,
               lazy = true,
               minicursor = true,
               ministarter = true,
               minitabline = true,
               ministatusline = true,
               navic = true,
               neogit = true,
               neotree = true,
               noice = true,
               notify = true,
               lspconfig = true,
               syntax = true,
               telescope = true,
               treesitter = true,
               tree = true,
               wk = true,
            },
         }
      end
   }
}
