vim.opt.clipboard = 'unnamedplus'         -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'                       -- allow mouse in nvim

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4                   -- spaces in tab when editing
vim.opt.shiftwidth = 4                    -- insert 4 spaces on tab
vim.opt.expandtab = true                  -- tabs as spaces

-- UI
vim.opt.number = true                     -- show absolute number
vim.opt.relativenumber = true             -- add numbers to each line on the left side
vim.opt.cursorline = true                 -- highlight cursor line
vim.opt.splitbelow = true                 -- open new vertical split bottom
vim.opt.splitright = true                 -- open new horizontal split right
vim.opt.showmode = false

-- Searching
vim.opt.incsearch = true                  -- incremental search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true                  -- case sensitive if uppercase
