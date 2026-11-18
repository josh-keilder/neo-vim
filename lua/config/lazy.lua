local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazyPath) then
    local output = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazyPath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { output, "WarningMsg" } }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazyPath)

require("lazy").setup({
    spec = { { import = "plugins" } },
    install = { colorscheme = { "github_dark" } },
    change_detection = { notify = false },
})
