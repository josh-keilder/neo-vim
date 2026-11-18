local gitBashPath = vim.fn.expand("$LOCALAPPDATA/Programs/Git/bin/bash.exe")

return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            bigfile = { enabled = true },
            indent = { enabled = true },
            notifier = { enabled = true },
            picker = { enabled = true },
            terminal = { enabled = true },
        },
        keys = {
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
            { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep in project" },
            { "<leader>fh", function() Snacks.picker.help() end, desc = "Search help" },
            { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Search diagnostics" },
            { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Search keymaps" },
            {
                "<leader>t",
                -- CHERE_INVOKING keeps Git Bash's login profile from changing to the home folder.
                function() Snacks.terminal.toggle({ gitBashPath, "--login", "-i" }, { env = { CHERE_INVOKING = "1" } }) end,
                desc = "Toggle terminal",
            },
        },
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        keys = {
            { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle inline git blame" },
        },
    },

    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gvdiffsplit" },
        keys = {
            { "<leader>gg", "<cmd>tabnew | Git | only<CR>", desc = "Fugitive full page in new tab" },
            { "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "Git diff split" },
        },
    },

    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Problems panel" },
        },
    },

    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    { "nvim-mini/mini.pairs", event = "InsertEnter", opts = {} },
    { "nvim-mini/mini.surround", event = "VeryLazy", opts = {} },
    { "brenoprata10/nvim-highlight-colors", event = { "BufReadPost", "BufNewFile" }, opts = {} },
}
