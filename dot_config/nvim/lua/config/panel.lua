
-- -----------------------------------------------------------------------------
-- --------------------------------- PANELS ------------------------------------
-- -----------------------------------------------------------------------------


-- -------------------------------- Telescope ----------------------------------
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
local file_paths = {}
for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
end
require("telescope.pickers")
    .new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table { results = file_paths },
    previewer = conf.file_previewer {},
    sorter = conf.generic_sorter {},
    })
    :find()
end
require("telescope").setup {
    defaults = {
        dynamic_preview_title = true,
        prompt_prefix = " ",
        selection_caret = " ",
    },
}

-- --------------------------------- Outline -----------------------------------
require("outline").setup()


-- --------------------------------- Trouble -----------------------------------
require("trouble").setup {
    modes = {
        preview_float = {
            mode = "diagnostics",
            preview = {
                type = "float",
                relative = "editor",
                border = "rounded",
                title = "Preview",
                title_pos = "center",
                position = { 0, -2 },
                size = { width = 0.3, height = 0.3 },
                zindex = 200,
            },
        },
    },
}


-- ------------------------------- ToggleTerm ----------------------------------
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
    shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    -- shading_factor = '<number>', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
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
        -- width = <value>,
        -- height = <value>,
        -- row = <value>,
        -- col = <value>,
        winblend = 3,
        -- zindex = <value>,
        title_pos = "left",
    },
    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end,
    },
}


-- ---------------------------- Lazygit Terminal -------------------------------
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = { border = "double" },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd "startinsert!"
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term) vim.cmd "startinsert!" end,
}
function _lazygit_toggle() lazygit:toggle() end

-- ----------------------------- NostalgicTerm ---------------------------------
require('nostalgic-term').setup({
    mappings = {}, -- list of mappings in the form {lhs, rhs} with
    start_in_insert_mode = true, -- start new terminals in insert mode by default, as in Vim
    add_normal_mode_mappings = false, -- if true, also add mappings in normal mode (with nore)
    add_vim_ctrl_w = false, -- if true, add ctrl-w as a launcher of window commands also in
                            -- the terminal, as in Vim
    enabled_filetypes = {"toggleterm"},
})