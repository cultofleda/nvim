return {
    "windwp/nvim-ts-autotag",
    config = function()
        local opts = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = false,
        }
        require("nvim-ts-autotag").setup({ opts = opts })
    end,
}
