return {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = {
        "justinsgithub/wezterm-types",
    },
    library = {
        "lazy.nvim",
        {
            path = "wezterm-types",
            mods = {
                "wezterm",
            },
        },
    },
}
