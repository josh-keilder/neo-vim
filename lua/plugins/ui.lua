return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false,
        priority = 1000,
        config = function()
            local gitModified = "#79b8ff"
            local gitAdded = "#34d058"
            local gitUntracked = "#34d058"
            local gitDeleted = "#ea4a5a"
            require("github-theme").setup({
                groups = {
                    all = {
                        -- VS Code "GitHub Dark" git decoration colors.
                        NeoTreeGitModified = { fg = gitModified },
                        NeoTreeGitUnstaged = { fg = gitModified },
                        NeoTreeGitStaged = { fg = gitModified },
                        NeoTreeGitAdded = { fg = gitAdded },
                        NeoTreeGitUntracked = { fg = gitUntracked },
                        NeoTreeGitRenamed = { fg = gitUntracked },
                        NeoTreeGitDeleted = { fg = gitDeleted },
                        NeoTreeGitIgnored = { fg = "#6a737d" },
                        NeoTreeGitConflict = { fg = "#ffab70" },
                        GitSignsAdd = { fg = gitUntracked },
                        GitSignsUntracked = { fg = gitUntracked },
                        GitSignsChange = { fg = gitModified },
                        GitSignsChangedelete = { fg = gitModified },
                        GitSignsDelete = { fg = gitDeleted },
                        GitSignsTopdelete = { fg = gitDeleted },
                    },
                },
            })
            vim.cmd.colorscheme("github_dark")
        end,
    },

    { "nvim-tree/nvim-web-devicons", lazy = true },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
        lazy = false,
        init = function()
            vim.api.nvim_create_autocmd("VimEnter", {
                desc = "Open and focus the explorer",
                callback = function() vim.cmd("Neotree focus left") end,
            })
            vim.api.nvim_create_autocmd("BufReadPost", {
                desc = "Close the empty startup buffer once a real file opens",
                callback = function(event)
                    for _, bufferNumber in ipairs(vim.api.nvim_list_bufs()) do
                        local isEmptyStartupBuffer = bufferNumber ~= event.buf
                            and vim.bo[bufferNumber].buflisted
                            and vim.bo[bufferNumber].buftype == ""
                            and vim.api.nvim_buf_get_name(bufferNumber) == ""
                            and not vim.bo[bufferNumber].modified
                            and vim.api.nvim_buf_line_count(bufferNumber) == 1
                            and vim.api.nvim_buf_get_lines(bufferNumber, 0, 1, false)[1] == ""
                            and vim.fn.bufwinid(bufferNumber) == -1
                        if isEmptyStartupBuffer then vim.api.nvim_buf_delete(bufferNumber, {}) end
                    end
                end,
            })
        end,
        keys = {
            { "<leader>e", "<cmd>Neotree toggle left<CR>", desc = "Toggle explorer" },
            { "-", "<cmd>Neotree reveal left<CR>", desc = "Reveal current file in explorer" },
        },
        opts = {
            close_if_last_window = true,
            event_handlers = {
                { event = "git_status_changed", handler = function() vim.cmd.redrawtabline() end },
            },
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
                name_formatter = function(buffer)
                    local gitStatus = require("neo-tree.git").find_existing_status_code(
                        require("neo-tree.utils").normalize_path(buffer.path)
                    )
                    if type(gitStatus) == "table" then gitStatus = gitStatus[1] end
                    local hasGitChange = gitStatus ~= nil and gitStatus ~= "!"
                    return hasGitChange and buffer.name .. " ●" or buffer.name
                end,
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
