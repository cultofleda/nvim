return {
    "MagicDuck/grug-far.nvim",
    config = function()
        local options = {}
        require("grug-far").setup(options)
        vim.keymap.set("n", "<leader>sr", "<CMD>GrugFar<CR>", { silent = true })
    end,
}
