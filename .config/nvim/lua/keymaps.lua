--------------------
--     Common     --
--------------------

local opts = {
    noremap = true,        -- non-recursive
    silent = true,         -- do not show message
    desc = ""
}

local function map(mode, lhs, rhs, desc)
    local o = vim.tbl_extend("force", opts, { desc = desc })
    vim.keymap.set(mode, lhs, rhs, o)
end

--------------------
--   Normal Mode  --
--------------------

-- Better window navigation
map('n', '<C-h>', '<C-w>h', 'Window left')
map('n', '<C-j>', '<C-w>j', 'Window down')
map('n', '<C-k>', '<C-w>k', 'Window up')
map('n', '<C-l>', '<C-w>l', 'Window right')

-- Resize with arrows
-- delta: 2 lines
map('n', '<C-Up>', ':resize -2<CR>', 'Resize window up')
map('n', '<C-Down>', ':resize +2<CR>', 'Resize window down')
map('n', '<C-Left>', ':vertical resize -2<CR>', 'Resize window narrower')
map('n', '<C-Right>', ':vertical resize +2<CR>', 'Resize window wider')

-- Reload nvim config
map('n', '<Leader><C-r>', function()
    vim.cmd('source $MYVIMRC')
    vim.notify('Neovim config reloaded')
end, 'Reload Neovim config')

-- File nav
map('n', '<Leader><S-e>', ':Ex <CR>', 'Open file explorer')

-- Switch to last buffer
map('n', '<leader><Tab>', '<C-^>', 'Switch to last buffer')

-- Exit insert mode in terminal
map('t', '<esc>', [[<C-\><C-n>]], 'Exit terminal mode')

-- Diagnostic
map("n", "K", vim.lsp.buf.hover, 'LSP hover')
map("n", "<leader>e", vim.diagnostic.open_float, 'Show diagnostic')
map("n", "[d", vim.diagnostic.goto_prev, 'Previous diagnostic')
map("n", "]d", vim.diagnostic.goto_next, 'Next diagnostic')
map("n", "<leader>q", vim.diagnostic.setloclist, 'Diagnostics to loclist')

--------------------
--- Visual Mode  ---
--------------------

-- Keep selection when indenting
map('v', '<', '<gv', 'Indent left and keep selection')
map('v', '>', '>gv', 'Indent right and keep selection')
