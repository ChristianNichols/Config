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
