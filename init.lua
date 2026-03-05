vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup {
                -- Aqui você lista os language servers que o Mason deve garantir que estão instalados
                ensure_installed = {
                    "tsserver",
                    "rust_analyzer",
                    "yaml_ls",
                    "jsonls",
                    "clangd",
                    "clojure-lsp",
                    "gopls",
                    "elixirls",
                    "lua-language-server",
                },
                automatic_installation = true, -- O Mason vai instalar automaticamente se não encontrar
            }

            local lspconfig = require "lspconfig"

            -- Configuração para tsserver (typescript)
            lspconfig.tsserver.setup {}

            -- Configuração para rust-analyzer
            lspconfig.rust_analyzer.setup {}

            -- Configuração para yaml-language-server
            lspconfig.yaml_ls.setup {}

            -- Configuração para json-lsp
            lspconfig.jsonls.setup {}

            lspconfig.clojure_lsp.setup {}

            lspconfig.clangd.setup {}

            lspconfig.gopls.setup {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                        staticheck = true,
                        gofumpt = true
                    },
                },
            }
        end,
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^6", -- Recommended
        lazy = false, -- This plugin is already lazy
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "hrsh7th/nvim-cmp",
    },

    {
        "Olical/conjure",
        ft = { "clojure", "fennel", "python" }, -- etc
        lazy = true,
        init = function()
            -- Set configuration options here
            -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
            -- This is VERY helpful when reporting an issue with the project
            -- vim.g["conjure#debug"] = true
        end,

        -- Optional cmp-conjure integration
        dependencies = { "PaterJason/cmp-conjure" },
    },
    {
        "PaterJason/cmp-conjure",
        lazy = true,
        config = function()
            local cmp = require "cmp"
            local config = cmp.get_config()
            table.insert(config.sources, { name = "conjure" })
            return cmp.setup(config)
        end,
    },
    { "echasnovski/mini.nvim", version = false },

    {
        "github/copilot.vim",
        cmd = { "Copilot", "CopilotSetup" },
        config = function() end,
    },

    { import = "plugins" },
}, lazy_config)
local harpoon = require "harpoon"
harpoon.setup()
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
    require "mappings"
end)
