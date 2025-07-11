local tsdk_path = vim.fn.expand("$HOME/.local/npmbin/node_modules/typescript/lib")

return {
    cmd = {
        "vue-language-server",
        "--stdio",
    },
    on_init = function(client)
        client.handlers["tsserver/request"] = function(_, result, context)
            local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
            if #clients == 0 then
                vim.notify(
                    "Could not found `vtsls` lsp client, vue_lsp would not work without it.",
                    vim.log.levels.ERROR
                )
                return
            end
            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
                title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                command = "typescript.tsserverRequest",
                arguments = {
                    command,
                    payload,
                },
            }, { bufnr = context.bufnr }, function(_, r)
                local response_data = { { id, r.body } }
                ---@diagnostic disable-next-line: param-type-mismatch
                client:notify("tsserver/response", response_data)
            end)
        end
    end,
    -- cmd = {
    --     "vue-language-server",
    --     "--stdio",
    -- },
    -- filetypes = {
    --     "typescript",
    --     "javascript",
    --     "javascriptreact",
    --     "typescriptreact",
    --     "vue",
    -- },
    -- init_options = {
    --     typescript = {
    --         hostInfo = "neovim",
    --         tsdk = tsdk_path,
    --     },
    --     vue = {
    --         --- so I guess we just enable this, tell ts_ls to go fuck itself and just use volar for everything?
    --         hybridMode = false,
    --     },
    -- },
    -- on_new_config = function(new_config, new_root_dir)
    --     local lib_path = vim.fs.find("node_modules/typescript/lib", {
    --         path = new_root_dir,
    --         upwards = true,
    --     })[1]
    --     if lib_path then
    --         new_config.init_options.typescript.tsdk = lib_path
    --     end
    -- end,
}
