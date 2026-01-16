-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/tommy/.cache/nvim/packer_hererocks/2.1.1767980792/share/lua/5.1/?.lua;/Users/tommy/.cache/nvim/packer_hererocks/2.1.1767980792/share/lua/5.1/?/init.lua;/Users/tommy/.cache/nvim/packer_hererocks/2.1.1767980792/lib/luarocks/rocks-5.1/?.lua;/Users/tommy/.cache/nvim/packer_hererocks/2.1.1767980792/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tommy/.cache/nvim/packer_hererocks/2.1.1767980792/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["competitest.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16competitest\frequire\0" },
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/competitest.nvim",
    url = "https://github.com/xeluxee/competitest.nvim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\no\0\1\3\0\a\0\f6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\3\0X\2\2€\a\1\4\0X\2\2€5\2\5\0L\2\2\0005\2\6\0L\2\2\0\1\0\1\17lsp_fallback\2\1\0\1\17lsp_fallback\1\bcpp\6c\rfiletype\abo\bvim‚\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\4\0=\1\2\0006\0\0\0009\0\1\0)\1\4\0=\1\3\0006\0\0\0009\0\1\0)\1\4\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0K\0\1\0\14expandtab\16softtabstop\15shiftwidth\ftabstop\14opt_local\bvimó\6\1\0\6\0-\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\3=\3#\2B\0\2\0016\0$\0009\0%\0009\0&\0'\2'\0005\3)\0005\4(\0=\4*\0033\4+\0=\4,\3B\0\3\1K\0\1\0\rcallback\0\fpattern\1\0\2\fpattern\0\rcallback\0\1\5\0\0\6c\bcpp\6h\bhpp\rFileType\24nvim_create_autocmd\bapi\bvim\21formatters_by_ft\bcpp\1\2\0\0\17clang_format\6c\1\2\0\0\17clang_format\rmarkdown\1\2\0\0\rprettier\thtml\1\2\0\0\rprettier\bcss\1\2\0\0\rprettier\tjson\1\2\0\0\rprettier\vsvelte\1\2\0\0\rprettier\20typescriptreact\1\2\0\0\rprettier\15typescript\1\2\0\0\rprettier\20javascriptreact\1\2\0\0\rprettier\15javascript\1\0\v\vsvelte\0\20typescriptreact\0\15typescript\0\tjson\0\rmarkdown\0\15javascript\0\20javascriptreact\0\6c\0\bcpp\0\thtml\0\bcss\0\1\2\0\0\rprettier\15formatters\17clang_format\1\0\1\17clang_format\0\17prepend_args\1\0\1\17prepend_args\0\1\2\0\0C--style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 100}\19format_on_save\1\0\3\21formatters_by_ft\0\19format_on_save\0\15formatters\0\0\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n²\2\0\0\5\0\r\0$6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0005\4\4\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\5\0005\4\6\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\a\0005\4\b\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\t\0005\4\n\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\v\0005\4\f\0B\0\4\1K\0\1\0\1\0\1\afg\f#a3be8c\18NordLightBlue\1\0\1\afg\f#8fbcbb\rNordCyan\1\0\1\afg\f#88c0d0\18NordFrostBlue\1\0\1\afg\f#81a1c1\19NordMediumBlue\1\0\1\afg\f#5e81ac\17NordDeepBlue\16nvim_set_hl\bapi\bvim§\2\1\0\6\0\15\0\0216\0\0\0'\2\1\0B\0\2\0025\1\2\0009\2\3\0009\4\4\0009\4\5\0043\5\6\0B\2\3\0016\2\0\0'\4\a\0B\2\2\0029\2\b\0025\4\v\0005\5\t\0=\1\n\5=\5\f\0045\5\r\0=\5\14\4B\2\2\1K\0\1\0\nscope\1\0\1\fenabled\1\vindent\1\0\2\nscope\0\vindent\0\14highlight\1\0\2\14highlight\0\tchar\bâ”†\nsetup\bibl\0\20HIGHLIGHT_SETUP\ttype\rregister\1\6\0\0\17NordDeepBlue\19NordMediumBlue\18NordFrostBlue\rNordCyan\18NordLightBlue\14ibl.hooks\frequire\0" },
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0" },
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/opt/mini.nvim",
    url = "https://github.com/nvim-mini/mini.nvim"
  },
  nightfox = {
    config = { "\27LJ\2\n–\1\0\0\4\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\fnordfox\16colorscheme\bcmd\bvim\foptions\1\0\1\foptions\0\1\0\1\16transparent\2\nsetup\rnightfox\frequire\0" },
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/nightfox",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n‚\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\1\21disable_filetype\0\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\nÞ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\nfloat\1\0\2\fpadding\3\2\vborder\frounded\17view_options\1\0\2\16show_hidden\2\18natural_order\2\fcolumns\1\0\3\17view_options\0\fcolumns\0\nfloat\0\1\4\0\0\ticon\16permissions\tsize\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rainbow-delimiters.nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/rainbow-delimiters.nvim",
    url = "https://github.com/hiphish/rainbow-delimiters.nvim"
  },
  ["render-markdown.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/opt/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/vim-be-good",
    url = "https://github.com/ThePrimeagen/vim-be-good"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/tommy/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "config", "markdown-preview.nvim")
time([[Config for markdown-preview.nvim]], false)
-- Config for: nightfox
time([[Config for nightfox]], true)
try_loadstring("\27LJ\2\n–\1\0\0\4\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\fnordfox\16colorscheme\bcmd\bvim\foptions\1\0\1\foptions\0\1\0\1\16transparent\2\nsetup\rnightfox\frequire\0", "config", "nightfox")
time([[Config for nightfox]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\nÞ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\nfloat\1\0\2\fpadding\3\2\vborder\frounded\17view_options\1\0\2\16show_hidden\2\18natural_order\2\fcolumns\1\0\3\17view_options\0\fcolumns\0\nfloat\0\1\4\0\0\ticon\16permissions\tsize\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\no\0\1\3\0\a\0\f6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\3\0X\2\2€\a\1\4\0X\2\2€5\2\5\0L\2\2\0005\2\6\0L\2\2\0\1\0\1\17lsp_fallback\2\1\0\1\17lsp_fallback\1\bcpp\6c\rfiletype\abo\bvim‚\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\4\0=\1\2\0006\0\0\0009\0\1\0)\1\4\0=\1\3\0006\0\0\0009\0\1\0)\1\4\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0K\0\1\0\14expandtab\16softtabstop\15shiftwidth\ftabstop\14opt_local\bvimó\6\1\0\6\0-\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\3=\3#\2B\0\2\0016\0$\0009\0%\0009\0&\0'\2'\0005\3)\0005\4(\0=\4*\0033\4+\0=\4,\3B\0\3\1K\0\1\0\rcallback\0\fpattern\1\0\2\fpattern\0\rcallback\0\1\5\0\0\6c\bcpp\6h\bhpp\rFileType\24nvim_create_autocmd\bapi\bvim\21formatters_by_ft\bcpp\1\2\0\0\17clang_format\6c\1\2\0\0\17clang_format\rmarkdown\1\2\0\0\rprettier\thtml\1\2\0\0\rprettier\bcss\1\2\0\0\rprettier\tjson\1\2\0\0\rprettier\vsvelte\1\2\0\0\rprettier\20typescriptreact\1\2\0\0\rprettier\15typescript\1\2\0\0\rprettier\20javascriptreact\1\2\0\0\rprettier\15javascript\1\0\v\vsvelte\0\20typescriptreact\0\15typescript\0\tjson\0\rmarkdown\0\15javascript\0\20javascriptreact\0\6c\0\bcpp\0\thtml\0\bcss\0\1\2\0\0\rprettier\15formatters\17clang_format\1\0\1\17clang_format\0\17prepend_args\1\0\1\17prepend_args\0\1\2\0\0C--style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 100}\19format_on_save\1\0\3\21formatters_by_ft\0\19format_on_save\0\15formatters\0\0\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n‚\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\1\21disable_filetype\0\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n²\2\0\0\5\0\r\0$6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0005\4\4\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\5\0005\4\6\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\a\0005\4\b\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\t\0005\4\n\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\v\0005\4\f\0B\0\4\1K\0\1\0\1\0\1\afg\f#a3be8c\18NordLightBlue\1\0\1\afg\f#8fbcbb\rNordCyan\1\0\1\afg\f#88c0d0\18NordFrostBlue\1\0\1\afg\f#81a1c1\19NordMediumBlue\1\0\1\afg\f#5e81ac\17NordDeepBlue\16nvim_set_hl\bapi\bvim§\2\1\0\6\0\15\0\0216\0\0\0'\2\1\0B\0\2\0025\1\2\0009\2\3\0009\4\4\0009\4\5\0043\5\6\0B\2\3\0016\2\0\0'\4\a\0B\2\2\0029\2\b\0025\4\v\0005\5\t\0=\1\n\5=\5\f\0045\5\r\0=\5\14\4B\2\2\1K\0\1\0\nscope\1\0\1\fenabled\1\vindent\1\0\2\nscope\0\vindent\0\14highlight\1\0\2\14highlight\0\tchar\bâ”†\nsetup\bibl\0\20HIGHLIGHT_SETUP\ttype\rregister\1\6\0\0\17NordDeepBlue\19NordMediumBlue\18NordFrostBlue\rNordCyan\18NordLightBlue\14ibl.hooks\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: competitest.nvim
time([[Config for competitest.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16competitest\frequire\0", "config", "competitest.nvim")
time([[Config for competitest.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd render-markdown.nvim ]]

-- Config for: render-markdown.nvim
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0", "config", "render-markdown.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
