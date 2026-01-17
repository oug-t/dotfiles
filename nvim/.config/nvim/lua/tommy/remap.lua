vim.g.mapleader = " "

-- === OIL FILE MANAGER ===
-- FIX: We wrap the require in a function so it only loads 
-- when you press the key. This prevents the startup crash.
vim.keymap.set("n", "-", function() 
    require("oil").open() 
end, { desc = "Open Oil File Manager" })

-- Move lines when highlighted (Primeagen style)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Make half page move stay in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Greatest remap ever (Paste without losing register)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- The only difference between <C-c> and <Esc>
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- Format buffer (LSP or Vim fallback)
vim.keymap.set("n", "<leader>f", function()
    -- Check for attached LSP clients that support formatting
    local clients = vim.lsp.get_clients({
        bufnr = 0,
        method = "textDocument/formatting",
    })

    if #clients > 0 then
        vim.lsp.buf.format({
            async = false,
        })
    else
        -- Fallback to Vim's built-in formatter
        local view = vim.fn.winsaveview()
        vim.cmd("normal! gqap")
        vim.fn.winrestview(view)
    end
end, { desc = "Format buffer (LSP or Vim fallback)" })

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- CompetiTest shortcuts
vim.keymap.set("n", "<leader>cr", "<cmd>CompetiTest receive problem<cr>", { desc = "Receive Problem" })

-- Stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
