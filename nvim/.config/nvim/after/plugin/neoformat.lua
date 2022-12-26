-- [[ Configure Neoformat ]]
-- See `:help neoformat`
vim.g.neoformat_try_node_exe = 1
vim.cmd('autocmd BufWritePre *.{js,jsx} Neoformat')

