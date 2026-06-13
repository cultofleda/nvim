vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        map("<leader>cf", vim.lsp.buf.format, "[C]ode [f]ormat")
        map("<leader>ca", require("actions-preview").code_actions, "[C]ode [a]ctions")

        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame symbol")

        -- map("gd", "<CMD>Telescope lsp_definitions<CR>", "[G]oto [d]efinition")
        map("<leader>gdv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "[G]oto [d]efinition ([v]ertical split)")
        map("<leader>gdh", "<cmd>split | lua vim.lsp.buf.definition()<cr>", "[G]oto [d]efinition ([h]orizontal split)")

        map("K", vim.lsp.buf.hover, "[K]hover")

        map("<leader>dk", vim.diagnostic.open_float, "[D]iagnostics [k]current")
        map("<leader>dn", function()
            vim.diagnostic.jump({ count = 1 })
        end, "[D]iagnostics [n]ext")
        map("<leader>dp", function()
            vim.diagnostic.jump({ count = -1 })
        end, "[D]iagnostics [p]rev")

        local function client_supports_method(client, method, bufnr)
            if vim.fn.has("nvim-0.11") == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
            client
            and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
        then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            -- When cursor stops moving: Highlights all instances of the symbol under the cursor
            -- When cursor moves: Clears the highlighting
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })
            -- When LSP detaches: Clears the highlighting
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                end,
            })
        end
        -- try linting the file once LSP is attached
        require("lint").try_lint()
    end,
    desc = "Autocommand for attaching and detaching LSP to any document. Also add linting",
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
})

-- lint file after save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
    desc = "Add linting after saving the buffer",
})
