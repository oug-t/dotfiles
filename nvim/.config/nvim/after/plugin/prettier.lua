local status, _ = pcall(require, "prettier")
-- Even if using vim-prettier (global plugin), we configure it via vim.g

-- 1. PRETTIER SETUP (For JS, TS, HTML, CSS, JSON)
-- Disable the default autoformat to give us manual control
vim.g["prettier#autoformat"] = 0
vim.g["prettier#autoformat_require_pragma"] = 0

-- define the autocmd to run prettier ONLY on specific web filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.html", "*.json", "*.md" },
    callback = function()
        vim.cmd("PrettierAsync")
    end,
})


-- 2. C/C++ CONFIGURATION (The fix for 2 spaces)
-- This ensures that when you open a C file, it uses 4 spaces.
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h", "hpp" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true -- Change to false if you prefer real tabs
    end,
})
