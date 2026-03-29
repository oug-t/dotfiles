vim.g.mapleader = " "

-- Oil file manager
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

-- Delete to void register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Difference between <C-c> and <Esc>
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

-- Format buffer (LSP or Vim fallback)
vim.keymap.set("n", "<leader>f", function()
	local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/formatting" })
	if #clients > 0 then
		vim.lsp.buf.format({ async = false })
	else
		local view = vim.fn.winsaveview()
		vim.cmd("normal! gqap")
		vim.fn.winrestview(view)
	end
end, { desc = "Format buffer (LSP or Vim fallback)" })

-- Quickfix navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Split windows
vim.keymap.set("n", "<leader>|", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>-", vim.cmd.split)

-- Resize windows with Space + hjkl (10 units)
vim.keymap.set("n", "<leader>h", function()
	if vim.fn.winnr() == vim.fn.winnr('l') then
		vim.cmd("vertical resize +10")
	else
		vim.cmd("vertical resize -10")
	end
end, { desc = "Move window border left" })

vim.keymap.set("n", "<leader>l", function()
	if vim.fn.winnr() == vim.fn.winnr('l') then
		vim.cmd("vertical resize -10")
	else
		vim.cmd("vertical resize +10")
	end
end, { desc = "Move window border right" })

vim.keymap.set("n", "<leader>k", function()
	if vim.fn.winnr() == vim.fn.winnr('j') then
		vim.cmd("resize +10")
	else
		vim.cmd("resize -10")
	end
end, { desc = "Move window border up" })

vim.keymap.set("n", "<leader>j", function()
	if vim.fn.winnr() == vim.fn.winnr('j') then
		vim.cmd("resize -10")
	else
		vim.cmd("resize +10")
	end
end, { desc = "Move window border down" })

-- Small terminal
vim.keymap.set("n", "<space>st", function()
	vim.cmd("botright 10split")
	vim.cmd("terminal")
	vim.cmd.startinsert()
end, { desc = "Open bottom terminal" })

-- Lean
vim.keymap.set('n', '<leader>i', function() require('lean.infoview').toggle() end, { desc = 'Toggle Lean Infoview' })
