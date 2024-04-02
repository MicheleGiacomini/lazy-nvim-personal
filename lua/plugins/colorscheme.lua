return {

  { "sainnhe/everforest" },

  {
    "rebelot/kanagawa.nvim",
    opts = {
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
