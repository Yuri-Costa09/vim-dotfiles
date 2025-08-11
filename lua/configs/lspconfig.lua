require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "gopls",
  "rust_analyzer",
  "clangd",
  "clojure_lsp",
  "elixirls",
  "yaml_ls",
  "tsserver",
  "docker_compose_language_service",
  "dockerls",
  "jsonls"
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
