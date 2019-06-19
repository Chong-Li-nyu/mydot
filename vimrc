" Then reload .vimrc and :PlugInstall to install plugins.
" reload means press :w, nothing else, no need to source .vimrc
" set number
" Basic setup
" enter the current millenium, not to be vi
set nocompatible
set backspace=indent,eol,start

let mapleader = ","

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" End configuration, makes the plugins available
call plug#end()

" SELF DEFINED SHORTCUT MAPPINGS {{{
" Open nerdtree
map <C-n> :NERDTreeToggle<CR>
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Default arrow
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Now you can cycle between the registers "", "a, "b by pressing \s (assuming the default backslash for the leader key).
":let @a=@b copies register "b to register "a.
"| separates Ex commands; \ escapes the pipe for the map command.
"显式指定寄存器内容的命令 :let@，例如命令 :let @a = "vim registers blog", 表示将"a寄存器内容设置为右值。
" visual select content then do  "vy. Register"v will have the select contents
nnoremap <Leader>s :let @x=@" \| let @"=@a \| let @a=@b \| let @b=@x \| reg "ab<CR>

" Stay in normal mode while inserting a new line under normal mode, staying on the same line 
nmap <silent> zj o<Esc>
nmap <silent> <leader>j a<CR><Esc>
nmap <silent> zk O<Esc>

" ctrl+l copy whole line to regiester l
nmap <C-L> ^"ly$ 

" toggle paste mode
nmap <C-p> :set paste<CR>
nmap <leader>p :set nopaste<CR>

" Source current file
nmap <leader>m :source ~/.vimrc<CR>

" Word wrapped with (), or current to line end with ()
nmap <leader>( i(<ESC>ea)<ESC>
nmap <leader>' i'<ESC>ea'<ESC>
nmap <leader>" i"<ESC>ea"<ESC>
nmap <leader>{ a{}<ESC> 

" insert space in normal mode
nmap <leader><Space> a <Esc>
