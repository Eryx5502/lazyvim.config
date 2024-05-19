-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- TmuxNavigate bindings must be here or else LazyVim overrides them.
map("n", "<leader>wh", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<leader>wj", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<leader>wk", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<leader>wl", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
map("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

-- General mappings
map("n", "<leader>j", [[mno<esc>`n]], { silent = true, desc = "Blank line below" })
map("n", "<leader>k", [[mnO<esc>`n]], { silent = true, desc = "Blank line above" })

-- breaks the line in the current possition
map("n", "zn", "a<cr><esc>k$", { silent = true, desc = "Split line" })

-- Moving lines
map("n", [[<M-C-J>]], [[:m .+1<CR>==]], { noremap = true, silent = true })
map("n", [[<M-C-K>]], [[:m .-2<CR>==]], { noremap = true, silent = true })
map("i", [[<M-C-J>]], [[<Esc>:m .+1<CR>==gi]], { noremap = true, silent = true })
map("i", [[<M-C-K>]], [[<Esc>:m .-2<CR>==gi]], { noremap = true, silent = true })
map("v", [[<M-C-J>]], [[:m '>+1<CR>gv=gv]], { noremap = true, silent = true })
map("v", [[<M-C-K>]], [[:m '<-2<CR>gv=gv]], { noremap = true, silent = true })

-- Octo.nvim mentions, issues and pr completion
map("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
map("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
