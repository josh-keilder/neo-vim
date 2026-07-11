return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
        window = {
            mappings = {
              ["i"] = function(state) vim.cmd("normal! k") end,
                ["j"] = function(state) vim.cmd("normal! h") end,
                ["k"] = function(state) vim.cmd("normal! j") end,
                },
            },
        },
    }
}