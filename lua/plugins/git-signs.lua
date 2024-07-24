return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local opts = {}
        require("gitsigns").setup(opts)
        -- just show inline blame by default
        vim.cmd("Gitsigns toggle_current_line_blame")
        vim.cmd(":set signcolumn=yes:1")
    end,
}
