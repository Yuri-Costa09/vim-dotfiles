return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
{
    "Olical/conjure",
    ft = { "clojure", "fennel", "janet", "hy", "racket" },
    init = function()
      -- remapeie se quiser (ou remova este init se não precisar)
      vim.g["conjure#mapping#eval_current_form"] = "<LocalLeader>Ee"
      vim.g["conjure#mapping#eval_root_form"]    = "<LocalLeader>Er"
      vim.g["conjure#mapping#connect"]           = "<LocalLeader>Ec"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "javascript",
        "typescript",
        "rust",
        "json",
        "yaml",
        "ruby",
        "c",
        "cpp",
        "clojure",
        "dockerfile",
        "elixir",
        "prisma",
        "ziggy"
  		},
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      }
  	},
    config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end
  },
}
