" Setting the leader
let mapleader="\<SPACE>"

" General settings
set title
set wildmenu
set ruler
set hlsearch
set showmatch
set noerrorbells
set novisualbell
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set noswapfile
set autoread
set ignorecase
set smartcase
set incsearch
set backspace=2
set scrolloff=3
set ttyfast
set ai
set si
set wrap
set number 
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set mouse=a

" Show invisible chars
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Useful mappings for managing tabs
map <leader>te :tabedit<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabn<cr>
map <leader>tp :tabp<cr>

call plug#begin('~/.config/nvim/plugged')

Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
" vim-sneak for better movement
Plug 'mhinz/vim-startify'
" vim-startify, a fancy start screen for vim.
Plug 'kien/ctrlp.vim'
" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'
" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'
" A cool status bar
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'
" Intellisense engine
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_highlighters = ['backgroundfull']
" Color highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git integration
Plug 'tpope/vim-fugitive'
" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'
" Show Git blame under the cursor
Plug 'rhysd/git-messenger.vim'
" Fuzzy search capability
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Better syntax highlighting for different programming languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Distraction-free writing
Plug 'junegunn/goyo.vim'
" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" TokyoNight theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Some fancy nerd icons 
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Color and syntax highlighting
filetype plugin indent on
syntax on

" Split windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Ctrl-P
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlPCurWD' 

" Nerd Tree
map <C-f> :NERDTreeToggle<CR>
set autochdir
let NERDTreeShowHidden=1
" Show hidden files in NerdTree buffer.
let NERDTreeChDirMode=2
" Open NERDTree in the current directory
highlight NERDTreeDirSlash guifg=#C0CAF5 ctermfg=white
set secure

" Clipboard
set clipboard=unnamed
" Use OS clipboard

" Airline
let g:airline_theme='distinguished'
" User powerline symbols in Airline
let g:airline_powerline_fonts = 1



"COC
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>

" coc-related configuration
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd BufNewFile,BufRead *.tpl set filetype=yaml

set spell
set spelllang=en_us


let g:coc_global_extensions = [
  \ 'coc-spell-checker',
  \ 'coc-prettier',
  \ 'coc-git',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-markdownlint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-clangd',
  \ 'coc-yaml'
  \ ]

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" FZF shortcuts
nnoremap <silent> <Leader>f :Ag<CR>

autocmd Filetype python map <F5> <CR>:vsplit <CR>:ter python3 "%"<CR>

" Goyo configurations
let g:goyo_width = 250
let g:goyo_height = 250
map <C-g> :Goyo<CR>
" Vim Markdown
let g:vim_markdown_folding_disabled = 1
" Styling: All styles --------------------------------------------------------
runtime vimrc.styling
hi String guifg=#7DCFFF
