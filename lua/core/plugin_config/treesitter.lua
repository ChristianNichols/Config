require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "vim",
        "vimdoc",
        "lua",
        "python",
        "cmake",
        "make",
        "json",
        "asm",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
