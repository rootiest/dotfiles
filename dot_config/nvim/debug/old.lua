

-- Kitty Bindings
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.cmd("let g:kitty_navigator_no_mappings = 1")

vim.cmd(":nnoremap <silent> {Left-Mapping} :KittyNavigateLeft<cr>")
vim.cmd(":nnoremap <silent> {Down-Mapping} :KittyNavigateDown<cr>")
vim.cmd(":nnoremap <silent> {Up-Mapping} :KittyNavigateUp<cr>")
vim.cmd(":nnoremap <silent> {Right-Mapping} :KittyNavigateRight<cr>")