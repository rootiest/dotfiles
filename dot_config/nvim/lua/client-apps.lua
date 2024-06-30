
-- -----------------------------------------------------------------------------
-- ---------------------------- External Software ------------------------------
-- -----------------------------------------------------------------------------


-- -------------------------- Identify environment -----------------------------
if vim.g.neovide then
    -- NeoVide
    require("client-apps/neovide")
else
    if (vim.env.TERM:find("kitty")) then
        -- Kitty
        require("client-apps/kitty")
    else
        -- If Term_program contains the text WezTerm
        if (vim.env.TERM_PROGRAM:find("WezTerm")) then
            -- WezTerm
            require("client-apps/wezterm")
        else
            -- If Term_program contains the text Alacritty
            if (vim.env.TERM:find("alacritty")) then
                -- Alacritty
                require("client-apps/alacritty")
            else
                -- Generic
                require("client-apps/generic")
            end
        end
    end
end


-- -------------------------------- Obsidian -----------------------------------
vim.opt.conceallevel = 1
vim.g.vim_markdown_frontmatter = 1


-- -------------------------------- CodeShot -----------------------------------
require("code-shot").setup {
    options = function() return {
        "--theme", "Dracula",
        "--font", "MonaspaceKrypton Nerd Font"
    } end,
}

-- ---------------------------------- Qalc -------------------------------------
local qalc_config = {
    -- extra command arguments for Qalculate
    -- do NOT use the option `-t`/`--terse`; it will break the plugin
    -- example: { '--set', 'angle deg' } to use degrees as the default angle unit
    cmd_args = {}, -- table

    -- default name of a newly opened buffer
    -- set to '' to open an unnamed buffer
    bufname = '', -- string

    -- the plugin will set all attached buffers to have this filetype
    -- set to '' to disable setting the filetype
    -- the default is provided for basic syntax highlighting
    set_ft = 'config', -- string

    -- file extension to automatically attach qalc to
    -- set to '' to disable automatic attaching
    attach_extension = '*.qalc', -- string

    -- default register to yank results to
    -- default register = '@'
    -- clipboard        = '+'
    -- X11 selection    = '*'
    -- other registers not listed are also supported
    -- see `:h setreg()`
    yank_default_register = '@', -- string

    -- sign shown before result
    sign = '=', -- string

    -- whether or not to show a sign before the result
    show_sign = true, -- boolean

    -- whether or not to right align virtual text
    right_align = false, -- boolean

    -- highlight groups
    highlights = {
        sign     = '@conceal', -- sign before result
        result   = '@string',  -- result in virtual text
    },

    -- diagnostic options
    -- set to nil to respect the options in your neovim configuration
    -- (see `:h vim.diagnostic.config()`)
    diagnostics = { -- table?
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        severity_sort = true,
    },

    -- use pty for job communication (MS Windows w/o WSL do not support pty)
    use_pty = not (vim.fn.has('win32') == 1) and (vim.fn.has('wsl') == 0),

    -- End-Of-File character (MS Windows uses ^Z (EOF), others use ^D (EOT))
    eof = string.char(((vim.fn.has('win32') == 1) and (vim.fn.has('wsl') == 0)) and 26 or 4)
}
require('qalc').setup(qalc_config)