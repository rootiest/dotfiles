

return {
    'mikesmithgh/borderline.nvim',
    enabled = true,
    lazy = true,
    event = 'VeryLazy',
    config = function()
        require('borderline').setup({
            --  ...
        })
    end,
}