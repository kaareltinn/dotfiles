-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd([[
"" +------------- PLUGINS ---------------+
call plug#begin(stdpath('data') . '/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-projectionist' " must be after phoenix.vim plugin
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ryanoasis/vim-devicons'
Plug 'Exafunction/codeium.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" HTML
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Ruby
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

" PureScript
Plug 'purescript-contrib/purescript-vim'

" Solidity
Plug 'tomlion/vim-solidity'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:python_host_porog = '/usr/bin/python2'
let g:python3_host_prog = '/Users/kaareltinn/.asdf/shims/python3'

" Coc
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-elixir',
  \ 'coc-lists',
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" ALE for linting
let g:ale_fixers = {
            \  'ruby': ['rubocop']
            \}
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" Lightline

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'app/*.rb': {
\      'alternate': 'spec/{}_spec.rb'
\    },
\    'spec/*_spec.rb': {
\      'alternate': ['app/{}.rb', 'app/components/{}.rb']
\    },
\    'app/components/*.rb': {
\      'alternate': 'spec/{dirname}/{basename}_spec.rb'
\    },
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
"" +------------- GENERAL ---------------+
filetype plugin indent on

"" Map leader to ,
let mapleader=','

" Perf improvements
set nocompatible               " Be iMproved
set lazyredraw
set ttyfast
set synmaxcol=128
syntax sync minlines=256

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

"" Split below/right, not top/left
set splitbelow
set splitright

syntax enable
set ruler
set number

set t_Co=256

" IndentLine
" let g:indentLine_enabled = 1
" let g:indentLine_concealcursor = 0
" let g:indentLine_char = '|'
" let g:indentLine_faster = 1

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" COLOR SCHEME
colorscheme nord
" nord
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1

set gfn=Fira\ Code:h12

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" +------------- KEYS ---------------+

" Replace without overriding contents of current
xnoremap <leader>p "_dP

" bind K to grep word under cursor
nnoremap K :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>
" nnoremap K <cmd>Telescope live_grep<C-R><C-W><CR>
nnoremap T :tag "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" " fzf
" nnoremap <Leader>b :Buffers<CR>
" nmap <Leader>fs :Files<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>fs <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :G write<CR>
noremap <Leader>gc :G commit<CR>
noremap <Leader>gsh :G push<CR>
noremap <Leader>gll :G pull<CR>
noremap <Leader>gs :G status<CR>
noremap <Leader>gb :G blame<CR>
noremap <Leader>gd :G diff<CR>
noremap <Leader>gr :G remove<CR>
"" Open current line on GitHub
nnoremap <Leader>o :GBrowse<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

"" Close buffer
noremap <leader>d :bd!<CR>

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

" vim-test mappings
map <Leader>t :TestFile<CR>
map <Leader>s :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>
"
" run test in split window
let test#strategy = "neovim"
let test#neovim#term_position = "20"

let test#ruby#rspec#executable = 'bundle exec rspec'

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

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  " In vim-test 'neovim' strategy press Ctrl-o to go to normal mode and scroll
  tmap <C-o> <C-\><C-n>

  " Moving between terminal and regular windows
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  nnoremap <Leader>tv :vsplit \| terminal<CR>
  nnoremap <Leader>th :split \| terminal<CR>

  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Resize windows
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Move between alternate file
map <Leader>aa :A<CR>
map <Leader>av :AV<CR>

" Coc
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>f :<C-u>CocList mru<cr>

nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

" Navigate through code actions using <C-n> and <C-p>
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

" github/copilot.vim
" imap <silent> <C-n> <Plug>(copilot-next)
imap <silent> <C-n> <Cmd>call codeium#CycleCompletions(1)<CR>

" " Enable CursorLine
" set cursorline

" " Default Colors for CursorLine
" highlight  CursorLine ctermbg=None ctermfg=None

" " Change Color when entering Insert Mode
" autocmd InsertEnter * highlight  CursorLine ctermbg=DarkGrey ctermfg=None

" " Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None
"" +------------- LANGUAGES ---------------+
" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" set Elixir filetypes
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" YML filetype
au! BufNewFile,BufRead *.yaml.envsubst set filetype=yaml
au! BufNewFile,BufRead *.yml.envsubst set filetype=yaml

" For coc-settings.json
autocmd FileType json syntax match Comment +\/\/.\+$+

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd BufNewFile,BufRead *.xlsx.axlsx set filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" vim-mix-format
let g:mix_format_on_save = 1
]])
-- Lazy.vim (package manager) setup setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function map(kind, mapping, command, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(kind, mapping, command, options)
end

-- Set mapleader to ","
vim.g.mapleader = ","

-- nvim-tree
local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  map('', '<leader>q', ':NvimTreeToggle<CR>')
  map('', '<leader>m', ':NvimTreeFindFile<CR>')
end

-- Plugins spec
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        on_attach = nvim_tree_on_attach
      }
    end,
  },
})
