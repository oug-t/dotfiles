return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({
            additional_args = function()
              return { "--hidden" }
            end,
          })
        end,
        desc = "Find Strings",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").git_commits()
        end,
        desc = "Find Commits",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find Buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Find Help",
      },
      {
        "<leader>fm",
        function()
          require("telescope.builtin").marks()
        end,
        desc = "Find Marks",
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/",
            "%.venv/",
            "__pycache__/",
            "%.git/",
            "%.o$",
            "%.ko$",
            "%.a$",
            "%.mod$",
            "%.mod%.c$",
            "%.cmd$",
            "%.d$",
            "^tags$",
            "^cscope%..*",
            "%.orig$",
            "%.rej$",
            "~$",
            "^vmlinux$",
            "^modules%.order$",
            "^Module%.symvers$",
          },
        },
        extensions = {
          fzf = {},
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Gvdiffsplit", "Git" },
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git Status" },
      { "<leader>gd", "<cmd>Gvdiffsplit!<cr>", desc = "Git Diff" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git Blame" },
    },
  },
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
        },
        columns = { "icon", "permissions", "size" },
        view_options = { show_hidden = true, natural_order = true },
        float = { padding = 2, border = "rounded" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "oil",
        callback = function()
          vim.cmd("syntax on")
        end,
      })
    end,
  },
}
