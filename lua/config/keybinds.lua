-- KEYBINDS
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex) -- Remap going back to file explorer


-- Neo Tree
vim.keymap.set("n", "\\", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- Open terminal
vim.keymap.set("n", "<leader>t", ":vsplit | terminal<CR>", { desc = "Open terminal split" })

-- Change navigation to be ijkl
vim.keymap.set({ "n", "v" }, "i", "k", { desc = "Move up" })
vim.keymap.set({ "n", "v" }, "j", "h", { desc = "Move left" })
vim.keymap.set({ "n", "v" }, "k", "j", { desc = "Move down" })

-- New insert mode
vim.keymap.set("n", "<leader>i", "i", { desc = "Enter insert mode" })