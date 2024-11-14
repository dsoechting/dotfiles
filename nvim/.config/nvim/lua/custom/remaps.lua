-- shorthand vars
local keymap = vim.keymap
-- local imports
local telescope_builtin = require("telescope.builtin")
local harpoon = require "harpoon"

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
nmap('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
nmap('gr', function() telescope_builtin.lsp_references({ fname_width = 100 }) end, '[G]oto [R]eferences')
nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
nmap('<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
nmap('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

-- Lesser used LSP functionality
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')

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
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fs", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = '[S]earch [K]eymaps' })
-- See `:help telescope.builtin`
keymap.set('n', '<leader><space>', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader>?', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = true,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Harpoon
keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Toggle Harpoon menu" })
keymap.set("n", "<leader>H", function() harpoon:list():append() end, { desc = "Append to Harpoon list" })

keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)

-- Zen mode
keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })

-- Format
keymap.set("n", "<leader>P", "<cmd>Format<cr>", { desc = "Format code" })

-- Trouble
keymap.set("n", "<leader>e", function() require("trouble").toggle() end)
keymap.set("n", "<leader>ew", function() require("trouble").toggle("workspace_diagnostics") end)
