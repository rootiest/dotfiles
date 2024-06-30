
-- -----------------------------------------------------------------------------
-- ------------------------------- COMPLETION ----------------------------------
-- -----------------------------------------------------------------------------


-- ------------------------------- Copilot AI ----------------------------------
require("copilot").setup {
    panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
        },
        layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 18.x
    server_opts_overrides = {},
}


-- --------------------------------- Neo-Cmp -----------------------------------
local cmp = require "cmp"
cmp.setup {
    sources = {
        { name = "cmp_yanky" },
    },
}


-- --------------------------------- LSP Cmp -----------------------------------
require("lspconfig").pyright.setup {}

local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = { "clangd", "--offset-encoding=utf-16" },
}

--[[ local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local server_names = require("lspconfig").lsp_servers
mason_lspconfig.setup({
    ensure_installed = server_names,
    handlers = {
        function(server_name)
            if server_name == "lua_ls" then
                lspconfig["sumneko_lua"].setup(opts)
            else
                lspconfig[server_name].setup(opts)
            end
        end,
    },
})  ]]--


-- --------------------------------- LazyDev -----------------------------------
require("lazydev").setup()