" ***** Pathogen *****
set nocompatible
call pathogen#infect()

" ***** General *****
syntax on
filetype plugin indent on
autocmd Filetype html setlocal ts=2 sts=2 sw=2
set nu

" Whitespace Formatting
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set backspace+=indent,eol,start
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Basic Mappings
let mapleader = ","
inoremap jk <Esc>

" Edit/Source .vimrc
noremap <leader>dot :vsplit ~/.vimrc<cr>:execute ":nnoremap <buffer> q :w\<lt>cr>:bd\<lt>cr>"<cr>
nnoremap <leader>sdot :source ~/.vimrc<cr>

" Moving Text Around
nnoremap <leader>lu :normal ddkkp<cr>
nnoremap <leader>ld :normal ddp<cr>

" Buffer Navigation
nnoremap <leader>wq :q<cr>
nnoremap <leader>wh <c-w>h<cr>
nnoremap <leader>wj <c-w>j<cr>
nnoremap <leader>wk <c-w>k<cr>
nnoremap <leader>wl <c-w>l<cr>

" Buffer Sizing
noremap <left> :vertical res -1<cr>
nnoremap <right> :vertical res +1<cr>
nnoremap <down> :res -1<cr>
nnoremap <up> :res +1<cr>

" Unmap
inoremap <esc> <nop>
inoremap <c-[> <nop>

" Add/Remove Formatting (for copy/paste)
function! ReadyToCopy()
    :set cc=0
    :set nonumber
    :set nolist
endfunction
function! NotReadyToCopy()
    :set cc=80
    :set number
    :set list
endfunction
nnoremap <leader>copy :call ReadyToCopy()<cr>
nnoremap <leader>nocopy :call NotReadyToCopy()<cr>

" ***** TAGS (ctags, taglist.vim) *****
let Tlist_WinWidth=40
let tlist_clojure_settings='lisp;f:function'
nnoremap tl :TlistToggle<cr>
nnoremap tn :tn<cr>
nnoremap tp :tp<cr>
nnoremap gtl :!/usr/bin/ctags --langmap=lisp:+.clj -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" ***** NERDTree *****
let NERDTreeShowHidden = 1
nnoremap nt :NERDTree<cr>

" ***** Fireplace *****
nnoremap <leader>eval :%Eval<CR>
nnoremap <leader>test :Eval (clojure.test/run-all-tests)<CR>

" ***** Command-T *****
let g:CommandTMaxFiles=50000
let g:CommandTMaxDepth=20

" ***** Paredit *****
let g:paredit_mode = 1

" ***** Colors *****
colorscheme vividchalk
set cc=80
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" ***** VimScript *****
" Eval the current buffer
nnoremap <leader>run :w<cr> :so %<cr>

" ***** VimShell *****
function! VSplitShell()
    :vnew
    :normal 
    :normal ,wl
    :VimShell
endfunction
nnoremap <leader>sh :call VSplitShell()<cr>

