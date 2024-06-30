-- -----------------------------------------------------------------------------
-- ------------------------------ BOOT COMMANDS --------------------------------
-- -----------------------------------------------------------------------------
-- Show neotree on startup
vim.api.nvim_create_autocmd("VimEnter",
                            {command = "set nornu nonu | Neotree show reveal"})
vim.api.nvim_create_autocmd("BufEnter", {command = "set rnu nu"})

-- Set GUI font
vim.opt.guifont = "MonaspiceKr Nerd Font Mono:#e-subpixelantialias:h12"
vim.g.have_nerd_font = true

-- Unfold all at startup
vim.api.nvim_create_autocmd("BufEnter", {command = "normal zR"})

-- fix insert mode arrow key
vim.api.nvim_set_keymap("i", "<Right>", "<Right>", {})

--[[ vim.api.nvim_create_autocmd('BuffLeave', {
    once = true,
    callback = function()
        codewindow.close_minimap()
        vim.cmd('DisableHLChunk')
    end,
})

vim.api.nvim_create_autocmd('SessionLoadPost', {
    once = true,
    callback = function()
        codewindow.open_minimap()
        vim.cmd('EnableHLChunk')
    end,
}) ]]
