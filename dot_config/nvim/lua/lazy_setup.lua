require("lazy").setup({
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
    }, {import = "community"}, {import = "plugins"},
    {"akinsho/toggleterm.nvim", version = false, lazy = false}, {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim", "3rd/image.nvim" -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }, {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua" -- optional
        },
        config = true
    }, -- {'romgrk/barbar.nvim',
    --  dependencies = {
    --    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    --    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --  },
    --  init = function() vim.g.barbar_auto_setup = false end,
    --  opts = {
    --    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    --    -- animation = true,
    --    -- insert_at_start = true,
    --    -- …etc.
    --  },
    --  version = '^1.0.0', -- optional: only update when a new 1.x version is released
    -- },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }, {
        "mrjones2014/legendary.nvim",
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        priority = 10000,
        lazy = false
        -- sqlite is only needed if you want to use frecency sorting
        -- dependencies = { 'kkharji/sqlite.lua' }
    }, {"echasnovski/mini.nvim", version = false},
    {"echasnovski/mini.map", version = false},
    {"gorbit99/codewindow.nvim", version = false},
    {"echasnovski/mini.animate", version = false},
    {"echasnovski/mini.comment", version = false}, -- {
    --  'xolox/vim-session',
    --  dependencies = {'xolox/vim-misc'},
    -- },
    {
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
    }, {"jghauser/kitty-runner.nvim"}, {"karb94/neoscroll.nvim"},
    {
        "declancm/cinnamon.nvim",
        config = function() require("cinnamon").setup() end
    }, {"ms-jpq/coq_nvim", branch = "coq"}, {
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
    {"ms-jpq/coq.thirdparty", branch = "3p"},
    {"neovim/nvim-lspconfig", version = false},
    {"jose-elias-alvarez/null-ls.nvim", version = false},
    {"MunifTanjim/prettier.nvim", version = false},
    {"echasnovski/mini.indentscope", version = false},
    {"nmac427/guess-indent.nvim"}, {"lewis6991/gitsigns.nvim"},
    {"HiPhish/rainbow-delimiters.nvim"}, {"machakann/vim-sandwich"},
    {"nvim-pack/nvim-spectre"}, {"RRethy/vim-illuminate"},
    {"jghauser/mkdir.nvim"}, {"wilriker/gcode.vim"},
    -- {'simnalamburt/vim-mundo'},
    {"Bekaboo/deadcolumn.nvim"}, {"nvim-tree/nvim-web-devicons"}, {
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
            {"<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline"}
        },
        opts = {
            -- Your setup opts here
        }
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    }, {"nvim-lua/lsp-status.nvim"}, {"nvim-lua/completion-nvim"},
    {"knubie/vim-kitty-navigator"}, {"nvim-lua/plenary.nvim"},
    {"williamboman/mason.nvim"}, {"codethread/qmk.nvim"}, {
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
            -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
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
    }
} --[[@as LazySpec]] , {
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
} --[[@as LazyConfig]] )
