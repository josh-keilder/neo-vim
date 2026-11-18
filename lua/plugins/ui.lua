return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({})
            vim.cmd.colorscheme("github_dark")
        end,
    },

    { "nvim-tree/nvim-web-devicons", lazy = true },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
        cmd = "Neotree",
        init = function()
            vim.api.nvim_create_autocmd("VimEnter", {
                desc = "Open the explorer sidebar without taking focus",
                callback = function() vim.cmd("Neotree show left") end,
            })
        end,
        keys = {
            { "<leader>e", "<cmd>Neotree toggle left<CR>", desc = "Toggle explorer" },
            { "-", "<cmd>Neotree reveal left<CR>", desc = "Reveal current file in explorer" },
        },
        opts = {
            close_if_last_window = true,
            window = { width = 32 },
            filesystem = {
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
                -- Show dotfiles and gitignored files dimmed, like VS Code.
                filtered_items = { visible = true },
            },
        },
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                close_command = function(bufferNumber) Snacks.bufdelete(bufferNumber) end,
                right_mouse_command = function(bufferNumber) Snacks.bufdelete(bufferNumber) end,
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                offsets = {
                    { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "left", separator = true },
                },
            },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = { theme = "auto", globalstatus = true },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            extensions = { "neo-tree", "lazy", "trouble", "fugitive" },
        },
    },

    {
        "Bekaboo/dropbar.nvim",
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>;", function() require("dropbar.api").pick() end, desc = "Pick breadcrumb" },
        },
        opts = {},
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { preset = "modern" },
    },
}
