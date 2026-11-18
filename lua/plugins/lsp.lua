return {
    {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", "saghen/blink.cmp" },
        opts = {
            ensure_installed = { "lua_ls", "intelephense", "pyright", "vtsls", "clangd", "marksman" },
        },
        config = function(_, opts)
            vim.diagnostic.config({ virtual_text = true })
            vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })
            require("mason-lspconfig").setup(opts)
        end,
    },

    {
        "stevearc/conform.nvim",
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>f",
                function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                python = { "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                yaml = { "prettier" },
            },
        },
    },

    {
        "saghen/blink.cmp",
        version = "1.*",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {
            keymap = {
                preset = "super-tab",
                ["<CR>"] = { "accept", "fallback" },
            },
            appearance = { nerd_font_variant = "mono" },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 300 },
            },
            signature = { enabled = true },
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
        },
    },
}
