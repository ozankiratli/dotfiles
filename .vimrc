runtime! debian.vim

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible             "required
filetype off                 "required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'voldikss/vim-floaterm'
Plugin 'tpope/vim-fugitive'
Plugin 'lervag/vimtex'
Plugin 'wellle/targets.vim'
Plugin 'farmergreg/vim-lastplace'
Plugin 'AndrewRadev/tagalong.vim'
Plugin 'mattn/emmet-vim'
Plugin 'davidhalter/jedi-vim'
call vundle#end()            " required

filetype plugin indent on    " required

if has("syntax")
  syntax on
endif

set background=dark
set encoding=utf-8
set number relativenumber

set mouse=a
set ttymouse=sgr


set clipboard=unnamedplus

set matchpairs+=<:>
set formatoptions=1
set autoindent
set linebreak
set wrap
set noerrorbells
set visualbell
" set cursorline
" set spell
let &t_SI = "\e[6 q"
let &t_EI = "\e[0 q"

set sw=2
set iskeyword+=:

" Autocomplete
set wildmode=longest,list,full
set completeopt+=menuone
set completeopt+=longest,menuone,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " Add only if Vim beeps during completion

set showmode
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch  
set incsearch		" Incremental search
" set autowrite		" Automatically save before commands like :next and :make
" set hidden		" Hide buffers when they are abandoned
 

let python_highlight_all = 1

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:skip_defaults_vim = 1

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='dark'

let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_compiler_method = 'latexmk'

let g:tagalong_verbose = 1

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

map <Leader>cc :w<CR><bar><Leader>ll<CR><bar><Leader>lv<CR><bar><Leader>lc

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -c -pdf -silent $* '
let g:Tex_ViewRule_dvi='evince'
let g:Tex_ViewRuls_ps='evince'
let g:Tex_ViewRuls_pdf='evince'

let g:mucomplete#chains = {
    \ 'default' : ['path', 'omni', 'keyn', 'dict', 'uspl'],
    \ 'vim'     : ['path', 'omni', 'cmd', 'keyn']
    \ }



" let g:vimtex_compiler_latexmk = {'build_dir' : '', 'callback' : 1,'continuous' : 1,'executable' : 'latexmk','hooks' : [], 'options' : ['-c','-file-line-error','-synctex=1','-interaction=nonstopmode', ], }
" let g:ycm_semantic_triggers = { 'tex'  : ['{'] }

