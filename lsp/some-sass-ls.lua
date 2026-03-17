return {
    cmd = {
        "some-sass-language-server",
        "--stdio",
    },
    filetypes = { "scss", "sass", "vue" },
    single_file_support = true,
    root_markers = {
        { ".git", "package.json" },
    },
    settings = {
        somesass = {
            suggestAllFromOpenDocument = true,
        },
    },
}
