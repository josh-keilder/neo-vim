return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "go", "rust", "typescript", "javascript", "tsx",
                "html", "css", "json", "bash",
                "http", "dockerfile", "php", "python", "c", "regex",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function(args)
                    local buffer = args.buf
                    local language = vim.treesitter.language.get_lang(vim.bo[buffer].filetype)
                    if not language then
                        return
                    end

                    if not pcall(vim.treesitter.language.add, language) then
                        return
                    end

                    pcall(vim.treesitter.start, buffer, language)
                end,
            })
        end,
    },
}
