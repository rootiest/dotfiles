
-- -----------------------------------------------------------------------------
-- ------------------------------ KEY BINDINGS ---------------------------------
-- -----------------------------------------------------------------------------

-- Make :Q close all of the buffers
vim.api.nvim_create_user_command("Q", function()
    vim.cmd.bdelete()
    vim.cmd.qall()
end, {force = true})

-- Toggle Twilight
vim.api.nvim_set_keymap("n", "<F1>",
                        "<cmd>Twilight<cr>", 
                        {noremap = true, silent = true,
                        desc = " Toggle Twilight"
                        })

-- Toggle Scrollbind
vim.api.nvim_set_keymap("n", "<F2>",
                        "<cmd>windo set invscrollbind<cr>", 
                        {noremap = true, silent = true,
                        desc = "󱅜 Toggle Scrollbind"
                        })

-- Toggle Zen mode
vim.api.nvim_set_keymap("n", "<F3>",
                        "<cmd>lua require('zen-mode').toggle({window = {width = 0.85, options = {number = false, relativenumber = false, signcolumn = 'no'}}})<cr>", 
                        {noremap = true, silent = true,
                        desc = "󱅼 Toggle Zen mode"
                        })

-- Toggle Cursorline
vim.api.nvim_set_keymap("n", "<F4>",
                        "<cmd>set invcursorline<cr>", 
                        {noremap = true, silent = true,
                        desc = " Toggle Cursorline"
                        })

-- Toggle Neotree (File explorer)
vim.api.nvim_set_keymap("n", "<c-.>",
                        ":Neotree show toggle reveal_force_cwd ~/<cr>",
                        {noremap = true, silent = true,
                        desc = "󰙅 Toggle Neotree"
                        })
vim.api.nvim_set_keymap("n", ".",
                        ":Neotree show toggle reveal<cr>", 
                        {noremap = true, silent = true,
                        desc = "󰙅 Toggle Neotree"
                        })

-- Neotree CWD
vim.keymap.set("n", "<leader>rt.",
                function()
                    local user_input = vim.fn.input("Directory path: ")
                    vim.cmd (":Neotree ", user_input)
                end,
                {noremap = true, silent = true,
                desc = "󰾷 Change directory"
                })

-- Toggle NeoGit (Git visualizer)
vim.api.nvim_set_keymap("n", "<c-,>",
                        ":Neogit<cr>",
                        {noremap = true,
                        desc = " Toggle Neogit"
                        })

-- Toggle Terminal
vim.api.nvim_set_keymap("n", "<c-/>",
                        ":ToggleTerm<cr>",
                        {noremap = true,
                        desc = " Open Terminal"
                        })

-- Exit like nano
vim.api.nvim_set_keymap("n", "<c-x>",
                        ":q<cr>",
                        {noremap = true,
                        desc = "󰈆 Exit"
                        })

-- Navigate panels with Alt-direction like kitty
vim.api.nvim_set_keymap("n", "<A-Left>",
                        [[<C-W>h]],
                        {noremap = true,
                        desc = " Go to Window Left"
                        })
vim.api.nvim_set_keymap("n", "<A-Up>",
                        [[<C-W>j]],
                        {noremap = true,
                        desc = " Go to Window Up"
                        })
vim.api.nvim_set_keymap("n", "<A-Down>",
                        [[<C-W>k]],
                        {noremap = true,
                        desc = " Go to Window Down"
                        })
vim.api.nvim_set_keymap("n", "<A-Right>",
                        [[<C-W>l]],
                        {noremap = true,
                        desc = " Go to Window Right"
                        })


-- LSP Keymaps

-- LSP go-to-definition:
vim.keymap.set("n", "gd", "<Cmd>lua Scroll('definition')<CR>", {desc = "Go to definition"})

-- LSP go-to-declaration:
vim.keymap.set("n", "gD", "<Cmd>lua Scroll('declaration')<CR>", {desc = "Go to declaration"})

-- Terminal navigation
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- Various text objects
-- `U` for url textobj
vim.keymap.set({ "o", "x" }, "U", '<cmd>lua require("various-textobjs").url()<CR>')

-- `as` for outer subword, `is` for inner subword
vim.keymap.set({ "o", "x" }, "as", '<cmd>lua require("various-textobjs").subword("outer")<CR>')
vim.keymap.set({ "o", "x" }, "is", '<cmd>lua require("various-textobjs").subword("inner")<CR>')

-- when on unindented line, `ii` should select entire buffer
vim.keymap.set("o", "ii", function()
	if vim.fn.indent(".") == 0 then
		require("various-textobjs").entireBuffer()
	else
		require("various-textobjs").indentation("inner", "inner")
	end
end)

-- Smarter gx
vim.keymap.set("n", "gx", function()
	require("various-textobjs").url()
	local foundURL = vim.fn.mode():find("v")
	if foundURL then
		vim.cmd.normal('"zy')
		local url = vim.fn.getreg("z")
		vim.ui.open(url)
	else
		-- find all URLs in buffer
		local urlPattern = require("various-textobjs.charwise-textobjs").urlPattern
		local bufText = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
		local urls = {}
		for url in bufText:gmatch(urlPattern) do
			table.insert(urls, url)
		end
		if #urls == 0 then return end

		-- select one, use a plugin like dressing.nvim for nicer UI for
		-- `vim.ui.select`
		vim.ui.select(urls, { prompt = "Select URL:" }, function(choice)
			if choice then vim.ui.open(choice) end
		end)
	end
end, { desc = "URL Opener" })

-- Delete Surrounding Indentation
vim.keymap.set("n", "dsi", function()
	-- select outer indentation
	require("various-textobjs").indentation("outer", "outer")

	-- plugin only switches to visual mode when a textobj has been found
	local indentationFound = vim.fn.mode():find("V")
	if not indentationFound then return end

	-- dedent indentation
	vim.cmd.normal { "<", bang = true }

	-- delete surrounding lines
	local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1]
	local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1]
	vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
	vim.cmd(tostring(startBorderLn) .. " delete")
end, { desc = "Delete Surrounding Indentation" })

-- Yank Surrounding Indentation
vim.keymap.set("n", "ysii", function()
	local startPos = vim.api.nvim_win_get_cursor(0)

	-- identify start- and end-border
	require("various-textobjs").indentation("outer", "outer")
	local indentationFound = vim.fn.mode():find("V")
	if not indentationFound then return end
	vim.cmd.normal { "V", bang = true } -- leave visual mode so the `'<` `'>` marks are set

	-- copy them into the + register
	local startLn = vim.api.nvim_buf_get_mark(0, "<")[1] - 1
	local endLn = vim.api.nvim_buf_get_mark(0, ">")[1] - 1
	local startLine = vim.api.nvim_buf_get_lines(0, startLn, startLn + 1, false)[1]
	local endLine = vim.api.nvim_buf_get_lines(0, endLn, endLn + 1, false)[1]
	vim.fn.setreg("+", startLine .. "\n" .. endLine .. "\n")

	-- highlight yanked text
	local ns = vim.api.nvim_create_namespace("ysi")
	vim.api.nvim_buf_add_highlight(0, ns, "IncSearch", startLn, 0, -1)
	vim.api.nvim_buf_add_highlight(0, ns, "IncSearch", endLn, 0, -1)
	vim.defer_fn(function() vim.api.nvim_buf_clear_namespace(0, ns, 0, -1) end, 1000)

	-- restore cursor position
	vim.api.nvim_win_set_cursor(0, startPos)
end, { desc = "Yank surrounding indentation" })

-- Indent Last Paste
vim.keymap.set("n", "P", function()
	require("various-textobjs").lastChange()
	local changeFound = vim.fn.mode():find("v")
	if changeFound then vim.cmd.normal { ">", bang = true } end
end, { desc = "Indent Last Paste" })



-- Harpoon Keymaps
--[[ vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            {desc = "󱡁 Open harpoon window"})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
            {desc = "󱡁 Add to Harpoon"})
vim.keymap.set("n", "<C-e>",
            function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            {desc = "󱡁 Toggle Harpoon Menu"})

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end,
            {desc = "󱡁 Select from harpoon"})
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end,
            {desc = "󱡁 Select from harpoon"})
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end,
            {desc = "󱡁 Select from harpoon"})
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end,
            {desc = "󱡁 Select from harpoon"})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end,
            {desc = "󱡁 Previous harpoon"})
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end,
            {desc = "󱡁 Next harpoon"}) ]]