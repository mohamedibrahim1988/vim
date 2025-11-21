" Indent
filetype plugin on
filetype indent on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax on 

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" showmatch pairs
set showmatch
set wildmenu
set wildmode=longest,full
set wildignorecase                           " Non-case-sensitive file name completion
set wildignore=*.docx,*.jpg,*.jpeg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set complete+=k
set completeopt=menu,menuone,longest
set completeopt+=preview

" Interface options ▷▼
set nu
set rnu
set title
set background=dark
set cursorline
set mouse=a
set splitbelow splitright
set nowrap
if !has('gui_runnibg')
    set t_Co=256
endif
set termguicolors

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
set guifont=JetBrainsMono\ Nerd\ Font
" Italic comments.
highlight Comment cterm=italic

" No wiggly line in terminal. Use underline instead. 
if has('terminal')
  hi SpellBad cterm=underline
endif
" misc 
set showcmd
set noswapfile
set nobackup
set nowb
" folded
set foldmethod=marker
set foldmarker={{{,}}}  " Define the markers to use for folding
" Resize panes when window/terminal gets resize
autocmd VimResized * :wincmd =
"Alt
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50
set clipboard=unnamedplus
set delcombine
set nojoinspaces
