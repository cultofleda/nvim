return {
    {
        "dnlhc/glance.nvim",
        config = function()
            require("glance").setup({
                detached = false,
                height = 18,
                zindex = 45,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Configure diagnostic display
            vim.diagnostic.config({
                float = {
                    severity_sort = true,
                    source = "if_many",
                    border = "solid",
                    header = {
                        "",
                        "LspDiagnosticsDefaultWarning",
                    },
                    prefix = function(diagnostic)
                        local diag_to_format = {
                            [vim.diagnostic.severity.ERROR] = { "Error", "LspDiagnosticsDefaultError" },
                            [vim.diagnostic.severity.WARN] = { "Warning", "LspDiagnosticsDefaultWarning" },
                            [vim.diagnostic.severity.INFO] = { "Info", "LspDiagnosticsDefaultInfo" },
                            [vim.diagnostic.severity.HINT] = { "Hint", "LspDiagnosticsDefaultHint" },
                        }
                        local res = diag_to_format[diagnostic.severity]
                        return string.format("(%s) ", res[1]), res[2]
                    end,
                },
                severity_sort = true,
            })

            local lspconfig = require("lspconfig")

            ---@diagnostic disable-next-line
            local function get_typescript_server_path(root_dir)
                local global_ts = vim.fn.expand("$FNM_DIR/aliases/default/lib/node_modules/typescript/lib")
                local project_ts = ""
                ---@diagnostic disable-next-line
                local function check_dir(path)
                    project_ts = lspconfig.util.path.join(path, "node_modules", "typescript", "lib")
                    if lspconfig.util.path.exists(project_ts) then
                        return path
                    end
                end
                if lspconfig.util.search_ancestors(root_dir, check_dir) then
                    return project_ts
                else
                    return global_ts
                end
            end

            -- restricted format
            ---@param bufnr number buffer to format
            ---@param allowed_clients string[] client names to allow formatting
            local format_by_client = function(bufnr, allowed_clients)
                vim.lsp.buf.format({
                    bufnr = bufnr,
                    filter = function(client)
                        if not allowed_clients then
                            return true
                        end
                        return vim.tbl_contains(allowed_clients, client.name)
                    end,
                })
            end

            ---@param bufnr number
            ---@param allowed_clients string[]
            local register_format_on_save = function(bufnr, allowed_clients)
                local format_group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = format_group,
                    buffer = bufnr,
                    callback = function()
                        format_by_client(bufnr, allowed_clients)
                    end,
                })
            end

            local custom_attach = function(client, bufnr, format_opts)
                local keymap_opts = { buffer = bufnr, silent = true, noremap = true }
                local with_desc = function(opts, desc)
                    return vim.tbl_extend("force", opts, { desc = desc })
                end
                vim.keymap.set("n", "K", vim.lsp.buf.hover, with_desc(keymap_opts, "Hover"))
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, with_desc(keymap_opts, "[G]o to [d]efinition"))
                vim.keymap.set(
                    "n",
                    "<leader>gr",
                    "<cmd>Glance references<CR>",
                    with_desc(keymap_opts, "[G]lance [r]eferences")
                )
                -- rename symbol
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, with_desc(keymap_opts, "[R]e[n]ame symbol"))
                -- diagnostic(s) on current line
                vim.keymap.set(
                    "n",
                    "<leader>dk",
                    vim.diagnostic.open_float,
                    with_desc(keymap_opts, "[D]iagnostics: [k]current")
                )
                -- move to next diagnostic in buffer
                vim.keymap.set(
                    "n",
                    "<leader>dn",
                    vim.diagnostic.goto_next,
                    with_desc(keymap_opts, "[D]iagnostics: [n]ext")
                )
                -- move to prev diagnostic in buffer
                vim.keymap.set(
                    "n",
                    "<leader>dp",
                    vim.diagnostic.goto_prev,
                    with_desc(keymap_opts, "[D]iagnostics: [p]rev")
                )
                -- show all buffer diagnostics in quick fix list
                vim.keymap.set("n", "<leader>da", vim.diagnostic.setqflist, with_desc(keymap_opts, "Populate qf list"))
                -- restart clients
                vim.keymap.set(
                    "n",
                    "<leader>rr",
                    "<cmd>LspRestart<CR>",
                    with_desc(keymap_opts, "Restart all LSP clients")
                )
                if format_opts ~= nil then
                    vim.keymap.set("n", "<leader>cf", function()
                        format_by_client(bufnr, format_opts.allowed_clients or { client.name })
                    end, with_desc(keymap_opts, "[C]ode [f]ormat")) -- format
                    if format_opts.format_on_save then
                        register_format_on_save(bufnr, format_opts.allowed_clients or { client.name })
                    end
                end
                if client.server_capabilities["documentSymbolProvider"] and client.name ~= "volar" then
                    require("nvim-navic").attach(client, bufnr)
                end
            end

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            lspconfig.emmet_language_server.setup({})

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    custom_attach(client, bufnr, { allowed_clients = { "efm" } })
                end,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = { enable = false },
                    },
                },
            })
            lspconfig.volar.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    custom_attach(client, bufnr)
                end,
                --     NOTE: Let's just keep these here in case we need it later or something
                --     settings = {},
                --     on_new_config = function(new_config, new_root_dir)
                --         local tsserver_path = get_typescript_server_path(new_root_dir)
                --         new_config.init_options.typescript.tsdk = tsserver_path
                --     end,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    custom_attach(client, bufnr)
                end,
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vim.fn.expand(
                                "$FNM_DIR/aliases/default/lib/node_modules/@vue/typescript-plugin/"
                            ),
                            languages = { "vue", "javascript", "typescript" },
                            configNamespace = "typescript",
                            enableForWorkspaceTypeScriptVersions = true,
                        },
                    },
                },
                filetypes = {
                    "javascript",
                    "typescript",
                    "vue",
                },
            })
            -- lspconfig.eslint.setup({
            --     capabilities = capabilities,
            --     on_attach = function(client, bufnr)
            --         custom_attach(client, bufnr)
            --     end,
            -- })
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ensure_installed = {
                    "prettier",
                    "stylua",
                },
            })
            vim.keymap.set("n", "<leader>cm", "<CMD>Mason<CR>", { silent = true, desc = "Mason" })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "emmet_language_server",
                    "lua_ls",
                    "volar",
                    "ts_ls",
                    -- "eslint",
                },
            })
        end,
    },
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            require("actions-preview").setup({})
            vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions)
        end,
    },
}
