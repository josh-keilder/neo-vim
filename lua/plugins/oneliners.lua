return{
{ -- Git Plugin
    "tpope/vim-fugitive",
},

    { -- Show CSS Colors
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = true })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    
    {
        "ThePrimeagen/harpoon",           
        branch = "harpoon2"
    },
    

}
