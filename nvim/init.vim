" NeoBundle Scripts-----------------------------
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
  set nocompatible               " Be iMproved
  set lazyredraw
  set ttyfast
endif

set synmaxcol=128
syntax sync minlines=256

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

let g:vim_bootstrap_langs = "elixir,elm,html,javascript,ruby"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

set rtp+=/usr/local/opt/fzf

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------
" THIS IS WHERE YOUR PLUGINS WILL COME
" ------------------------------------
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'fszymanski/fzf-quickfix'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'w0rp/ale'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'janko-m/vim-test'
NeoBundle 'ap/vim-buftabline'
NeoBundle 'lmeijvogel/vim-yaml-helper'
NeoBundle 'epilande/vim-es2015-snippets'
NeoBundle 'epilande/vim-react-snippets'
NeoBundle 'joaohkfaria/vim-jest-snippets'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'machakann/vim-swap'
NeoBundle 'aserebryakov/vim-todo-lists'


"" Color
NeoBundle 'tomasr/molokai'
NeoBundle 'arcticicestudio/nord-vim'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" elixir
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'mhinz/vim-mix-format'
" NeoBundle 'carlosgaldino/elixir-snippets'
" NeoBundle "c-brenn/phoenix.vim"
NeoBundle 'tpope/vim-projectionist' " must be after phoenix.vim plugin

" elm
"" Elm Bundle
NeoBundle 'elmcast/elm-vim'

" html
"" HTML Bundle
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'ap/vim-css-color'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/emmet-vim'

" javascript
"" Javascript Bundle
" NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'prettier/vim-prettier', { 'do': 'yarn install' }

" Typescript
NeoBundle 'HerringtonDarkholme/yats.vim'
NeoBundle 'peitalin/vim-jsx-typescript'
NeoBundle 'mhartington/nvim-typescript', {'build': './install.sh'}

" ruby
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'radenling/vim-dispatch-neovim'
NeoBundle 'ecomba/vim-ruby-refactoring'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
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

"" Map leader to ,
let mapleader=','

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

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

set splitbelow
set splitright

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set ruler
set number

set t_Co=256
" set termguicolors

let no_buffers_menu=1
colorscheme nord
" nord
let g:nord_comment_brightness = 15
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1

set mousemodel=popup
set gfn=Fira\ Code:h12

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '|'
  let g:indentLine_faster = 1
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Silver searcher
if executable('ag')
  " use ag for ack
  let g:ackprg = 'ag --vimgrep'
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap T :tag "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
nnoremap \ :Ack<SPACE>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Ctrl-p
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>ff :CtrlPMRUFiles<CR>

" Jump-to-definition for Typescript types
nnoremap <Leader>tj :TSDef "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <Leader>tr :TSRefs "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <Leader>tt :TSType "\b<C-R><C-W>\b"<CR>:cw<CR>

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Lightline
let g:lightline = {
\ 'colorscheme': 'nord',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" ALE
let g:ale_fixers = {
            \  'ruby': ['rubocop']
            \}
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
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

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeMinimalUI=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

map <leader>q :NERDTreeToggle<CR>
map <leader>m :NERDTreeFind<CR>

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>sh :terminal<CR>
else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

nmap ; :Buffers<CR>
nmap <Leader>fs :Files<CR>
nmap <Leader>r :Tags<CR>

let g:fzf_buffers_jump = 1

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

"" Close buffer
noremap <leader>d :bd!<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Delete mappings without overriding unnamed buffer
nnoremap s "_d
nnoremap ss "_dd
nnoremap S "_D

"*****************************************************************************
"" Custom configs
"*****************************************************************************
"
" elixir
let g:mix_format_on_save = 0
let g:mix_format_silent_errors = 1
let g:mix_format_elixir_bin_path = '/Users/kaareltinn/.asdf/installs/elixir/1.6/bin'
let g:ale_elixir_elixir_ls_release = '/Users/kaareltinn/Projects/elixir-ls'

" elm
" elm-vim
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

" vim-polyglot
let g:polyglot_disabled = ['elm']

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1

" prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#exec_cmd_path = "/usr/locale/bin/prettier"

" print semicolons
let g:prettier#config#semi = 'false'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'
" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd BufNewFile,BufRead *.xlsx.axlsx set filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" vim-test mappings
map <Leader>t :TestFile<CR>
map <Leader>s :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>

" Dispatch and Zeus
" let g:rspec_command = "rspec {spec}"
"
" run test in split window
let test#strategy = "dispatch"

" Ruby refactory
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>

" <Ctrl-c> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-c> :nohl<CR><C-l>

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"*****************************************************************************
"" Terminal emulator
"*****************************************************************************
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  " Moving between terminal and regular windows
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  nnoremap <Leader>tv :vsplit \| terminal<CR>
  nnoremap <Leader>th :split \| terminal<CR>

  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

""***************************************************************************

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Move between alternate file
map <Leader>aa :A<CR>
map <Leader>av :AV<CR>

autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'lib/*.ex': {
\      'alternate': 'test/{}_test.exs'
\    },
\    'test/*_test.exs': {
\      'alternate': 'lib/{}.ex'
\    },
\    'app/*.ts': {
\      'alternate': 'app/{}.test.js'
\    },
\    'app/*.test.js': {
\      'alternate': 'app/{}.ts'
\    },
\    'app/*.js': {
\      'alternate': 'app/{}.test.js'
\    },
\    'app/*.test.jsx': {
\      'alternate': 'app/{}.tsx'
\    },
\    'app/*.tsx': {
\      'alternate': 'app/{}.test.jsx'
\    },
\    'app/*.jsx': {
\      'alternate': 'app/{}.test.jsx'
\    },
\ })

let g:user_emmet_settings = {
\  'javascript.jsx' : {
	\      'extends' : 'jsx',
	\  },
\  'javascript.js' : {
	\			 'extends' : 'js',
	\	 },
\  'javascript.tsx' : {
	\			 'extends' : 'tsx',
	\	 },
\}
