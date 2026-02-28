return {
    "christoomey/vim-tmux-navigator",
    "ThePrimeagen/vim-be-good",
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
                "NordDeepBlue", "NordMediumBlue", "NordFrostBlue",
                "NordCyan", "NordLightBlue",
            }

            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "NordDeepBlue", { fg = "#5e81ac" })
                vim.api.nvim_set_hl(0, "NordMediumBlue", { fg = "#81a1c1" })
                vim.api.nvim_set_hl(0, "NordFrostBlue", { fg = "#88c0d0" })
                vim.api.nvim_set_hl(0, "NordCyan", { fg = "#8fbcbb" })
                vim.api.nvim_set_hl(0, "NordLightBlue", { fg = "#a3be8c" })
            end)

            require("ibl").setup({
                indent = { char = "┆", highlight = highlight },
                scope = { enabled = false },
            })
        end,
    },
}
