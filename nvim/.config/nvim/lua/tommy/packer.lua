-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Nordfox
    use({
        "EdenEast/nightfox.nvim",
        as = "nightfox",
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true, -- Sets the background to transparent
                }
            })
            -- The colorscheme command sets the active variant (style)
            vim.cmd.colorscheme "nordfox"
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = 'TSUpdate'
    }

    use 'hiphish/rainbow-delimiters.nvim'

    use {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local hooks = require("ibl.hooks") -- Fixes nil error

            -- A gradient from deep blue to bright cyan
            local highlight = {
                "NordDeepBlue",
                "NordMediumBlue",
                "NordFrostBlue",
                "NordCyan",
                "NordLightBlue",
            }

            -- Register the blue colors FIRST
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "NordDeepBlue", { fg = "#5e81ac" })   -- Nord10 (Darker)
                vim.api.nvim_set_hl(0, "NordMediumBlue", { fg = "#81a1c1" }) -- Nord9
                vim.api.nvim_set_hl(0, "NordFrostBlue", { fg = "#88c0d0" })  -- Nord8 (Bright)
                vim.api.nvim_set_hl(0, "NordCyan", { fg = "#8fbcbb" })       -- Nord7 (Teal-ish)
                vim.api.nvim_set_hl(0, "NordLightBlue", { fg = "#a3be8c" })  -- NordGreen (to add slight variety)
            end)

            require("ibl").setup {
                indent = {
                    char = "┆", -- Your preferred dotted pipe
                    highlight = highlight,
                },
                scope = { enabled = false } -- Rainbow looks better without a separate scope line
            }
        end
    }


    -- Harpoon2 offers integration with tmux.
    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use('mbbill/undotree')

    -- Git plugin
    use('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

        }
    }

    use('christoomey/vim-tmux-navigator')
    use('ThePrimeagen/vim-be-good')
    use('onsails/lspkind-nvim')

    -- Markdown plugins
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'nvim-mini/mini.nvim', opt = true },
        config = function()
            require('render-markdown').setup({})
        end,
    })

    use({
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        config = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end
    })

    use({
        'xeluxee/competitest.nvim',
        requires = 'MunifTanjim/nui.nvim',
        config = function()
            require('competitest').setup()
        end
    })

    use 'tpope/vim-rails'

    use {
        "stevearc/oil.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
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
    }

    use { "nvim-tree/nvim-web-devicons" }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt" },
            })
        end
    }


    use {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                format_on_save = function(bufnr)
                    local ft = vim.bo[bufnr].filetype
                    if ft == "c" or ft == "cpp" then
                        return { lsp_fallback = false }
                    end
                    return { lsp_fallback = true }
                end,

                -- 1. Configure clang_format to use 4 spaces explicitly
                formatters = {
                    clang_format = {
                        prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 100}" },
                    },
                },
                formatters_by_ft = {
                    -- Web
                    javascript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescript = { "prettier" },
                    typescriptreact = { "prettier" },
                    svelte = { "prettier" },
                    json = { "prettier" },
                    css = { "prettier" },
                    html = { "prettier" },
                    markdown = { "prettier" },

                    -- C/C++
                    c = { "clang_format" },
                    cpp = { "clang_format" },
                },
            })

            -- 2. Force Neovim to visually use 4 spaces for C files so it matches the formatter
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp", "h", "hpp" },
                callback = function()
                    vim.opt_local.tabstop = 4
                    vim.opt_local.shiftwidth = 4
                    vim.opt_local.softtabstop = 4
                    vim.opt_local.expandtab = true
                end,
            })
        end
    }
end)
