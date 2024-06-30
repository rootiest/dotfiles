-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
-- 
--           ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░ 
--           ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
--           ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
--           ░▒▓███████▓▒░░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░    ░▒▓██████▓▒░  
--           ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░     
--           ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░     
--           ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░     
-- 
--                    ████████╗███████╗██████╗ ███╗   ███╗
--                    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
--                       ██║   █████╗  ██████╔╝██╔████╔██║
--                       ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
--                       ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--                       ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- 
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------


-- Transparency
vim.cmd ":TransparentEnable"

-- Kitty Bindings
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
vim.cmd "let g:kitty_navigator_no_mappings = 1"

vim.cmd ":nnoremap <silent> {Left-Mapping} :KittyNavigateLeft<cr>"
vim.cmd ":nnoremap <silent> {Down-Mapping} :KittyNavigateDown<cr>"
vim.cmd ":nnoremap <silent> {Up-Mapping} :KittyNavigateUp<cr>"
vim.cmd ":nnoremap <silent> {Right-Mapping} :KittyNavigateRight<cr>"

-- Kitty Completion
require("cmp_kitty").setup()


-- Kitty Image preview
require("image").setup {
    backend = "kitty",
    integrations = {
        markdown = {
            enabled = true, 
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = {"markdown", "vimwiki"} -- markdown extensions (ie. quarto) can go here
        },
        neorg = {       
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = {"norg"}
        },
        html = {enabled = false},
        css = {enabled = false}
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
    window_overlap_clear_ft_ignore = {"cmp_menu", "cmp_docs", ""},
    editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
    tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    hijack_file_patterns = {
        "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp"
    } -- render image files as images when opened
}