require('lualine').setup({
      sections = {
    lualine_c = {
      {
        function()
          return require("dap").status()
        end,
        icon = { "", color = { fg = "#e7c664" } }, -- nerd icon.
        cond = function()
          if not package.loaded.dap then
            return false
          end
          local session = require("dap").session()
          return session ~= nil
        end,
      },
    },
  },
})
require("bufferline").setup({
    options = {
        show_buffer_close_icons = false,
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
    }
})

vim.cmd [[
  nnoremap <silent> <leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent> <leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent> <leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent> <leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent> <leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent> <leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent> <leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
]]
