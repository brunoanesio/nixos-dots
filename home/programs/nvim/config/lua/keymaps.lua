local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

map("n", "<leader>qq", ":qa!<CR>", opts)
map("n", "<ESC>", ":noh <CR>", opts)
map("i", "jk", "<ESC>", opts)
map("n", "<C-s>", ":wa!<CR>", opts)

-- buffer mappings
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>x", ":bdelete<CR>", opts)
-- Visual mappings
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Normal mappings
map("n", "J", "mzJ`z", opts)
-- paste remap
map("v", "<leader>p", '"_dp')
map("v", "<leader>P", '"_dP')
map({ "n", "x" }, "<leader>p", [["0p]])
-- clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')
-- Splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Plugins
map("n", "<leader>lg", "<cmd>LazyGit<cr>", opts)

-- LSP
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

-- Mini
map("n", "<leader>qs", "<cmd>lua MiniSessions.read()<cr>", opts)
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", opts)
map("n", "<leader>ff", "<cmd>Pick files<cr>", opts)
map("n", "<leader>,", "<cmd>Pick files<cr>", opts)
map("n", "<leader>fg", "<cmd>Pick grep_live<cr>", opts)
map("n", "<leader>.", "<cmd>Pick buffers<cr>", opts)
