" ***** Vundle *****
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'emezeske/paredit.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'jebberjeb/vim-clojure-conceal'
Plugin 'jebberjeb/yet-another-buffer-list'
Plugin 'jebberjeb/vim-pivotal-tracker'
Plugin 'jebberjeb/grimoire.vim'
Plugin 'jebberjeb/eastwood.vim'
Plugin 'mileszs/ack.vim'
Plugin 'taglist.vim'
Plugin 'vimoutliner/vimoutliner'
"Plugin 'kovisoft/slimv'
call vundle#end()

" ***** General *****
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax on
"autocmd Filetype html setlocal ts=2 sts=2 sw=2
set nu
let mapleader = ","
let maplocalleader = ",,"
inoremap jk <Esc>
set statusline=%-.50f\ \ %l/%L\ \ %y
set ruler

" ***** Whitespace formatting *****
set tabstop=4
set shiftwidth=4
set expandtab
set backspace+=indent,eol,start
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" ***** .vimrc *****
" TODO - reuse here
noremap <leader>dot :vsplit ~/.vimrc<cr>:execute ":nnoremap <buffer> q :w\<lt>cr>:bd\<lt>cr>"<cr>
noremap <leader>cheat :vsplit ~/source/scratch/cheatsheet/<cr>:execute ":nnoremap <buffer> q :w\<lt>cr>:bd\<lt>cr>"<cr>
noremap <leader>log :vsplit ~/source/scratch/logbook/<cr>:execute ":nnoremap <buffer> q :w\<lt>cr>:bd\<lt>cr>"<cr>
noremap <leader>todo :split TODO<cr>:set ft=votl<cr>:execute ":nnoremap <buffer> q :w\<lt>cr>:bd\<lt>cr>"<cr>

nnoremap <leader>sdot :source ~/.vimrc<cr>
" ***** Buffer navigation *****
nnoremap <leader>wq :q<cr>
nnoremap <leader>wh <c-w>h<cr>
nnoremap <leader>wj <c-w>j<cr>
nnoremap <leader>wk <c-w>k<cr>
nnoremap <leader>wl <c-w>l<cr>
nnoremap + <c-u>
nnoremap - <c-d>

" ***** Buffer sizing *****
nnoremap <left> :vertical res -1<cr>
nnoremap <right> :vertical res +1<cr>
nnoremap <down> :res -1<cr>
nnoremap <up> :res +1<cr>

" ***** Movement *****
" 'sl' stands for scroll lock
nnoremap <leader>slon :set so=100<cr>
nnoremap <leader>sloff :set so=0<cr>

" ***** Unmap *****
inoremap <esc> <nop>
inoremap <c-[> <nop>

" ***** Copy/paste *****
function! ReadyToCopy()
    :set cc=0
    :set nonumber
    :set nolist
    :set mouse=""
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

" ***** Fugitive *****
nnoremap gs :Gstatus<cr>
nnoremap gc :Gcommit<cr>
nnoremap gp :!git push<cr>

" ***** NERDTree *****
let NERDTreeShowHidden = 1
nnoremap nt :NERDTree<cr>

" ***** Ctrl-P *****
nnoremap <leader>t :CtrlP<CR>
let g:ctrlp_show_hidden = 1

" ***** Paredit *****
let g:paredit_mode = 1
" TODO - define filetypes?
au FileType edn call PareditInitBuffer()
au FileType cljc call PareditInitBuffer()

" ***** Colors *****
"colorscheme vividchalk
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

set cc=80
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

set hls

" ***** VimScript *****
" Eval the current buffer
nnoremap <leader>so :w<cr> :so %<cr>

" ***** VimShell *****
function! VSplitShell()
    :vnew
    :normal 
    :normal ,wl
    :VimShell
endfunction
nnoremap <leader>sh :call VSplitShell()<cr>

let g:vogon_root = "/home/pair/work/stapleslabs/Vogon"
function! PsqlVimShell(env)
    exec ':!' . g:vogon_root . '/bin/rs-env ' . a:env . ' current'
    "Don't split -- handle the split ourselves.
    exec ':VimShellInteractive --split="" "' . g:vogon_root . '/bin/psql"'
endfunction
command! -nargs=1 Psql :call PsqlVimShell("<args>")

" ***** Vim-pivotal-tracker *****
let g:token = "<your pivotal tracker token>"
let g:project_id = "366911"

function! FormatJSON()
    :%!python -m json.tool
endfunction
nnoremap =j :call FormatJSON()<CR>
command! FormatJSON call FormatJSON()

" Send the selected text to pastebin.
" TODO - automate putting the resulting uri on the clipboard, or
" at least opening it in a browser.
vnoremap <leader>pb <esc>:'<,'>:w !curl -F 'clbin=<-' https://clbin.com<CR>

" ***** Clojure *****
command! -nargs=1 C Connect nrepl://localhost:<args>
nnoremap <leader>eval :%Eval<CR>

" TODO - parameterize this function, use the root
" directory and port for the project -- it should look
" at the current/wokring directory and decided based
" on that (not actually a parameter).
function! Work()
    :norm ,shlein repl :connect 3101
    :norm ,wh
    :NERDTree
    :norm ,wl
    :e! project.clj
    :vertical res +40
    :Connect nrepl://localhost:3101 /home/pair/src/stapleslabs/Magrathea
endfunction

function! LoadUtilNamespaces()
    let code =
        \ "(do (require '[clojure.pprint :refer :all] \n" .
        \ "             '[clojure.test :refer :all] \n" .
        \ "             '[clojure.repl :refer :all] \n" .
        \ "             '[clojure.java.io :as io] \n" .
        \ "             '[ring.mock.request :refer (request)] \n" .
        \ "             '[clojure.java.shell :refer (sh)] \n" .
        \ "             '[clojure.tools.namespace.repl :refer (refresh)]) \n" .
        \ "    (defmacro ls-ns [n] `(-> '~n ns-publics keys sort pprint)))"
    call fireplace#eval(code)
    echo "fireplace#eval() " . code
endfunction
nnoremap <leader>ns :call LoadUtilNamespaces()<cr>

nnoremap <leader>testa :call FooRunTests()<cr>

" ***** +mzscheme *****
nnoremap <leader>mzf :mzf %<cr>

" ***** Grimoire *****
nnoremap <leader>grim :GrimBrowse<cr>

" ***** Reminders *****
function! ShowReminders()
    new
    e ~/source/scripts/reminders
    nnoremap <buffer> q :w<cr>:bd<cr>
endfunction
command! Reminders call ShowReminders()
command! ShowReminders call ShowReminders()
echo system('cat ~/source/scripts/reminders')

" ***** Quickfix *****
nnoremap <leader>qfn :cnext<cr>
nnoremap <leader>qfp :cprevious<cr>
nnoremap <leader>qfo :copen<cr>
nnoremap <leader>qfc :cclose<cr>

" ***** Location *****
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>lc :lclose<cr>
