-- shorthand vars
local keymap = vim.keymap
-- local imports
local telescope_builtin = require("telescope.builtin")
local harpoon = require "harpoon"
local fzf_lua = require("fzf-lua")

-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.
local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

-- General -------------------------------------

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

-- Easier even split shortcut
-- keymap.set("n", "<C-w>=", "<leader>E")

-- See `:help K` for why this keymap
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move selected lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep up/down centered on screen
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- Keep search centered on screen
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Delete char without filling register
keymap.set("n", "x", '"_x')
-- Paste without losing the yank
keymap.set("x", "p", "\"_dP")
-- Leader d to delete to void register
keymap.set({ 'n', 'v' }, "<leader>d", "\"_d")

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Navigate the quickfix list (errors)
keymap.set('n', '<C-n>', '<cmd>cnext<CR>zz')
keymap.set('n', '<C-m>', '<cmd>cprev<CR>zz')


-- Lsp
nmap('gd', "<cmd>FzfLua lsp_definitions     jump_to_single_result=true ignore_current_line=true<cr>",
    '[G]oto [D]efinition')
nmap('gr', "<cmd>FzfLua lsp_references     jump_to_single_result=true ignore_current_line=true<cr>",
    '[G]oto [R]eferences')
nmap('gi', "<cmd>FzfLua lsp_implementations     jump_to_single_result=true ignore_current_line=true<cr>",
    '[G]oto [I]mplementation')
nmap('gt', "<cmd>FzfLua lsp_typedefs     jump_to_single_result=true ignore_current_line=true<cr>",
    '[G]oto [T]ypeDef')

-- Navigation -------------------------------------------

keymap.set("n", "<leader>L", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
keymap.set("n", "<leader>J", "<cmd>split<cr>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>X", "<cmd>close<CR>", { desc = "Close current split" })
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)


-- Open file tree
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope
keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = '[S]earch [K]eymaps' })

-- fzf-lua
keymap.set("n", "<leader>ff", fzf_lua.files, { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fs", fzf_lua.live_grep_glob, { desc = "[F]ind [S]tring with live grep" })
keymap.set('n', '<leader>fr', fzf_lua.resume, { desc = 'FZF resume previous search' })
keymap.set('n', '<leader>fq', fzf_lua.quickfix, { desc = 'FZF resume previous search' })
keymap.set('n', '<leader><space>', fzf_lua.oldfiles, { desc = 'Find recently opened files' })
keymap.set("n", "<leader>/", fzf_lua.lgrep_curbuf, { desc = "" })
keymap.set("n", "<leader>ft", fzf_lua.colorschemes, { desc = "" })
keymap.set("n", "<leader>fc", fzf_lua.quickfix_stack, { desc = "" })

-- Harpoon
keymap.set("n", "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Toggle Harpoon menu" })
keymap.set("n", "<leader>hh", function() harpoon:list():append() end, { desc = "Append to Harpoon list" })

keymap.set("n", "<leader>j", function() harpoon:list():select(1) end)
keymap.set("n", "<leader>k", function() harpoon:list():select(2) end)
keymap.set("n", "<leader>l", function() harpoon:list():select(3) end)
keymap.set("n", "<leader>;", function() harpoon:list():select(4) end)

-- Zen mode
keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })

-- Format
keymap.set("n", "<leader>rp", "<cmd>Format<cr>", { desc = "Format code" })

-- Trouble
nmap("<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", 'Toggle Trouble')
nmap("<leader>tq", "<cmd>Trouble qflist toggle<cr>", 'Toggle Trouble Quickfix')
