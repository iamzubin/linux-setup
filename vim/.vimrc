set nocompatible      " be iMproved, required
set encoding=utf-8
set clipboard=unnamedplus " linux ctrl-c/v

" Allows you to :e file automplete in subdirectories
set path+=**
set wildmenu
set clipboard=unnamed

" Execute line under cursor in bash
nmap <F6> :exec '!'.getline('.')

" For some reason, the vertical bar cursor stopped working by default in
" insert mode, and I found this which also apparently applies some fixes to
" tmux, which I use
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

filetype plugin indent on

call plug#begin()

Plug 'othree/yajs'
Plug 'mxw/vim-jsx'
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'mustache/vim-mustache-handlebars'
Plug 'davidhalter/jedi-vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

call plug#end()

set runtimepath^=~/.vim/bundle/ctrlp.vim

" vodoo for true color, along with .tmux.conf settings
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:prettier#autoformat = 0
au BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml Prettier
au BufRead,BufNewFile *.js setlocal syntax=javascript.jsx
au BufRead,BufNewFile *.yaml,*.yml set filetype=yaml.ansible

" automatically wrap in markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" new version of vim is dumb and wont delete over line breaks
set backspace=2

" Enable syntax highlight
syntax enable

set autoindent
set smartindent
set ttyfast

" Spaces to tabs
set expandtab
set tabstop=2
set shiftwidth=2

" Turn on search highlighting
set hlsearch

" Deal with upper/lower better
set smartcase
set ignorecase


" Add line numbers
set relativenumber

" Set the status line to something nifty
set stl=%f\ Line:%l/%L\ (%p%%)\ Col:%v\ Buf:#%n\ 0x%B

" always show a status line
set laststatus=2

" Jedi Config
let g:jedi#goto_command = ",d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#completions_enabled = 1


" syntax highlight
let python_highlight_all=1
syntax on

" theme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
hi Normal guibg=NONE ctermbg=NONE

" pylint settings
let g:pymode_lint_ignore = "E501,W"


" NERD tree
map ,t :NERDTreeToggle<CR>
