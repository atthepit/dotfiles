vim.opt.guicursor = ""

-- Enable mouse mode (hability to use mouse inside vim)
vim.o.mouse = 'a'

-- Make line numbers default
vim.opt.nu = true
vim.opt.relativenumber = true -- Use relativie numbers for easier navigation

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Allow line wrapping
vim.opt.wrap = true
-- Enable break indent (when the line wraps, keep same indent)
vim.o.mouse = true

-- Let undodir to check the complete history of the file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true -- See highlight ocurr while searching
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Pretty colors
vim.opt.termguicolors = true
vim.cmd [[colorscheme dracula]]

-- See always 8 lines ahead
vim.opt.scrolloff = 8

-- Allow signs to be desplayed (like git signs)
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Time of inactivity (in ms) until the buffer is automatically saved
vim.opt.updatetime = 250

-- colored column (right) used for gidance for file width
vim.opt.colorcolumn = "80"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
