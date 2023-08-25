vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Don't use leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Go to netrw (project view)

-- This allow to move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Removes whitespaces down
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("x", "<leader>p", "\"_dP") -- Paste without replacing yanked

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- Yank to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Yank line to clipboard

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- drop without replacing yank

vim.keymap.set("i", "<C-c>", "<Esc>") -- Ctrl-c to esc

vim.keymap.set("n", "Q", "<nop>")

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

