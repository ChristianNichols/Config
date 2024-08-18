vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[
    set encoding=utf-8
    set ruler
    set rnu
    set shm+=I
    set nohlsearch
    set noshowmode
    set signcolumn=yes

    set gcr=a:blinkon1


    "" split screen vert and horizontal
    nnoremap <leader>v <cmd>vsplit<cr>
    nnoremap <leader>h <cmd>split<cr>

    set clipboard=unnamedplus

    set noswapfile


     "" Remember cursor position
 augroup vimrc-remember-cursor-position
     autocmd!
     autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
 augroup END
]]

-- auto indent going into insert mode in scope
vim.keymap.set('n', 'i', function ()
    return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or 'i'
end, {expr=true, noremap=true})

