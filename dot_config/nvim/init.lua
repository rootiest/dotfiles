-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
require("mini.animate").setup {
  -- Vertical scroll
  scroll = {
    -- Whether to enable this animation
    enable = false,
  },
}
require("lspconfig").pyright.setup {}
require("mason").setup()

local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  --shading_factor = '<number>', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = "horizontal",
  close_on_exit = true, -- close the terminal window when the process exits
  -- Change the default shell. Can be a string or a function returning a string
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "curved",
    -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
    --width = <value>,
    --height = <value>,
    --row = <value>,
    --col = <value>,
    winblend = 3,
    --zindex = <value>,
    title_pos = "left",
  },
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end,
  },
}

--require('neoscroll').setup({ mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>'} })
neoscroll = require "neoscroll"
neoscroll.setup {
  -- Default easing function used in any animation where
  -- the `easing` argument has not been explicitly supplied
  easing = "quadratic",
}
local keymap = {
  -- Use the "sine" easing function
  ["<C-u>"] = function() neoscroll.ctrl_u { duration = 250, easing = "sine" } end,
  ["<C-d>"] = function() neoscroll.ctrl_d { duration = 250, easing = "sine" } end,
  -- Use the "circular" easing function
  ["<C-b>"] = function() neoscroll.ctrl_b { duration = 450, easing = "circular" } end,
  ["<C-f>"] = function() neoscroll.ctrl_f { duration = 450, easing = "circular" } end,
  -- When no value is passed the `easing` option supplied in `setup()` is used
  ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
  ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
}
local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
require("mini.map")
  .setup {
    -- Highlight integrations (none by default)
    integrations = nil,

    -- Symbols used to display data
    symbols = {
      -- Encode symbols. See `:h MiniMap.config` for specification and
      -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
      -- Default: solid blocks with 3x2 resolution.
      encode = nil,

      -- Scrollbar parts for view and line. Use empty string to disable any.
      scroll_line = "█",
      scroll_view = "┃",
    },

    -- Window options
    window = {
      -- Whether window is focusable in normal way (with `wincmd` or mouse)
      focusable = false,

      -- Side to stick ('left' or 'right')
      side = "right",

      -- Whether to show count of multiple integration highlights
      show_integration_count = true,

      -- Total width
      width = 10,

      -- Value of 'winblend' option
      winblend = 25,

      -- Z-index
      zindex = 10,
    },

  }
require("codewindow")
  .setup {
    auto_enable = true,
    width_multiplier = 4,
    minimap_width = 10,
  }

require("gitsigns").setup()

require("codewindow").apply_default_keybinds()

require("outline").setup {}

--require("auto-save").setup()

require("neodev").setup {
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...,
}

require("lualine").setup {
  options = {
    theme = "catppuccin",
    -- ... the rest of your lualine config
  },
}

--colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha"
require("catppuccin").setup {
  integrations = {
    cmp = true,
    barbar = true,
    diffview = true,
    dashboard = true,
    coc_nvim = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    markdown = true,

    sandwich = true,
    telescope = {
      enabled = true,
      -- style = "nvchad"
    },

    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
}

vim.cmd.colorscheme "catppuccin-frappe"

-------------------------------------
----------     KEYMAPS     ----------
-------------------------------------

-- Neotree (File explorer)
vim.api.nvim_set_keymap("n", "<c-.>", ":Neotree show toggle<cr>", { noremap = true })

-- NeoGit (Git visualizer)
vim.api.nvim_set_keymap("n", "<c-,>", ":Neogit<cr>", { noremap = true })

-- ToggleTerm (Terminal window)
vim.api.nvim_set_keymap("n", "<c-/>", ":ToggleTerm<cr>", { noremap = true })

-- Exit like nano
vim.api.nvim_set_keymap("n", "<c-x>", ":q<cr>", { noremap = true })

-- Spectre mappings
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- Cinnamon Scroll mappings

-- Up/down movements:
vim.keymap.set({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1)<CR>")

-- Left/right movements:
vim.keymap.set({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1)<CR>")

-- SCROLL_WHEEL_KEYMAPS:

vim.keymap.set({ "n", "x" }, "<ScrollWheelUp>", "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
vim.keymap.set({ "n", "x" }, "<ScrollWheelDown>", "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

-- LSP_KEYMAPS:

-- LSP go-to-definition:
vim.keymap.set("n", "gd", "<Cmd>lua Scroll('definition')<CR>")

-- LSP go-to-declaration:
vim.keymap.set("n", "gD", "<Cmd>lua Scroll('declaration')<CR>")

-- More ToggleTerm mappings
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

--vim.cmd('lua codewindow.open_minimap()')

local dead_opts = {
  scope = "line", ---@type string|fun(): integer
  ---@type string[]|fun(mode: string): boolean
  modes = function(mode) return mode:find "^[ictRss\x13]" ~= nil end,
  blending = {
    threshold = 0.75,
    colorcode = "#000000",
    hlgroup = { "Normal", "bg" },
  },
  warning = {
    alpha = 0.4,
    offset = 0,
    colorcode = "#FF0000",
    hlgroup = { "Error", "bg" },
  },
  extra = {
    ---@type string?
    follow_tw = nil,
  },
}

require("deadcolumn").setup(dead_opts) -- Call the setup function
vim.cmd ":set colorcolumn=120" -- Set the default dead column

local null_ls = require "null-ls"

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup {
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.keymap.set(
        "n",
        "<Leader>f",
        function() vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() } end,
        { buffer = bufnr, desc = "[lsp] format" }
      )
    end

    if client.supports_method "textDocument/rangeFormatting" then
      vim.keymap.set(
        "x",
        "<Leader>f",
        function() vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() } end,
        { buffer = bufnr, desc = "[lsp] format" }
      )
    end
  end,
}

require("smoothcursor").setup {
  type = "exp", -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".
  cursor = "",
  fancy = {
    enable = false, -- enable fancy mode
  },
}

require("copilot").setup {
  suggestion = { enabled = true },
  panel = { enabled = true },
}

require("nvim-possession").setup {
  autoload = true, -- default false
  autoswitch = {
    enable = true, -- default false
  },
}

--let g:kitty_navigator_no_mappings = 1

vim.cmd ":nnoremap <silent> {Left-Mapping} :KittyNavigateLeft<cr>"
vim.cmd ":nnoremap <silent> {Down-Mapping} :KittyNavigateDown<cr>"
vim.cmd ":nnoremap <silent> {Up-Mapping} :KittyNavigateUp<cr>"
vim.cmd ":nnoremap <silent> {Right-Mapping} :KittyNavigateRight<cr>"

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term) vim.cmd "startinsert!" end,
}

function _lazygit_toggle() lazygit:toggle() end

require("guess-indent").setup {}

require("hlchunk").setup {
  chunk = {
    style = {
      --    { fg = cb },
      --    { fg = "#f35336" },
      { fg = "#90FDA9" },
    },
    enable = true,
  },
  indent = {
    --style = {
    --    "#FF0000",
    --    "#FF7F00",
    --    "#FFFF00",
    --    "#00FF00",
    --    "#00FFFF",
    --    "#0000FF",
    --    "#8B00FF",
    --},
    enable = true,
  },
  line_num = {
    style = "#806d9c",
    enable = false,
  },
}

vim.api.nvim_set_keymap("n", "<leader>g x", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- Enable persistent undo so that undo history persists across vim sessions
vim.cmd ":set undofile"
vim.cmd ":set undodir=~/.config/nvim/undodir"

-- vim sessions
--vim.cmd(':let g:session_default_overwrite = 1')
--vim.cmd(':let g:session_autoload = "yes"')
--vim.cmd(':let g:session_autosave = "yes"')
--vim.cmd(':let g:session_autosave_periodic = 5')

-- auto-show file tree
--vim.cmd(':Neotree show')
