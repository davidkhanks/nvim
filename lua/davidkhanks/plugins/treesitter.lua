local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    print("nvim-treesitter not installed")
    return
end

treesitter.setup({
    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "html",
        "json",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "scss",
        "query",
        "svelte",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    },
    auto_install = true
})
