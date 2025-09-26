-- https://github.com/everviolet/nvim

return {
  'everviolet/nvim', name = 'evergarden',
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  lazy = false, -- Forces plugin to load automaticly on startup
  opts = {
    theme = {
      accent = 'pink',
    },
    editor = {
      transparent_background = false,
      sign = { color = 'none' },
      float = {
        color = 'mantle',
        solid_border = false,
      },
      completion = {
        color = 'surface0',
      },
    },
  }
}
