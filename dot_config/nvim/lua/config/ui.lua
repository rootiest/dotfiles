-- -----------------------------------------------------------------------------
-- -------------------------------- NEOVIM UI ----------------------------------
-- -----------------------------------------------------------------------------

-- ------------------------------ Multicursors ---------------------------------
require('multicursors').setup {
    hint_config = false,
}

local function is_active()
    local ok, hydra = pcall(require, 'hydra.statusline')
    return ok and hydra.is_active()
end

local function get_name()
    local ok, hydra = pcall(require, 'hydra.statusline')
    if ok then
        return hydra.get_name()
    end
    return ''
end


-- --------------------------------- LuaLine -----------------------------------
local lualine = require('lualine')
local colors = {
    bg = '#282c34',
    fg = '#abb2bf',
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67',
}

-- Define color scheme
local catpalette = require("catppuccin.palettes").get_palette "frappe"

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local config = {
    options = {
        theme = "auto",
    },
    sections = {
        lualine_a = {
            'mode'
        },
        lualine_b = {
            {
                'branch',
                icon = '',
            },
        },
        lualine_c = {
            -- Lsp status
            {
                'lsp_progress',
                display_components =    { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
                colors = {
                    percentage  = catpalette.sapphire,
                    title  = catpalette.mauve,
                    message  = catpalette.flamingo,
                    spinner = catpalette.rosewater,
                    lsp_client_name = catpalette.peach,
                    use = true,
                },  
                cond = conditions.check_git_workspace,
                max_length = vim.o.columns / 5,
            },      
        },
        lualine_x = {
            { get_name, cond = is_active },
            {
                function()
                    return require("screenkey").get_keys()
                end,
                color = { fg = catpalette.subtle },
            },
            {
                'encoding',
                color = { fg = catpalette.green },
            },
            {
                'fileformat',
                color = { fg = catpalette.green },
            },
            {
                'filetype',
                color = { fg = catpalette.cyan },
            },
            {
                require("recorder").displaySlots,
                color = { fg = catpalette.lavender },
            },
            {
                require("recorder").recordingStatus,
                color = { fg = catpalette.base, bg = catpalette.red, gui = 'bold' },
            },
        },
        lualine_y = {
            {   
                'progress'
            },
        },
        lualine_z = {
            {
                'location'
            },
        }
    }
}
-- Inserts a component in lualine_b at left section
local function ins_left(component)
    table.insert(config.sections.lualine_b, component)
end

-- Inserts a component in lualine_c at center section
local function ins_center(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    -- filename component
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = catpalette.pink, gui = 'bold' },
}

ins_left {
    -- diff component
    'diff',
    symbols = { added = ' ', modified = ' ', removed = ' ', renamed = '󰛂 ', ignored = '󰿠  ' },
    cond = conditions.hide_in_width,
}

ins_left {
    -- diagnostics component
    'diagnostics',
    symbols = { error = ' ', warn = ' ', info = ' ' },
}

ins_center {
    -- Lsp server name
    function()
        local msg = 'None'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return msg end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end 
        return msg
    end,
    icon = '',
    color = { fg = catpalette.teal },
}

ins_right {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
    color = { fg = catpalette.green, gui = 'italic' },
}

-- Now don't forget to initialize lualine
lualine.setup(config)


-- ------------------------------- CodeWindow ----------------------------------
codewindow = require("codewindow").setup(
    {
        active_in_terminals = false, -- Should the minimap activate for terminal buffers
        auto_enable = true, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
        exclude_filetypes = { 'help' }, -- Choose certain filetypes to not show minimap on
        max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
        max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
        minimap_width = 10, -- The width of the text part of the minimap
        use_lsp = true, -- Use the builtin LSP to show errors and warnings
        use_treesitter = true, -- Use nvim-treesitter to highlight the code
        use_git = true, -- Show small dots to indicate git additions and deletions
        width_multiplier = 4, -- How many characters one dot represents
        z_index = 1, -- The z-index the floating window will be on
        show_cursor = true, -- Show the cursor position in the minimap
        screen_bounds = 'background', -- How the visible area is displayed, "lines": lines above and below, "background": background color
        window_border = 'none', -- The border style of the floating window (accepts all usual options)
        relative = 'win', -- What will be the minimap be placed relative to, "win": the current window, "editor": the entire editor
        events = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' }, -- Events that update the code window
    }
)
require("codewindow").apply_default_keybinds()


-- ------------------------------- Mini.notify ---------------------------------
--[[ require("mini.notify").setup {
    lsp_progress = {
        -- Whether to enable showing
        enable = false,
    },
} ]]


-- ------------------------------- nvim-notify ---------------------------------
require("notify").setup {
    -- Animation style (see below for details)
    stages = "fade_in_slide_out",
    -- Default timeout for notifications
    timeout = 5000,
    -- Icons for the different levels
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
}



-- ------------------------------ Smooth Cursor --------------------------------
-- ------------------------------ Smooth Cursor --------------------------------
require("smoothcursor").setup {
    type = "default", -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".
    fancy = {
        enable = true,        -- enable fancy mode
        head = { cursor = '', texthl = nil, linehl = nil },
        body = {},
        tail = false -- false to disable fancy tail     
    },  
}

-- Define cursor color/icon based on mode
local autocmd = vim.api.nvim_create_autocmd
autocmd({ 'ModeChanged', 'BufEnter' }, {
    callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa8f3' })
            vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'v' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#d298eb' })
            vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'V' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#d298eb' })
            vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == '�' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
            vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'i' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#9bd482' })
            vim.fn.sign_define('smoothcursor', { text = '' })
        end
    end,
})

-- Define last cursor position icon
vim.fn.sign_define('smoothcursor_n', { text = '' })  
vim.fn.sign_define('smoothcursor_v', { text = ' ' })
vim.fn.sign_define('smoothcursor_V', { text = '' })
vim.fn.sign_define('smoothcursor_i', { text = '' })
vim.fn.sign_define('smoothcursor_�', { text = '' })
vim.fn.sign_define('smoothcursor_R', { text = '󰊄' })


-- -------------------------------- Reactive -----------------------------------
-- Reactive Cursorline and Cursor
require("reactive").setup {
    load = { "catppuccin-frappe-cursor", "catppuccin-frappe-cursorline" },
}


-- ------------------------------- Dead Column ---------------------------------
-- Highlight max line length
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


-- ------------------------------- Neo-Scroll ----------------------------------
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

-- -------------------------------- ScreenKey ----------------------------------
vim.g.screenkey_statusline_component = true

vim.keymap.set("n", "<leader>ssc", function()
    vim.g.screenkey_statusline_component = not vim.g.screenkey_statusline_component
end, { desc = "Toggle screenkey statusline component" })