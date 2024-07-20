local builtin = require('telescope.builtin')
local telescope = require('telescope')
local devicons = require("nvim-web-devicons")

devicons.setup()

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>r', builtin.oldfiles, {})

telescope.setup {
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = {"--hidden"}
        },
    },
}
