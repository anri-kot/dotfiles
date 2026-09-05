local harpoon = require("harpoon")
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local conf = require("telescope.config").values

harpoon:setup()

-----------------------
-- Telescope Harpoon --
-----------------------

local function harpoon_telescope()
    local file_paths = {}

    for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-------------------
-- Harpoon Maps  --
-------------------

-- Add current file
vim.keymap.set("n", "<leader>ha",
    function() harpoon:list():add() end,
    { desc = "Harpoon: Add file" }
)

-- Toggle menu
vim.keymap.set("n", "<leader>hh",
    function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Harpoon: Toggle quick menu" }
)

-- Telescope harpoon list
vim.keymap.set("n", "<leader>hf",
    harpoon_telescope,
    { desc = "Harpoon: Find marked files (Telescope)" }
)

------------------------
-- Harpoon Navigation --
------------------------

vim.keymap.set("n", "<leader>1",
    function() harpoon:list():select(1) end,
    { desc = "Harpoon: Go to file 1" }
)

vim.keymap.set("n", "<leader>2",
    function() harpoon:list():select(2) end,
    { desc = "Harpoon: Go to file 2" }
)

vim.keymap.set("n", "<leader>3",
    function() harpoon:list():select(3) end,
    { desc = "Harpoon: Go to file 3" }
)

vim.keymap.set("n", "<leader>4",
    function() harpoon:list():select(4) end,
    { desc = "Harpoon: Go to file 4" }
)

-------------------------
-- Harpoon Cycling -----
-------------------------

vim.keymap.set("n", "<leader>hn",
    function() harpoon:list():next() end,
    { desc = "Harpoon: Next file" }
)

vim.keymap.set("n", "<leader>hp",
    function() harpoon:list():prev() end,
    { desc = "Harpoon: Previous file" }
)

-----------------------
-- Telescope Maps --
-----------------------

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
