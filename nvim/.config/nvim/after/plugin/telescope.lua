local builtin = require('telescope.builtin')

-- Project Find: search all file names
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Search files added to git repo
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Project Search: Do a search with grep in the whole project
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>rf', builtin.oldfiles, { desc = '[rf] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
