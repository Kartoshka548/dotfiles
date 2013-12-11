" set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
" filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
" set t_Co=256              " enable 256-color mode.
" syntax enable             " enable syntax highlighting (previously syntax on).
" colorscheme desert        " set colorscheme
" set number                " show line numbers
" set laststatus=2          " last window always has a statusline
" filetype indent on        " activates indenting for files
" set nohlsearch            " Don't continue to highlight searched phrases.
" set incsearch             " But do highlight as you type your search.
" set ignorecase            " Make searches case-insensitive.
" set ruler                 " Always show info along bottom.
" set autoindent            " auto-indent
" set tabstop=4             " tab spacing
" set softtabstop=4         " unify
" set shiftwidth=4          " indent/outdent by 4 columns
" set shiftround            " always indent/outdent to the nearest tabstop
" set expandtab             " use spaces instead of tabs
" set smarttab              " use tabs at the start of a line, spaces elsewhere
" set nowrap                " don't wrap text
"

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" ########################## KARTOMODE ####################

" set invisible characters to display
set listchars=tab:>-,trail:·,nbsp:·,extends:>,precedes:<
" highlight word under cursor - so navigation inside code more clear
" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" display the listchars

set list

" Pathogen load
filetype off

"  complete tags on tying
let g:neocomplcache_enable_at_startup = 1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"a"utocmd FileType python setlocal omnifunc=jedi#complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


"call pathogen#infect()
"call pathogen#helptags()

filetype plugin indent on
syntax on

set tabstop=4
set shiftwidth=4
set smarttab
set et
set wrap
set ai
set cin
set showmatch 
"set hlsearch
set incsearch
set ignorecase
set lz

nmap <F8> :TagbarToggle<CR>


" STATUSLINE
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256


noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

autocmd FocusLost * :set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd CursorMoved * :set relativenumber

" ctags configurations
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" set line numbers
set number

" load and save markers
au BufWinLeave * mkview
au BufWinEnter * silent loadview
"
" color codeschool
" set guifont=Monaco:h12
" :set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands
" ########################## KARTOMODE END ####################

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
