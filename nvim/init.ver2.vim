if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/repos')
  call dein#begin('~/.config/nvim/repos')
  call dein#add('Shougo/dein.vim')

  "" Gstatus, Gmove and other git commands
  call dein#add('tpope/vim-fugitive')

  "" List and open files
  call dein#add('scrooloose/nerdtree')
  "" Search for files
  call dein#add('ctrlpvim/ctrlp.vim')
  "" Seamless navigation between vim and tmux panes
  call dein#add('christoomey/vim-tmux-navigator')
  "" Use AG
  call dein#add('rking/ag.vim')

  "" Color schemes
  call dein#add('flazz/vim-colorschemes')
  call dein#add('vim-scripts/ScrollColors')
  "" NeoBundle 'tomasr/molokai'
  "" NeoBundle 'gosukiwi/vim-atom-dark'
  "" Enable ansi escape seq colors
  call dein#add('vim-scripts/AnsiEsc.vim')

  "" c-tags
  call dein#add('ludovicchabant/vim-gutentags')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  ""call dein#add('Shougo/deoplete.nvim')
  "" call dein#add('roxma/nvim-completion-manager')
  call dein#add('Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ })
  call dein#add('roxma/nvim-cm-tern',  {'do': 'npm install'})

  " Ruby
  call dein#add('vim-ruby/vim-ruby')

  "" Different language packs
  call dein#add('sheerun/vim-polyglot')
  call dein#add('neomake/neomake')
  
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-rake')
  call dein#add('tpope/vim-bundler')
  call dein#add('gaogao1030/vim-skim')
  call dein#add('othree/html5.vim')

  "" Use leader-b to make ruby do-end to {} and one liner if possible
  call dein#add('jgdavey/vim-blockle')

  "" use cs'" to change surrounding ' to ". Can take any other combinations as
  "" well like cs'<q>, etc
  call dein#add('tpope/vim-surround')

  call dein#add('thoughtbot/vim-rspec')

  call dein#end()
  call dein#save_state()
endif

"" #############
"" CONFIGURATION
"" #############

filetype plugin indent on
syntax enable
set ruler
set number

" Silver searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
endif

"" tags
let g:gutentags_project_root = ['package.json', 'Brocfile.js', 'Capfile', 'Rakefile', 'bower.json', '.ruby-version', 'Gemfile']

""" Deoplete working with snippets
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd

""" Deoplete
"let g:deoplete#enable_at_startup = 1
"if !exists('g:deoplete#omni#input_patterns')
"  let g:deoplete#omni#input_patterns = {}
"endif
"" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


"" ########
"" MAPPINGS
"" ########

"" Map leader to ,
let mapleader=','

"" Open nerdtree with ,q and file in nerdtree with ,m
map <leader>q :NERDTreeToggle<CR> 
map <leader>m :NERDTreeFind<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
