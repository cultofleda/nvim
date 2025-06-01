return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "moyiz/blink-emoji.nvim",
    },
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
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                buffer = {
                    opts = {
                        get_bufnrs = function()
                            return vim.tbl_filter(function(bufnr)
                                return vim.bo[bufnr].buftype == ""
                            end, vim.api.nvim_list_bufs())
                        end,
                    },
                },
                emoji = {
                    module = "blink-emoji",
                    name = "Emoji",
                    score_offset = 15,
                    opts = { insert = true },
                    should_show_items = function()
                        return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
                    end,
                },
            },
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji" },
            min_keyword_length = function(ctx)
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
