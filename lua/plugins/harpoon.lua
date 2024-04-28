return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope.nvim"
  },
  lazy = false,
  keys = {
    {
      "<leader>ba",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Add buffer to harpoon list",
    },
    {
      "<leader>h",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Open harpoon window",
    },
    {
      "<C-1>",
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(1)
      end,
      desc = "Open harpoon window",
    },
    {
      "<C-2>",
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(2)
      end,
      desc = "Open harpoon window",
    },
    {
      "<C-3>",
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(3)
      end,
      desc = "Open harpoon window",
    },
    {
      "<C-4>",
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(4)
      end,
      desc = "Open harpoon window",
    },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,
}
