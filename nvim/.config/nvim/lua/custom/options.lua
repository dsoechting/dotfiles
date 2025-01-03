-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

vim.o.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Tab settings
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Set wrap to false
vim.o.wrap = false

vim.o.scrolloff = 8
vim.o.updatetime = 50
-- vim.o.colorcolumn = "80"

-- Search settings
vim.o.hlsearch = false
vim.o.incsearch = true

-- Enable break indent
vim.o.breakindent = true

vim.o.smartindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- split options
vim.o.splitright = true
vim.o.splitbelow = true

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.cmd("colorscheme base16-black-metal-gorgoroth")
