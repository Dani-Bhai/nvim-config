local plugins = {
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "typescript-language-server",
                "tailwindcss-language-server",
                "eslint-lsp",
                "prettierd",
                "gopls",
            }
        }
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_,opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    }
}


return plugins
