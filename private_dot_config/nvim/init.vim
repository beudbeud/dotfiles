set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin(stdpath('data') . 'plugged')

" let Vundle manage Vundle, required
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'roxma/vim-paste-easy'
Plug 'raimondi/delimitmate'
Plug 'python-mode/python-mode'
Plug 'farmergreg/vim-lastplace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'christianrondeau/vim-base64'
Plug 'camspiers/lens.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim'

"Others Plugins
"Plug 'elzr/vim-json'
"Plug 'c9s/helper.vim'
"Plug 'c9s/treemenu.vim'
"Plug 'c9s/vikube.vim'
"Plug 'pearofducks/ansible-vim'
"Plug 'rodjek/vim-puppet'
"Plug 'tbastos/vim-lua'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

"Basic Configuration
syntax enable
set termguicolors
colorscheme dracula
set background=dark
autocmd VimEnter,Colorscheme * :hi Normal ctermbg=235
set hlsearch
set cursorline
set wildmenu
set number relativenumber
set ignorecase

" Basic mappings
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
command Nonumber set nonumber norelativenumber

" indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 4
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237

" Configuration NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeQuitOnOpen = 1

" Configuration NerdTree Git
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \  "Modified"  : "✹",
  \  "Staged"    : "✚",
  \  "Untracked" : "✭",
  \  "Renamed"   : "➜",
  \  "Unmerged"  : "═",
  \  "Deleted"   : "✖",
  \  "Dirty"     : "✗",
  \  "Clean"     : "✔︎",
  \  'Ignored'   : '☒',
  \  "Unknown"   : "?"
  \}

" Configuration Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 0
let g:syntastic_quiet_messages = { 'regex': [
	\ 'Unknown directive',
	\ 'No Pygments', 
	\] }
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_python_flake8_args="--ignore=E501,W601"
let g:pymode_lint_ignore=["E501"]

" Configuration Airline
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1

"" yaml
"autocmd BufNewFile,BufRead *.yml set filetype=yaml.ansible
"autocmd BufNewFile,BufRead *.yaml set filetype=yaml.ansible

" Ansible
"let g:ansible_attribute_highlight = 'ob'
"let g:ansible_name_highlight = 'b'

"" json
"au! BufRead,BufNewFile *.json set filetype=json
"augroup json_autocmd
"    autocmd!
"    autocmd FileType json set autoindent
"    autocmd FileType json set formatoptions=tcq2l
"    autocmd FileType json set textwidth=78 shiftwidth=2
"    autocmd FileType json set softtabstop=2 tabstop=8
"    autocmd FileType json set expandtab
"    autocmd FileType json set foldmethod=syntax
"augroup END

" Lens
let g:lens#disabled_filetypes = ['nerdtree']
let g:lens#animate = 0

" Show hidden trail
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
command Showtrails set list
command Hidetrails set listchars=
