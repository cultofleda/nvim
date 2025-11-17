local vue_language_server_path = vim.fn.expand("$HOME/.volta/tools/shared/@vue/language-server")

local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
}

local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = tsserver_filetypes,
    init_options = { plugins = { vue_plugin } },
}
