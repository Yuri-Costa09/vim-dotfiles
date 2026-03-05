require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References' })
-- Mapeamento para peek definition (exemplo)
map('n', '<leader>gp', vim.lsp.buf.definition, { desc = 'Peek Definition' })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
