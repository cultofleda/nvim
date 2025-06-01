local tsdk_path = vim.fn.expand("$HOME/npmbin/node_modules/typescript/lib")

return {
    cmd = {
        "vue-language-server",
        "--stdio",
    },
    filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
    },
    init_options = {
        typescript = {
            hostInfo = "neovim",
            tsdk = tsdk_path,
        },
        vue = {
            --- so I guess we just enable this, tell ts_ls to go fuck itself and just use volar for everything?
            hybridMode = false,
        },
    },
    on_new_config = function(new_config, new_root_dir)
        local lib_path = vim.fs.find("node_modules/typescript/lib", {
            path = new_root_dir,
            upwards = true,
        })[1]
        if lib_path then
            new_config.init_options.typescript.tsdk = lib_path
        end
    end,
}
