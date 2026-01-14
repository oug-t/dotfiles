require 'nvim-treesitter'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "python", "ruby", "html", "css", "svelte", "ocaml" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
