-- -----------------------------------------------------------------------------
-- -------------------------- THEME / COLOR SCHEME -----------------------------
--------------------------------------------------------------------------------
-- -------------------------- Default to dark mode -----------------------------
vim.o.background = "dark"

-- -------------------------- Text-to-color-scheme -----------------------------
require("text-to-colorscheme").setup {
    ai = {openai_api_key = os.getenv "OPENAI_API_KEY"},
    hex_palettes = {
        {
            name = "purple mountain sunset",
            background_mode = "dark",
            background = "#100915",
            foreground = "#ffe9bb",
            accents = {
                "#ff916f", "#ff5370", "#d99fff", "#82aaff", "#d6ff9b",
                "#89ddff", "#ffcb6b"
            }
        }, {
            name = "Fallout Boy",
            background_mode = "dark",
            background = "#000000",
            foreground = "#fbfffc",
            accents = {
                "#9ad1ff", "#ffd27b", "#f4ff8c", "#add9ff", "#f3caff",
                "#b9fff6", "#ff8080"
            }
        }, {
            name = "Christmas morning",
            background_mode = "dark",
            background = "#2b2f37",
            foreground = "#f5f5f5",
            accents = {
                "#e31414", "#11c118", "#e3e314", "#14e3e3", "#e314e3",
                "#e3e314", "#11c111"
            }
        }, {
            name = "Fallout Pip-boy",
            background_mode = "dark",
            background = "#10231e",
            foreground = "#cff5db",
            accents = {
                "#32beb4", "#a5be00", "#ffc100", "#ff5e1c", "#ff3a36",
                "#ff419d", "#8d93ff"
            }
        }, {
            name = "Retro green terminal",
            background_mode = "dark",
            background = "#000000",
            foreground = "#00d900",
            accents = {
                "#006d00", "#00a300", "#00be00", "#6dd96d", "#36d936",
                "#1bd91b", "#52d952"
            }
        }, {
            name = "Hotdogs for lunch",
            background_mode = "dark",
            background = "#1f1a17",
            foreground = "#f7e6c6",
            accents = {
                "#ff2b2b", "#ff6e1a", "#f7d117", "#9bb22e", "#4db8ff",
                "#f7a8b8", "#ff6eb4"
            }
        }, {
            name = "World of Warcraft Alliance",
            background_mode = "dark",
            background = "#0a1128",
            foreground = "#e6e6e6",
            accents = {
                "#0055a4", "#ffd700", "#a77ac4", "#e5e5e5", "#0070dd",
                "#ff7d0a", "#91b462"
            }
        }, {
            name = "stormwind city guard",
            background_mode = "dark",
            background = "#1a1f2b",
            foreground = "#a7aaa8",
            accents = {
                "#5f819d", "#f0c674", "#ab4642", "#899a5c", "#7cafc2",
                "#ba8baf", "#a16946"
            }
        }, {
            name = "world of warcraft horde",
            background_mode = "dark",
            background = "#1a1a1d",
            foreground = "#e6e6e6",
            accents = {
                "#b30000", "#ff6600", "#cc0000", "#990000", "#ff3300",
                "#830000", "#cc3300"
            }
        }, {
            name = "Rootiest",
            background_mode = "dark",
            background = "#1f1b18",
            foreground = "#d9c8b3",
            accents = {
                "#b86d29", "#898e26", "#5d7a26", "#267a5d", "#2d6d8f",
                "#6d2d8f", "#8f2d6d"
            }
        }, {
            name = "yourbuddydinec",
            background_mode = "dark",
            background = "#1e1e1e",
            foreground = "#d4d4d4",
            accents = {
                "#569cd6", "#dcdcaa", "#42ab96", "#c586c0", "#9cdcfe",
                "#f44747", "#ce9178"
            }
        }, {
            name = "world of warcraft draenei",
            background_mode = "dark",
            background = "#1a1a2d",
            foreground = "#c9c9d1",
            accents = {
                "#4a4a9d", "#6a6ac9", "#9d9dd1", "#c9c9ff", "#6b6b93",
                "#6a6a99", "#9d9dc9"
            }
        }, {
            name = "Tropical fish swimming in an ocean reef",
            background_mode = "dark",
            background = "#023047",
            foreground = "#cae9ff",
            accents = {
                "#f77f00", "#d62828", "#fcbf49", "#e76f51", "#279386",
                "#4f92ad", "#e9c46a"
            }
        }
    },
    default_palette = "Fallout Boy"
}

-- vim.cmd([[colorscheme text-to-colorscheme]])

-- --------------------------- Umbra Color Scheme ------------------------------
local umbra = require "umbra"

umbra.setup {
    -- Main options --
    style = "bloodmoon", -- Default theme style. Choose between 'bloodmoon', 'moonlight', 'darkest', 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = "!", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {
        "moonlight", "darkest", "bloodmoon", -- 'deep',
        -- 'warm',
        "warmer", -- 'dark',
        -- 'darker',
        "cool", "light"
    }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none"
    },

    -- Lualine options --
    lualine = {
        transparent = false -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = { -- Override highlight groups
    },

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true -- use background color for virtual text
    }
}

umbra.load()

-- ---------------------------- Catppuccin Theme -------------------------------
require("catppuccin").setup {
    integrations = {
        cmp = true,
        barbar = true,
        diffview = true,
        dashboard = true,
        coc_nvim = true,
        gitsigns = true,
        nvimtree = true,
        neotree = true,
        treesitter = true,
        markdown = true,
        sandwich = true,
        which_key = true,
        telescope = {enabled = true, style = "nvchad"},
        illuminate = {enabled = true, lsp = true},
        notify = true,
        notifier = true,
        dap = true,
        dap_ui = true,
        ts_rainbow2 = true,
        rainbow_delimiters = true,
        lsp_trouble = true,
        noice = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = {"italic"},
                hints = {"italic"},
                warnings = {"italic"},
                information = {"italic"},
                ok = {"italic"}
            },
            underlines = {
                errors = {"underline"},
                hints = {"underline"},
                warnings = {"underline"},
                information = {"underline"},
                ok = {"underline"}
            },
            inlay_hints = {background = true}
        },
        mini = {enabled = true, indentscope_color = "mauve"}
    }
}

-- Apply the colorscheme
-- Options: catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd.colorscheme "catppuccin-frappe"
