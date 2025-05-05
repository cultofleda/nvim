return {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    setup = function()
        require("git-conflict").setup({
            default_mappings = {
                ours = "o",
                theirs = "t",
                none = "0",
                both = "b",
                next = "n",
                prev = "p",
            },
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "GitConflictDetected",
            callback = function()
                vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
                vim.keymap.set("n", "cww", function()
                    engage.conflict_buster()
                    create_buffer_local_mappings()
                end)
            end,
        })
    end,
}
