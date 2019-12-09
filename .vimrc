" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'

" Autoindenting in Python
Plugin 'vim-scripts/indentpython.vim'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Syntax Checking/Highlighting
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()
" cd ~/.vim/bundle && \
" git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
colorscheme elflord

" File Browsing 
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Super Searching
Plugin 'kien/ctrlp.vim'

" Git Integration
Plugin 'tpope/vim-fugitive'

" Status Bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Golang formatting
Plugin 'fatih/vim-go'

" TypeScript formatting
Plugin 'leafgarland/typescript-vim'

" Kotlin formatting
Plugin 'udalov/kotlin-vim'

" Solidity formatting
Plugin 'tomlion/vim-solidity'

" JSX formatting
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Vdebug
Plugin 'vim-vdebug/vdebug'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ================ General Config ====================
"
set splitbelow
set splitright
"
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
" Enable folding
set foldmethod=indent
set foldlevel=99
"
" Enable folding with the spacebar
nnoremap <space> za
"
" 4 space indentation
au BufNewFile,BufRead *.py,*.php,*.go,*.cpp,*.c,*ts,*kt set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" For Full Stack Development
au BufNewFile,BufRead *.js,*.json,*.html,*.css,*.twig,*.rb,*.sol set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UTF-8
set encoding=utf-8

" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python Syntax checker
let g:syntastic_python_checkers=['flake8']

" PHP Syntax checker
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--standard=psr2'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

" Javascript Syntax checker
let g:syntastic_javascript_checkers = ['eslint']

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Switching between light and dark themes
call togglebg#map("<F5>")

" See docstring for folded code
let g:SimpylFold_docstring_preview=1

" Make code look pretty
let python_highlight_all=1
syntax on "turn on syntax highlighting
set hlsearch

" Open/Close NERDTree
map <C-n> :NERDTreeToggle<CR>

" Ignore *.pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']

" Line numbering
set nu


set history=1000    "Store lots of :cmdLine history

" ================ Search Settings  =================
"
set incsearch   "Find the next match as we type the search

" ================ Line Wrap Settings  =================
"
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Scrolling ========================
"
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Indenting ========================
"
set autoindent         "Enable auto indent

" ================ Completion =======================
"
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

" ================ Virtual Settings  =================
"
set virtualedit=all

" ================ Map Settings  =================
"
nnoremap <F2> :set nu!<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F4> :set autoindent!<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <F12> :syntax sync fromstart<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
