"-------------------default-------------------
syntax on
set fileformat=unix
set backspace=2
set number
set nowrap
set autoindent
set hlsearch
" vim in current path
autocmd BufEnter * silent! lcd %:p:h
colorscheme onedark




"-------------------shortcut-------------------
inoremap {<CR> {<CR>}<ESC>O




"-------------------plug-------------------
call plug#begin()
" statusline
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

Plug 'preservim/NERDTree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" coc select
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" coc confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
call plug#end()
