return {
    "erichlf/devcontainer-cli.nvim",
    dependencies = { 'akinsho/toggleterm.nvim' },
    keys = {
        -- stylua: ignore
        {
            "<leader>Du",
            ":DevcontainerUp<CR>",
            desc = "Bring up the DevContainer",
        },
        {
            "<leader>Dc",
            ":DevcontainerConnect<CR>",
            desc = "Connect to DevContainer",
        },
        {
            "<leader>Dd",
            ":DevcontainerDown<CR>",
            desc = "Kill the current DevContainer",
        },
        {
            "<leader>De",
            ":DevcontainerExec direction='vertical' size='40'<CR>",
            desc = "Execute a command in DevContainer",
        },
        {
            "<leader>Db",
            ":DevcontainerExec cd build && make<CR>",
            desc = "Execute build command in DevContainer",
        },
        {
            "<leader>Dt",
            ":DevcontainerExec cmd='cd build && make test' direction='horizontal'<CR>",
            desc = "Execute test command in DevContainer",
        },
        {
            "<leader>DT",
            "<CMD>DevContainerToggle<CR>",
            desc = "Toggle the current DevContainer Terminal"
        },
    },
    init = function()
        local opts = {
        -- whather to verify that the final devcontainer should be run
        interactive = false,
        -- search for the devcontainer directory closest to the root in the
        -- directory tree
        toplevel = true,
        -- Remove existing container each time DevcontainerUp is executed
        -- If set to True [default_value] it can take extra time as you force to
        -- start from scratch
        remove_existing_container = true,
        -- By default, if no extra config is added, following nvim_dotfiles are
        -- installed: "https://github.com/erichlf/dotfiles"
        -- This is an example for configuring other dotfiles inside the docker container
        dotfiles_repository = "https://github.com/erichlf/dotfiles.git",
        dotfiles_branch = "devcontainer-cli", -- branch to clone from dotfiles_repository`
        dotfiles_targetPath = "~/dotfiles", -- location to install dotfiles
        -- script to run after dotfiles are cloned
        dotfiles_intallCommand = "install.sh", 
        shell = "bash", -- shell to use when executing commands
        -- The particular binary to use for connecting to in the devcontainer
        -- Most likely this should remain nvim
        nvim_binary = "nvim",
        -- Set the logging level for console (notifications) and file logging. 
        -- The available levels are trace, debug, info, warn, error, or fatal.
        -- Set the log level for file logging
        log_level = "debug",
        -- Set the log level for console logging
        console_level = "info",
        }
        require('devcontainer-cli').setup(opts)
    end,
}