require("buffer_manager").setup({  })
vim.keymap.set('n', '<leader>m', ":lua require(\"buffer_manager.ui\").toggle_quick_menu()<CR>", {silent=true})
