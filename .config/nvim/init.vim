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
set smarttab
set mouse=a
set cmdheight=2
set updatetime=200

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
let g:mkdp_echo_preview_url = 1
Plug 'mhinz/vim-startify'
" vim-startify, a fancy start screen for vim.
let g:startify_files_number = 20
let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ]
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 1
let g:startify_session_sort = 1
let g:startify_session_persistence = 1
"let s:startify_ascii_header = [
 "\ '         //                 /*',
 "\ '      ,(/(//,               *###',
 "\ '    ((((((////.             /####%*',
 "\ ' ,/(((((((/////*            /########',
 "\ '/*///((((((//////.          *#########/',
 "\ '//////((((((((((((/         *#########/.',
 "\ '////////((((((((((((*       *#########/.',
 "\ '/////////(/(((((((((((      *#########(.',
 "\ '//////////.,((((((((((/(    *#########(.',
 "\ '//////////.  /(((((((((((,  *#########(.',
 "\ '(////////(.    (((((((((((( *#########(.',
 "\ '(////////(.     ,#((((((((((##########(.',
 "\ '((//////((.       /#((((((((##%%######(.',
 "\ '((((((((((.         #(((((((####%%##%#(.',
 "\ '((((((((((.          ,((((((#####%%%%%(.',
 "\ ' .#(((((((.            (((((#######%%',
 "\ '    /(((((.             .(((#%##%%/*',
 "\ '      ,(((.               /(#%%#',
 "\ '        ./.                 #*',
 "\ ]
"let g:startify_custom_header = startify#pad(split(system('tty-clock'), '\n'))
"Plug 'glepnir/dashboard-nvim'
"" Default value is clap
"let g:dashboard_default_executive = 'fzf'
""let g:dashboard_custom_footer = ""
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'
let g:startify_custom_header  = [
         \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
         \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
         \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
         \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
         \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
         \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
         \ ]
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
" vim-sneak for better movement
Plug 'kien/ctrlp.vim'
" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'
" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'
" A cool status bar
Plug 'vim-airline/vim-airline'
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
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" TokyoNight theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Some fancy nerd icons 
Plug 'ryanoasis/vim-devicons'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
"python formatting
Plug 'andweeb/presence.nvim'
" Discord RPC
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

set clipboard=unnamed
" Use OS clipboard

let g:airline_theme = "tokyonight"
" Use powerline symbols in Airline
let g:airline_powerline_fonts = 1


"COC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc-related configuration
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')



let g:coc_global_extensions = [
  \ 'coc-prettier',
  \ 'coc-git',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-markdownlint',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-pydocstring',
  \ 'coc-sh',
  \ 'coc-rust-analyzer'
  \ ]

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"black shortcuts
nnoremap <buffer><silent> <c-q> <cmd>call Black()<cr>
inoremap <buffer><silent> <c-q> <cmd>call Black()<cr>
" FZF shortcuts
nnoremap <silent> <Leader>f :Ag<CR>

autocmd Filetype python map <F5> <CR>:vsplit <CR>:ter python3 "%"<CR>

" Goyo configurations
let g:goyo_width = 250
let g:goyo_height = 250
map <C-g> :Goyo<CR>
" Vim Markdown
let g:vim_markdown_folding_disabled = 0
" Styling: All styles --------------------------------------------------------
runtime vimrc.styling
hi String guifg=#7DCFFF



let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The Only Real Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_enable_line_number  = 1
let g:presence_blacklist           = []
let g:presence_buttons             = 1
let g:presence_file_assets         = {}
