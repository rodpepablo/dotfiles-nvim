return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", },
        lazy = false,
        config = function ()
            require("neo-tree").setup({
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function ()
                            vim.cmd("Neotree filesystem close")
                        end
                    }
                }
            })
            vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>")
            vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>")
            vim.keymap.set("n", "<leader>sb", ":Neotree float buffers<CR>")
        end
    }
}
