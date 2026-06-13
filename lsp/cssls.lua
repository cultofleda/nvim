return {
    cmd = {
        "vscode-css-language-server",
        "--stdio",
    },
    filetypes = { "css" },
    single_file_support = true,
    init_options = { provideFormatter = false },
    root_markers = { "package.json", ".git" },
}
