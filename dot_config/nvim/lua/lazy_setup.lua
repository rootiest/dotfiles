require("lazy").setup({
    -- AstroNVIM
    {
        "AstroNvim/AstroNvim",
        version = "^4", -- Remove version tracking to elect for nighly AstroNvim
        import = "astronvim.plugins",
        opts = { -- AstroNvim options must be set here with the `import` key
            mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
            maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
            icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
            pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
            update_notifications = true -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
        }
    }, -- Community Plugins
    {import = "community"}, {import = "plugins"}, -- ToggleTerm
    {"akinsho/toggleterm.nvim", version = false, lazy = false}, {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = true,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim", "3rd/image.nvim" -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }, 
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },  
    -- Image
    {
        "3rd/image.nvim"
        -- dependencies = { "luarocks.nvim" },
    }, {"arkav/lualine-lsp-progress", event = "VeryLazy",}, -- Niuiic
    {"niuiic/core.nvim"}, -- CodeShot
    {
        "niuiic/code-shot.nvim",
        dependencies = {"krivahtoo/silicon.nvim", "niuiic/core.nvim"}
    }, -- Telescope FZF
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }, 
    {
        'junegunn/fzf'
    },-- NeoGit
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua" -- optional
        },
        config = true
    }, -- Hologram
    {"edluffy/hologram.nvim"}, -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {"nvim-lua/plenary.nvim"}
    }, -- Legendar
    {
        "mrjones2014/legendary.nvim",
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        priority = 10000,
        lazy = false,
        -- sqlite is only needed if you want to use frecency sorting
        dependencies = {"kkharji/sqlite.lua"}
    }, -- Mini NVim
    {"echasnovski/mini.nvim", version = false},
    {"echasnovski/mini.map", version = false},
    {
        "gorbit99/codewindow.nvim",
        version = false,
        config = function()
            local codewindow = require('codewindow')
            codewindow.setup()
            codewindow.apply_default_keybinds()
        end,
    },
    {"echasnovski/mini.animate", version = false},
    {"echasnovski/mini.comment", version = false}, -- Session stuff
    {"Shatur/neovim-session-manager"}, --[[     {
        "gennaro-tedesco/nvim-possession",
        dependencies = {"ibhagwan/fzf-lua"},
        config = true,
        init = function()
            local possession = require "nvim-possession"
            vim.keymap.set("n", "<leader>sl", function()
                possession.list()
            end)
            vim.keymap.set("n", "<leader>sn", function()
                possession.new()
            end)
            vim.keymap.set("n", "<leader>su", function()
                possession.update()
            end)
            vim.keymap.set("n", "<leader>sd", function()
                possession.delete()
            end)
        end
    }, ]] --[[     {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
            }
        end
    }, ]] -- Edgy
    --[[     {
        "folke/edgy.nvim",
        event = "VeryLazy",
        init = function()
            vim.opt.laststatus = 3
            vim.opt.splitkeep = "screen"
        end,
        opts = {
            bottom = {
                -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
                {
                ft = "toggleterm",
                size = { height = 0.4 },
                -- exclude floating windows
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
                },
                {
                ft = "lazyterm",
                title = "LazyTerm",
                size = { height = 0.4 },
                filter = function(buf)
                    return not vim.b[buf].lazyterm_cmd
                end,
                },
                "Trouble",
                { ft = "qf", title = "QuickFix" },
                {
                ft = "help",
                size = { height = 20 },
                -- only show help buffers
                filter = function(buf)
                    return vim.bo[buf].buftype == "help"
                end,
                },
                { ft = "spectre_panel", size = { height = 0.4 } },
            },
            left = {
                -- Neo-tree filesystem always takes half the screen height
                {
                title = "Filesystem",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "filesystem"
                end,
                size = { height = 0.5 },
                },
                {
                title = "Git",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "git_status"
                end,
                pinned = true,
                open = "Neotree position=right git_status",
                },
                {
                title = "Buffers",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "buffers"
                end,
                pinned = true,
                open = "Neotree position=top buffers",
                },
                {
                ft = "Outline",
                pinned = true,
                open = "OutlineOpen",
                },
                {
                    title = "Diagnostics",
                    ft = "trouble",
                    pinned = true,
                    open = "Trouble diagnostics toggle focus=false filter.buf=0",
                },
                -- any other neo-tree windows
                "neo-tree",
            },
        },
    }, ]] -- Tailwind
    {
        "luckasRanarison/tailwind-tools.nvim",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        opts = {} -- your configuration
    }, -- Nv-cmp
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        dependencies = {
            "luckasRanarison/tailwind-tools.nvim", "onsails/lspkind-nvim"
        },
        opts = {
            sources = {
                {
                    name = "kitty",
                    option = {
                        -- this is where any configuration should be inserted
                    },
                },
            },
        },
    },
    {
        "garyhurtz/cmp_kitty",
        dependencies = {
            { "hrsh7th/nvim-cmp" },
        },
    },
    
    -- Obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim"
        },
        opts = {
            workspaces = {
                {name = "general", path = "~/Obsidian/General Notes/"},
                {name = "rootiest", path = "~/Obsidian/Rootiest Notes/"},
                {name = "keep", path = "~/Obsidian/Keep Notes/"}
            }
        }
    }, 
    -- Pomo
    {
        "epwalsh/pomo.nvim",
        version = "*", -- Recommended, use latest release instead of latest commit
        lazy = true,
        cmd = {"TimerStart", "TimerRepeat"},
        dependencies = {"rcarriga/nvim-notify"},
        opts = {}
    }, -- CodeSnap
    --[[     {
        "mistricky/codesnap.nvim",
        build = "make build_generator",
        keys = {
            { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
            { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
            { "<leader>ch", "<cmd>CodeSnapHighlight<cr>", mode = "x", desc = "Highlight and snapshot selected code into clipboard" },
        },
        opts = {
            save_path = "~/Pictures/Screenshots/",
            has_breadcrumbs = true,
            show_workspace = true,
            --has_line_number = true,
            bg_theme = "default",
            watermark = "Rootiest Snippets",
            code_font_family = "CaskaydiaCove NF",
            code_font_size = 12,
        },
    }, ]] -- Barbecue winbar
    --[[     {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    }, ]] -- NeoScroll
    {"karb94/neoscroll.nvim"}, -- Cinammon Scroll
    --[[     {
        "declancm/cinnamon.nvim",
        config = function() require("cinnamon").setup() end
    }, ]] -- COQ and Treesitter
    {"ms-jpq/coq_nvim", branch = "coq"}, {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require "nvim-treesitter.configs"

            configs.setup {
                ensure_installed = {
                    "c", "lua", "vim", "vimdoc", "query", "elixir", "heex",
                    "javascript", "html"
                },
                sync_install = false,
                highlight = {enable = true},
                indent = {enable = true}
            }
        end
    }, {"ms-jpq/coq.artifacts", branch = "artifacts"},
    {"ms-jpq/coq.thirdparty", branch = "3p"}, -- LSP and completion
    {
        "Exafunction/codeium.vim",
        lazy = true,
        event = "BufEnter",
        config = function()
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set("i", "<C-g>",
                            function()
                return vim.fn["codeium#Accept"]()
            end, {expr = true, silent = true})
            vim.keymap.set("n", "<C-S-g>",
                            function() return vim.fn["codeium#Chat"]() end,
                            {expr = true, silent = true})
        end
    }, {"zbirenbaum/copilot.lua"},
--[[     {
        "neovim/nvim-lspconfig",
        lazy = true,
        version = false,
        event = {
            "InsertEnter",
        },
    }, ]]
    {
        'linrongbin16/lsp-progress.nvim',
        event = "VeryLazy",
        config = function()
            require('lsp-progress').setup()
        end
    },
--[[     {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp.nvim-lspconfig")
        end,
        dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
        event = {
            "InsertEnter",
        },
    },  ]]--
    {"jose-elias-alvarez/null-ls.nvim", version = false},
    {"MunifTanjim/prettier.nvim", version = false},
    -- Indentation and colorization
    {"echasnovski/mini.indentscope", version = false},
    {"NMAC427/guess-indent.nvim"}, {"lewis6991/gitsigns.nvim"},
    {"HiPhish/rainbow-delimiters.nvim"}, {"machakann/vim-sandwich"},
    {"nvim-pack/nvim-spectre"}, {"RRethy/vim-illuminate"},
    {"jghauser/mkdir.nvim"}, {"wilriker/gcode.vim"},
    {"Bekaboo/deadcolumn.nvim"}, {"LZDQ/umbra.nvim"},
    {"nvim-tree/nvim-web-devicons"}, {
        "Pocco81/auto-save.nvim",
        config = function() require("auto-save").setup {} end
    }, {"kevinhwang91/nvim-ufo", dependencies = {"kevinhwang91/promise-async"}},
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
    }, {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = {"Outline", "OutlineOpen"},
        keys = { -- Example mapping to toggle outline
            {"<leader>xo", "<cmd>Outline<CR>", desc = " Toggle outline"}
        }
    }, {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = function()
            require("telescope").load_extension "smart_open"
        end,
        dependencies = {
            "kkharji/sqlite.lua", -- Only required if using match_algorithm fzf
            --{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
            -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
            --{"nvim-telescope/telescope-fzy-native.nvim"}
        }
    }, {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },
    --{"nvim-lua/lsp-status.nvim", lazy = true},
    -- {"nvim-lua/completion-nvim"},

    -- Kitty integrations
    {
        "jghauser/kitty-runner.nvim",
        cond = function() -- Using Kitty
            local term = os.getenv "TERM"
            return term and string.find(term, "kitty")
        end
    }, {
        "knubie/vim-kitty-navigator",
        cond = function() -- Using Kitty
            local term = os.getenv "TERM"
            return term and string.find(term, "kitty")
        end
    }, {"rebelot/kanagawa.nvim"}, {"nvim-lua/plenary.nvim"},
    {"williamboman/mason.nvim"}, {"rasulomaroff/reactive.nvim"},
    {"codethread/qmk.nvim"}, {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim"
        },
        config = function()
            require("telescope").setup {
                -- the rest of your telescope config goes here
                extensions = {
                    undo = {
                        -- telescope-undo.nvim config, see below
                    }
                    -- other extensions:
                    -- file_browser = { ... }
                }
            }
            require("telescope").load_extension "undo"
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end
    }, {"someone-stole-my-name/yaml-companion.nvim"}, {
        "shellRaining/hlchunk.nvim",
        event = {"BufReadPre", "BufNewFile"},
        config = function() require("hlchunk").setup {} end
    }, {
        "gen740/SmoothCursor.nvim",
        config = function() require("smoothcursor").setup() end
    }, -- install with yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"
        },
        build = "cd app && yarn install",
        init = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    },
    {
        'xiyaowong/transparent.nvim'
    },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            'nvimtools/hydra.nvim',
        },
        opts = {},
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
        keys = {
                {
                    mode = { 'v', 'n' },
                    '<Leader>m',
                    '<cmd>MCstart<cr>',
                    desc = 'Create a selection for selected text or word under the cursor',
                },
            },
    }
}, 
{
    -- Configure any other `lazy.nvim` configuration options here
    install = {colorscheme = {"astrodark", "habamax"}},
    ui = {backdrop = 100},
    performance = {
        rtp = {
            -- disable some rtp plugins, add more to your liking
            disabled_plugins = {
                "gzip", "netrwPlugin", "tarPlugin", "tohtml", "zipPlugin"
            }
        }
    }
}
)
