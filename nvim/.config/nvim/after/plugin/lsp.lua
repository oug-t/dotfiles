local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<leader>ld', require('telescope.builtin').diagnostics, { desc = 'List diagnostics' })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'eslint', 'lua_ls', 'rust_analyzer', 'pyright', 'jdtls', 'solargraph', 'tailwindcss', 'html' },
    handlers = {
        lsp_zero.default_setup,

        -- Dedicated handler for ruby_lsp
        ruby_lsp = function()
            require('lspconfig').ruby_lsp.setup({
                -- Optional: enable specific features if needed
                init_options = {
                    formatter = 'rubocop',
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

        tailwindcss = function()
            require('lspconfig').tailwindcss.setup({
                filetypes = { "html", "erb", "ruby", "javascript", "typescript", "react", "css" },
                init_options = {
                    userLanguages = {
                        erb = "html",
                        ruby = "html"
                    }
                },
                settings = {
                    tailwindCSS = {
                        experimental = {
                            classRegex = {
                                -- This allows tailwind completion inside Rails helper strings
                                "class:\\s*\"([^\"]*)", 
                                "class:\\s*'([^']*)",
                                "~\\s*\"([^\"]*)",
                            },
                        },
                    },
                },
            })
        end,
    },
})

-- nvim-cmp setup (remains the same as your snippet)
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp_mappings,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    formatting = {
        format = require('lspkind').cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                path = "[Path]",
            },
        }),
    },
    experimental = {
        ghost_text = true,
    },
})

lsp_zero.setup()
