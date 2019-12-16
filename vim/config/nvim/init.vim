set encoding=utf-8
set nocompatible

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Plugins go here

Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plug 'tpope/vim-commentary' " Commenting out text
Plug 'tpope/vim-rails' " Bunch of handy Rails functionality
Plug 'tpope/vim-surround' " Work with surrounding ], ), } etc
Plug 'vim-ruby/vim-ruby' " Custom ruby stuff
Plug 'pangloss/vim-javascript' " JS syntax highlighting
Plug 'maxmellon/vim-jsx-pretty' " JSX syntax highlighting
Plug 'leafgarland/typescript-vim' " TypeScript syntax highlighting
Plug 'peitalin/vim-jsx-typescript' " TSX syntax highlighting
Plug 'dense-analysis/ale' " Lint engine
Plug 'alvan/vim-closetag' " Auto-close HTML/XHTML tags
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto-completion
Plug 'neoclide/jsonc.vim' " To tell typescript that tsconfig is actually jsonc
Plug 'nanotech/jellybeans.vim'

" All plugins must be added before the following line
call plug#end()

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on " Enable syntax highlighting

colorscheme jellybeans

if v:progname =~? "evim"
  finish
endif

set backspace=2      " Backspace deletes like most programs in insert mode
set nobackup         " No backup files (annoying)
set nowritebackup
set noswapfile       " No swap files (annoying)
set history=50
set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set incsearch        " do incremental searching
set laststatus=2     " Always display the status line
set autowrite        " Automatically :write before running commands
set formatoptions-=t " Don't auto-break long lines (re-enable this for prose)

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number " Show line numbers
set numberwidth=5

" Indent with 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Auto-indent on new line
set autoindent

" Force vim navigationn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag (silver searcher) with ctrlp. Faster and no useless files.
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" coc config from readme
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

set hidden " if hidden is not set, TextEdit might fail.
" Better display for messages
set cmdheight=2
" " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" For vim-closetag
let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.xhtml,*.phtml'
