return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "rust-analyzer",
        "yaml-language-server",
        "json-lsp",
        "clangd",
        "clojure-lsp",
        "gopls",
        "elixir-ls",
        "lua-language-server",
        "stylua",
      },
    },
  },
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python", "janet", "hy", "racket" },
    lazy = true,
    init = function()
      vim.g["conjure#mapping#eval_current_form"] = "<LocalLeader>Ee"
      vim.g["conjure#mapping#eval_root_form"]    = "<LocalLeader>Er"
      vim.g["conjure#mapping#connect"]           = "<LocalLeader>Ec"
      vim.g["conjure#mapping#doc_word"]          = { "K" }
    end,
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        config = function()
          local cmp = require "cmp"
          local config = cmp.get_config()
          table.insert(config.sources, { name = "conjure" })
          return cmp.setup(config)
        end,
      }
    },
  },
  {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },
  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
    end,
  },
  { "echasnovski/mini.nvim", version = false },
  {
    "github/copilot.vim",
    cmd = { "Copilot", "CopilotSetup" },
  },
  { import = "nvchad.blink.lazyspec" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "go", "javascript",
        "typescript", "rust", "json", "yaml", "ruby", "c", "cpp",
        "clojure", "dockerfile", "elixir", "haskell", "prisma", "ziggy"
      },
      highlight = { enable = true },
      indent = { enable = true }
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end
  },
}
