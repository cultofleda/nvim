return {
    cmd = {
        "some-sass-language-server",
        "--stdio",
    },
    filetypes = { "css", "vue" },
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
