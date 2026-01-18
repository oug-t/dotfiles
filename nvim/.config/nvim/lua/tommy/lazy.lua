-- LEADER
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- General Settings (C/C++ Fix)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "h", "hpp" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})

-- Format for Lua
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.lua" },
	callback = function()
		-- Only run if stylua exists
		if vim.fn.executable("stylua") == 1 then
			vim.cmd("silent! %!stylua -")
		end
	end,
})

-- 3. Plugin List & Configurations
return require("lazy").setup({

	-- === PRETTIER ===
	{
		"prettier/vim-prettier",
		ft = {
			"javascript",
			"typescript",
			"css",
			"less",
			"scss",
			"json",
			"graphql",
			"markdown",
			"vue",
			"svelte",
			"yaml",
			"html",
		},
		init = function()
			vim.g["prettier#autoformat"] = 0
			vim.g["prettier#autoformat_require_pragma"] = 0
		end,
		config = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.html", "*.json", "*.md", "*.svelte" },
				callback = function()
					vim.cmd("PrettierAsync")
				end,
			})
		end,
	},

	-- === LSP, MASON, CMP (FIXED) ===
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "onsails/lspkind-nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			-- 1. Attach Logic
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })

				local opts = { buffer = bufnr, noremap = true, silent = true }
				vim.keymap.set("n", ";d", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
				vim.keymap.set(
					"n",
					"<leader>ld",
					require("telescope.builtin").diagnostics,
					{ desc = "List diagnostics" }
				)
			end)

			-- 2. Get Capabilities (CRITICAL FIX for autocomplete)
			local capabilities = lsp_zero.get_capabilities()

			-- 3. Mason Setup
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"clangd",
					"eslint",
					"lua_ls",
					"rust_analyzer",
					"pyright",
					"jdtls",
					"solargraph",
					"html",
					"marksman",
					"ltex",
					"ocamllsp",
				},
				handlers = {
					-- Default handler
					lsp_zero.default_setup,

					ruby_lsp = function()
						require("lspconfig").ruby_lsp.setup({
							capabilities = capabilities, -- Pass capabilities
							init_options = {
								formatter = "rubocop",
								enabledFeatures = {
									"codeActions",
									"diagnostics",
									"documentHighlights",
									"documentSymbols",
									"formatting",
									"hover",
									"onTypeFormatting",
									"selectionRanges",
									"semanticHighlighting",
								},
							},
						})
					end,
					ocamllsp = function()
						require("lspconfig").ocamllsp.setup({
							capabilities = capabilities, -- Pass capabilities
							cmd = { "ocamllsp" },
						})
					end,
				},
			})

			-- 4. CMP Setup
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						menu = { buffer = "[Buffer]", nvim_lsp = "[LSP]", luasnip = "[Snippet]", path = "[Path]" },
					}),
				},
				experimental = { ghost_text = true },
			})
		end,
	},

	-- === TELESCOPE ===
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>pf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>pg",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Git Files",
			},
			{
				"<leader>ps",
				function()
					require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
				end,
				desc = "Grep String",
			},
		},
	},

	-- === TREESITTER ===
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local install_dir = vim.fn.stdpath("data") .. "/treesitter-parsers"

			require("nvim-treesitter").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"javascript",
					"python",
					"ruby",
					"html",
					"css",
					"svelte",
					"ocaml",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				parser_install_dir = install_dir,
			})

			-- Make Neovim find parsers in that custom directory
			vim.opt.runtimepath:append(install_dir)
		end,
	},

	-- === HARPOON ===
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			-- Dvorak layout bindings (h,t,n,s)
			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end)
		end,
	},

	-- === FILE MANAGER (Oil) ===
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				keymaps = {
					["<C-h>"] = false,
					["<C-l>"] = false,
					["<C-k>"] = false,
					["<C-j>"] = false,
					["<leader>pf"] = false,
					["<leader>pg"] = false,
					["<leader>ps"] = false,
				},
				columns = {
					"icon",
					"permissions",
					"size",
				},
				view_options = {
					show_hidden = true,
					natural_order = true,
				},
				float = {
					padding = 2,
					border = "rounded",
				},
			})
		end,
	},

	-- === COMPETITEST ===
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup({
				received_problems_path = function(task, file_extension)
					local home = os.getenv("HOME")
					local contest_id = "unknown_contest"
					local problem_id = task.name

					if task.url then
						local c, p = task.url:match("contest/(%d+)/problem/([%w%p]+)")
						if c and p then
							contest_id = c
							problem_id = p
						else
							c, p = task.url:match("problem/(%d+)/([%w%p]+)")
							if c and p then
								contest_id = c
								problem_id = p
							end
						end
					end

					if problem_id == task.name then
						local p_letter = task.name:match("^(%w+)%.")
						if p_letter then
							problem_id = p_letter
						end
					end

					return string.format("%s/code/codeforces/%s/%s.%s", home, contest_id, problem_id, file_extension)
				end,

				received_contest_problems_path = function(task, file_extension)
					local home = os.getenv("HOME")
					local contest_id = "unknown_contest"
					local problem_id = task.name

					if task.url then
						local c, p = task.url:match("contest/(%d+)/problem/([%w%p]+)")
						if c and p then
							contest_id, problem_id = c, p
						end
						local c2, p2 = task.url:match("problem/(%d+)/([%w%p]+)")
						if c2 and p2 then
							contest_id, problem_id = c2, p2
						end
					end
					if problem_id == task.name then
						local p = task.name:match("^(%w+)%.")
						if p then
							problem_id = p
						end
					end

					return string.format("%s/code/codeforces/%s/%s.%s", home, contest_id, problem_id, file_extension)
				end,

				template_file = "$(HOME)/code/codeforces/template.rb",
				received_files_extension = "rb",
				runner_ui = { interface = "popup" },
			})
		end,
	},

	-- === UTILITIES & GIT ===
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle UndoTree" },
		},
	},
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs", vim.cmd.Git, desc = "Git Status" },
		},
	},
	"christoomey/vim-tmux-navigator",
	"ThePrimeagen/vim-be-good",

	-- === THEME ===
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		priority = 1000,
		config = function()
			require("nightfox").setup({ options = { transparent = true } })
			vim.cmd.colorscheme("nordfox")
		end,
	},
	{
		"hiphish/rainbow-delimiters.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local hooks = require("ibl.hooks")

			local highlight = {
				"NordDeepBlue",
				"NordMediumBlue",
				"NordFrostBlue",
				"NordCyan",
				"NordLightBlue",
			}

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "NordDeepBlue", { fg = "#5e81ac" })
				vim.api.nvim_set_hl(0, "NordMediumBlue", { fg = "#81a1c1" })
				vim.api.nvim_set_hl(0, "NordFrostBlue", { fg = "#88c0d0" })
				vim.api.nvim_set_hl(0, "NordCyan", { fg = "#8fbcbb" })
				vim.api.nvim_set_hl(0, "NordLightBlue", { fg = "#a3be8c" })
			end)

			require("ibl").setup({
				indent = {
					char = "┆",
					highlight = highlight,
				},
				scope = { enabled = false },
			})
		end,
	},
})
