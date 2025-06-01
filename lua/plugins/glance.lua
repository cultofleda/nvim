return {
    "dnlhc/glance.nvim",
    opts = {
        detached = false,
        height = 18,
        zindex = 45,
    },
    keys = {
        {
            "<leader>gr",
            "<CMD>Glance references<CR>",
            desc = "[G]lance [r]eferences",
        },
        {
            "<leader>gd",
            "<CMD>Glance definitions<CR>",
            desc = "[G]lance [d]efinitions",
        },
        {
            "<leader>gy",
            "<CMD>Glance type_definitions<CR>",
            desc = "[G]lance t[y]pe definitions",
        },
        {
            "<leader>gm",
            "<CMD>Glance implementations<CR>",
            desc = "[G]lance i[m]plementations",
        },
    },
}
