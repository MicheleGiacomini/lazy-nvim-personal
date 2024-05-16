return {
  "folke/trouble.nvim",
  branch = "dev", -- IMPORTANT!
  keys = {
    {
      "<leader>xe",
      "<cmd>Trouble errors toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xE",
      "<cmd>Trouble errors toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
  },
  opts = {
    modes = {
      errors = {
        mode = "diagnostics",
        filter = {
          severity = vim.diagnostic.severity.ERROR,
        },
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
}
