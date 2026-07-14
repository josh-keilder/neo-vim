----- Keybinds -----
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex) -- Remap going back to file explorer

-- Terminal
vim.keymap.set("n", "<leader>t", ":botright vsplit | vertical resize 40 | terminal<CR>", { desc = "Open terminal (right)" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Neo Tree 
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- Center the screen after scrolling half a page down
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Center the screen after scrolling half a page up
vim.keymap.set("n", "<C-u>", "<C-u>zz")

----- Options -----
local set = vim.opt
vim.opt.timeoutlen = 301

-- line numbers
set.number = true

-- indentation and tabs
set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true

-- cursor line
set.cursorline = true

-- clipboard
set.clipboard:append("unnamedplus")

-- Lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  change_detection = {notify = false},
})
