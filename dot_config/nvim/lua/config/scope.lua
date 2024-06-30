
-- -----------------------------------------------------------------------------
-- ---------------------------------- SCOPE ------------------------------------
-- -----------------------------------------------------------------------------


-- --------------------------------- Harpoon -----------------------------------
--[[ local harpoon = require "harpoon"
harpoon:setup()
harpoon:extend {
UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function() harpoon.ui:select_menu_item { vsplit = true } end, { buffer = cx.bufnr })
    vim.keymap.set("n", "<C-x>", function() harpoon.ui:select_menu_item { split = true } end, { buffer = cx.bufnr })
    vim.keymap.set("n", "<C-t>", function() harpoon.ui:select_menu_item { tabedit = true } end, { buffer = cx.bufnr })
end,
} ]]


-- --------------------------------- Hlchunk -----------------------------------
local default_conf = {
    enable = false,
    style = {},
    notify = false,
    priority = 0,
    exclude_filetypes = {
        aerial = true,
        dashboard = true,
        -- some other filetypes
    }
}
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
    -- style = {
    --    "#FF0000",
    --    "#FF7F00",
    --    "#FFFF00",
    --    "#00FF00",
    --    "#00FFFF",
    --    "#0000FF",
    --    "#8B00FF",
    -- },
    enable = true,
    },
    line_num = { style = "#806d9c", enable = false },
}


-- --------------------------------- Null-ls -----------------------------------
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


-- --------------------------------- Mini.ai -----------------------------------
require("mini.ai").setup()


-- ------------------------------- HiPatterns ----------------------------------
require("mini.hipatterns").setup()


-- --------------------------------- Comment -----------------------------------
require("Comment").setup()


-- ---------------------------------- Yanky ------------------------------------
require("yanky").setup()
require("telescope").load_extension("yank_history")


-- --------------------------- Telescope ui-select -----------------------------
require("telescope").setup {
    extensions = {
    ["ui-select"] = {
        require("telescope.themes").get_dropdown {
        -- even more opts
        }
    }
    }
}
require("telescope").load_extension("ui-select")


-- ---------------------------- various-text-objs ------------------------------
require("various-textobjs").setup {
	-- set to 0 to only look in the current line
	lookForwardSmall = 5,
	lookForwardBig = 15,

	-- use suggested keymaps (see overview table in README)
	useDefaultKeymaps = false,

	-- disable only some default keymaps, e.g. { "ai", "ii" }
	disabledKeymaps = {},

	-- display notifications if a text object is not found
	notifyNotFound = true,
}

