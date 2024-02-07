-- Scala-- additional scala setup
--
return {
  -- add Scala Metals support (not integrated into mason.nvim)
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/which-key.nvim",
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local whichkey = require("which-key")
      whichkey.register({
        mode = { "n", "v" },
        ["<leader>m"] = { name = "metals" },
      })
      -- Suggested by metals help
      vim.opt_global.shortmess:remove("F")
      local metals_config = require("metals").bare_config()
      metals_config.init_options.statusBarProvider = "on"
      metals_config.settings = {
        scalaCliLauncher = "/home/michele/.cache/scalacli/local-repo/bin/scala-cli/scala-cli",
        showImplicitArguments = true,
        showInferredType = true,
      }

      -- Dap integration
      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
      end

      local dap = require("dap")

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "Run or Test Target",
          metals = {
            runType = "runOrTestFile",
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }

      metals_config.settings = {
        testUserInterface = "Test Explorer",
      }

      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })

      -- better up/down
      vim.keymap.set("n", "<leader>mr", require("metals.tvp").reveal_in_tree, { desc = "reveal in tree" })
      vim.keymap.set("n", "<leader>mt", require("metals.tvp").toggle_tree_view, { desc = "toggle tree view" })
      vim.keymap.set(
        "n",
        "<leader>mm",
        "<cmd>lua require('telescope').extensions.metals.commands()<CR>",
        { desc = "metals commands" }
      )
    end,
  },
}
