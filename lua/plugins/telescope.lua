return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                    }
                }
            }
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap
        local builtin = require("telescope.builtin")

        keymap.set("n", "<leader>pf", builtin.find_files, {}) 
        keymap.set("n", "<C-p>", builtin.git_files, {}) 
        keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end

}
