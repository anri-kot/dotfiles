--------------------
--     Common     --
--------------------

local opts = {
    noremap = true,        -- non-recursive
    silent = true,         -- do not show message
}

-- Reload nvim config
vim.keymap.set('n', '<Leader><C-r>', function()
    vim.cmd('source $MYVIMRC')
    vim.notify('Neovim config reloaded')
end, { desc = 'Reload Neovim config' })

-- File nav
vim.keymap.set('n', '<Leader>e', ":Ex <CR>", opts)

-- Switch to last buffer
vim.keymap.set('n', '<Leader><Tab>', '<C-^>', opts)

--------------------
--   Normal Mode  --
--------------------

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

--------------------
--- Visual Mode  ---
--------------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
