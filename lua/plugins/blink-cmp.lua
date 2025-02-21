return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        keymap = {
            -- available presets: 'super-tab' | 'default' | 'enter'
            preset = "super-tab",
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "normal",
        },
        sources = {
            providers = {
                buffer = {
                    opts = {
                        -- get all buffers, even ones like neo-tree
                        get_bufnrs = vim.api.nvim_list_bufs,
                        -- or (recommended) filter to only "normal" buffers
                        get_bufnrs = function()
                            return vim.tbl_filter(function(bufnr)
                                return vim.bo[bufnr].buftype == ""
                            end, vim.api.nvim_list_bufs())
                        end,
                    },
                },
            },
            default = { "lsp", "path", "snippets", "buffer" },
            min_keyword_length = function(ctx)
                -- only applies when typing a command, doesn't apply to arguments
                if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                    return 4
                end
                return 0
            end,
        },
        completion = {
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                return kind_icon
                            end,
                            -- Optionally, you may also use the highlights from mini.icons
                            highlight = function(ctx)
                                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                return hl
                            end,
                        },
                    },
                },
            },
        },
    },
    opts_extend = { "sources.default" },
}
