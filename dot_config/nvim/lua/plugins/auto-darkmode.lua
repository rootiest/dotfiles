return {
    "f-person/auto-dark-mode.nvim",
    opts = {
        update_interval = 1000,
        set_dark_mode = function()
            vim.api.nvim_set_option("background", "dark")
            vim.cmd.colorscheme "catppuccin-frappe"
            --vim.cmd([[colorscheme text-to-colorscheme]])
        end,
        set_light_mode = function()
            vim.api.nvim_set_option("background", "light")
            vim.cmd.colorscheme "catppuccin-latte"
        end,
    },
}