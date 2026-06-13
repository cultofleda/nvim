return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function(_, opts)
        require("gitsigns").setup(opts)
        -- just show inline blame by default
        vim.cmd("Gitsigns toggle_current_line_blame")
    end,
}
