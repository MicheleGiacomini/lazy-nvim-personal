return {
  {
    "mfussenegger/nvim-dap",
    {
      "ldelossa/nvim-dap-projects",
    },
    lazy = false,
    init = function()
      require("nvim-dap-projects").search_project_config()
    end,
  },
}
