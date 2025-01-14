return {

    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- cmp Path completion
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        -- cmp Snippet completion
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    },


    config = function()
        local cmp = require('cmp')

        vim.opt.completeopt = "menu,menuone,noselect,popup"

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end
            },

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' }
            }),
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-Space"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            })
        })
    end
}
