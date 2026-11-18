vim.g.mapleader = " "

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

-- native undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

-- Navigate between buffer tabs
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Close current buffer tab
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete buffer" })

-- Move to specific buffers by number
vim.keymap.set("n", "<leader>b1", "<cmd>buffer 1<CR>", { desc = "Go to buffer 1" })
vim.keymap.set("n", "<leader>b2", "<cmd>buffer 2<CR>", { desc = "Go to buffer 2" })
vim.keymap.set("n", "<leader>b3", "<cmd>buffer 3<CR>", { desc = "Go to buffer 3" })

-- VS Code style save, undo, cut, copy and paste
vim.keymap.set({ "n", "i", "x" }, "<C-s>", "<cmd>write<CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "Undo" })
vim.keymap.set("x", "<C-c>", [["+y]], { desc = "Copy selection" })
vim.keymap.set("x", "<C-x>", [["+d]], { desc = "Cut selection" })
vim.keymap.set("n", "<C-v>", [["+P]], { desc = "Paste" })
vim.keymap.set("x", "<C-v>", [["+P]], { desc = "Paste over selection" })
vim.keymap.set({ "i", "c" }, "<C-v>", "<C-r>+", { desc = "Paste" })
vim.keymap.set({ "n", "i", "x" }, "<C-a>", "<Esc>ggVG", { desc = "Select all" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
