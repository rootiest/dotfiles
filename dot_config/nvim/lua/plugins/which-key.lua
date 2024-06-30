return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register({
            ["x"] = {
                name = "+󰘦 Code",
                ["b"] = {"<cmd>Neotree close<cr>:windo set invscrollbind<cr>","󱅜 Toggle Scrollbind"},
                ["c"] = {"<cmd>set invcursorline<c>", " Toggle Cursor Line"},
                ["t"] = {"<cmd>Twilight<cr>", " Twilight"},
                ["y"] = {"<cmd>Telescope yank_history<cr>", "󰘦 Yank History"},
                ["g"] = {
                    name =  " Git",
                    ["g"] = {"<cmd>Fugit2<cr>", " Git Overview"},
                    ["d"] = {"<cmd>Fugit2Diff<cr>", " Git Diff"},
                    ["l"] = {"<cmd>Fugit2Graph<cr>", " Git Graph"},
                },
            },
            ["r"] = {
                name = "+󰕍 Reset",
                ["t"] = {name = "+ Tree",},
            },
            ["rc"] = { name = "+ Colors" },
            ["m"] = { name = "+󰍍 MiniMap" },
            ["rc"] = {
                name = "+ Colors",
                ["f"] = {"<cmd>lua vim.cmd.colorscheme 'catppuccin-frappe'<cr>", "󰄛 Catppuccin Frappe"},
                ["m"] = {"<cmd>lua vim.cmd.colorscheme 'catppuccin-macchiato'<cr>", "󰄛 Catppuccin Macchiato"},
                ["o"] = {"<cmd>lua vim.cmd.colorscheme 'catppuccin-mocha'<cr>", "󰄛 Catppuccin Mocha"},
                ["l"] = {"<cmd>lua vim.cmd.colorscheme 'catppuccin-latte'<cr>", "󰄛 Catppuccin Latte"},
                ["a"] = {"<cmd>lua vim.cmd.colorscheme 'morning'<cr>", " Morning"},
                ["k"] = {"<cmd>lua vim.cmd.colorscheme 'kanagawa-dragon'<cr>", "  Kanagawa Dragon"},
                ["d"] = {"<cmd>T2CSelect yourbuddydinec<cr>", "󰱫 YourBuddyDinec's Colorscheme"},
                ["u"] = {"<cmd>lua vim.cmd.colorscheme 'umbra'<cr>", " Umbra Bloodmoon"}
            },
            ["s"] = {
                name = "+ Search",
                ["w"] = {"<cmd>lua require('spectre').open_visual()<cr>", " Search current word"},
                ["p"] = {"<cmd>lua require('spectre').open_file_search()<cr>", " Search on current file"},
                ["l"] = { name = "󰨇 Load Session" },
                ["n"] = { name = "󰨇 New Session" },
                ["d"] = { name = "󰨇 Delete Session" },
                ["u"] = { name = "󰨇 Update Session" }
            },
            ["S"] = {'<cmd>lua require("spectre").toggle()<CR>',"󰊠 Toggle Spectre"},
            ["dd"] = {"<cmd>Trouble diagnostics toggle<cr>", " Toggle Diagnostics"},
            ["gg"] = {"<cmd>Fugit2<cr>", " Git Overview"},
            ["z"] = {"<cmd>lua require('zen-mode').toggle({window = {width = 0.85, options = {number = false, relativenumber = false, signcolumn = 'no'}}})<cr>", "󱅼 Toggle Zen Mode"},
        }, { prefix = "<leader>", mode = "n", silent = true, noremap = true, nowait = true })
    end,
}