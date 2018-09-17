call pathogen#infect()
call pathogen#helptags()

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

colorscheme wombat256mod

syntax on  " turn on syntax highlighting

" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
autocmd BufNewFile,BufRead *.hbs setlocal ft=html
autocmd Filetype gitcommit setlocal spell textwidth=72

match ErrorMsg '\s\+$'

set fileformat=unix  " unix line endings

" UI
set ruler         " always show current position
set modeline
" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

set clipboard=unnamed  " allows to copy directly to OS

set hidden        " switch between buffers without saving

" Search
set hlsearch      " highlight search

set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=2  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=2     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set wildmenu      " visual autocomplete for command menu
set lazyredraw    " redraw only when we need to
set showmatch     " highlight matching [{()}]

set incsearch     " search as characters are entered
set hlsearch      " highlight matches

set mouse=a       " all

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Text, tabs, indents
set ai    " auto indent
set si    " smart indent
set wrap  " wrap lines

set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
if (&term == "xterm")
  set t_Co=256
elseif (&term == "screen-bce")
  set t_Co=256
endif

" Set Atom dark 256 color theme only if such exists
silent! colorscheme atom-dark-256

" Run 'vim +PluginInstall +qall' to install plugins.
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" start plugin defintion
" Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'benmills/vimux'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'neomutt/neomutt.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" Plugin 'ryanoasis/vim-devicons'
" end plugin definition
call vundle#end()            " required for vundle

" CtrlP ignore patterns
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_window = 'bottom,order:ttb'  " order matching files top to bottom with ttb
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

nnoremap <F10> :call VimuxRunCommand("clear; make test")<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', 'deps/', '__pycache__/']

nnoremap <silent> <F3> :NERDTreeToggle<CR>

vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" python-mode
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_vim_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_guess_project = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_lint_checkers = ['pep8']

autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Abbreviations
iabbrev retunr return

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
