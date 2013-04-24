" _ __ | |_   _  __ _(_)_ __  ___
"| '_ \| | | | |/ _` | | '_ \/ __|
"| |_) | | |_| | (_| | | | | \__ \
"| .__/|_|\__,_|\__, |_|_| |_|___/
"|_|            |___/
" Vundle managed
" :BundleInstall! to install(!update) bundles
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'http'
call vundle#rc()
Bundle 'gmarik/vundle'

"
Bundle 'AutoTag'
Bundle 'CSApprox'
" Bundle 'MultipleSearch2.vim'
Bundle 'Rename'
Bundle 'grep.vim'
Bundle 'scratch.vim'
Bundle 'surround.vim'

" UI Additions
Bundle 'Lokaltog/vim-powerline'

Bundle 'nanotech/jellybeans.vim'
Bundle 'altercation/vim-colors-solarized'

Bundle 'kien/ctrlp.vim'

" Tagbar
Bundle 'Tagbar'
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1

" git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" NERDTree
Bundle 'scrooloose/nerdtree'
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=0

" idutils
" Bundle 'milkbikis/IDSearch.vim'

" tComment
" Command-/ to toggle comments
Bundle "tComment"

" Ack
Bundle "ack.vim"

" automatic helper
" Bundle 'scrooloose/syntastic'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

" commands
" Bundle 'godlygeek/tabular'

Bundle "sjl/gundo.vim"

" language
Bundle 'VimClojure'
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#DynamicHighlighting = 1
let g:vimclojure#ParenRainbow = 0
let g:vimclojure#WantNailgun = 0

Bundle 'JSON.vim'
Bundle 'syntaxhaskell.vim'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'lbalamut/vim-puppet'
" erlang
" Bundle 'oscarh/vimerl'

" Bundle 'confluencewiki.vim'

" Makes css colors show up as their actual colors, works better with CSApprox
" or macvim
Bundle 'ap/vim-css-color'

Bundle 'ingydotnet/yaml-vim'

" custom functions
source ~/.vim/functions.vim

"scala
"lushtags
"golang
"haskell

filetype plugin indent on     " required by vundle!
syntax on
"                                 _
"  __ _  ___ _ __   ___ _ __ __ _| |
" / _` |/ _ \ '_ \ / _ \ '__/ _` | |
"| (_| |  __/ | | |  __/ | | (_| | |
" \__, |\___|_| |_|\___|_|  \__,_|_|
" |___/
"
set linebreak                           "use line break in case of wrapping
set nowrap                              "don't wrap long lines
set nocompatible                        "don't mimic vi
set backspace=indent,eol,start
set history=500                         "command history buffer
set autoindent
set ruler                               "show line and column of cursor position
set incsearch                           "start search while typing
set hlsearch                            "mark search results
set ignorecase                          "search ignore case
set fdm=indent                          "fold method
set fdc=2                               "fold column width showing fold marks
set nofoldenable                        "turn folding off (toggle with zi)
set nostartofline                       "keep cursor in the same column when changing lines
set expandtab                           "replace tabs with spaces
set tags=tags;/
set hidden                              "enable buffers without disk access
set wildmenu                            "use bash like tab completion for files
set wildmode=longest,list               "at command line, complete longest common string, then list alternatives.
set smartcase                           "unless the first character is uppercase
set scrolloff=3                         "context around moving cursor
set laststatus=2                        "always show the status line
"set textwidth=80                       "maximum line length

set autowrite                           "writes on make/shell commands
set autoread

set encoding=utf-8

" default tab settings
set tabstop=4                           " Set the default tabstop
set softtabstop=4
set shiftwidth=4                        " Set the default shift width for indents
set expandtab                           " Make tabs into spaces (set by tabstop)
set smarttab                            " Smarter tab levels

" backups
set undodir=~/.vim/tmp/undo//           " undo files
set backupdir=~/.vim/tmp/backup//       " backups
set directory=~/.vim/tmp/swap//         " swap files
set backup
set noswapfile
set undofile                            " Set undo

set nospell                             " Spell checking on
nnoremap ; :

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"       _                 _
"__   _(_)___ _   _  __ _| |
"\ \ / / / __| | | |/ _` | |
" \ V /| \__ \ |_| | (_| | |
"  \_/ |_|___/\__,_|\__,_|_|
"
" set t_Co=256                            "force 256 colours (for CSApprox)
set number                              "show line numbers
set showmatch                           "Show matching brackets.
set matchtime=5                         "Bracket blinking.
set novisualbell                        "No blinking
set noerrorbells                        "No noise.
set laststatus=2                        "Always show status line.
set vb t_vb=                            "disable any beeps or flashes on error
set ruler                               "Show ruler
set showcmd                             "Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI                       "Shortens messages

set title                               "set the title of the window in the terminal to the file
set noshowmode                          "do not show vim mode (we use Powerline for this)
set nolist                              "display unprintable characters f12 - switches
set listchars=tab:▸\ ,eol:¬,trail:·,extends:»,precedes:« " Unprintable chars mapping
set showbreak=↪

"set guitabtooltip=%F                    "Set up tab tooltips with every buffer name

colorscheme jellybeans
" _     _           _ _
"| |__ (_)_ __   __| (_)_ __   __ _ ___
"| '_ \| | '_ \ / _` | | '_ \ / _` / __|
"| |_) | | | | | (_| | | | | | (_| \__ \
"|_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
"                             |___/
let mapleader = ","
let maplocalleader = ","

autocmd BufWrite * :call Cleanup()
"autocmd Syntax * syn match ErrorMsg /\s\+$/
" Highlight current line in input mode
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul

" Switch buffers with Shift-Right and Shift-Left
nnoremap <S-Right> :bnext<CR>
nnoremap <S-Left>  :bprevious<CR>
nnoremap <S-D-Right> gt
nnoremap <S-D-Left> gT

" <leader>g = :tjump
" <leader>x exit ctags stack
map <D-b>  g<C-]>
map <M-D-Left>  <C-t>
map <leader>x <C-o>

" Completion
set completeopt=longest,menuone
imap <C-Space> <C-p>
imap <C-S-Space> <C-n>

" Recursive grep
nnoremap <silent> <F4> :Rgrep<CR>

" Window management
let macvim_skip_cmd_opt_movement = 1
map <M-Right> <C-w>>
map <M-Left>  <C-w><
map <M-Down>  <C-w>+
map <M-Up>    <C-w>-

" Command-Option-ArrowKey to switch viewports
map <D-M-Up> <C-w>k
imap <D-M-Up> <Esc> <C-w>k
map <D-M-Down> <C-w>j
imap <D-M-Down> <Esc> <C-w>j
map <D-M-Right> <C-w>l
imap <D-M-Right> <Esc> <C-w>l
map <D-M-Left> <C-w>h
imap <D-M-Left> <C-w>h

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" Map cut, copy and paste to standard
" shortcuts  in visual mode
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+gP

" Hex conversion
nmap <silent> <leader>hex :%!xxd<CR>
nmap <silent> <leader>txt :%!xxd -r<CR>

" MultiSearch current word under cursor
map <leader>h :execute 'Search ' . expand("<cword>")<CR>
let g:MultipleSearchMaxColors = 64

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" Highlight lines longer than textwidth
nnoremap <silent> <Leader>L
            \ :if exists('w:long_line_match') <Bar>
            \   silent! call matchdelete(w:long_line_match) <Bar>
            \   unlet w:long_line_match <Bar>
            \ elseif &textwidth > 0 <Bar>
            \   let w:long_line_match = matchadd('Visual', '\%>'.&tw.'v.\+', -1) <Bar>
            \ else <Bar>
            \   let w:long_line_match = matchadd('Visual', '\%>80v.\+', -1) <Bar>
            \ endif<CR>

" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>

" Duplication
vnoremap <D-d> Yp
nnoremap <D-d> Yp
inoremap <D-d> <Esc>Ypi

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Quick edits
nnoremap <silent><leader>ev :edit $MYVIMRC<cr>
nnoremap <silent><leader>sv :source $MYVIMRC<cr>
nnoremap <silent><leader>es :edit ~/.ssh/config<cr>
nnoremap <silent><leader>eg :edit ~/.gitconfig<cr>
nnoremap <silent><leader>eb :edit ~/.bashrc<cr>

" Always write when focus is lost
autocmd FocusLost * silent! wa

" ctrlp
map <D-e> :CtrlPBuffer<CR>
imap <D-e> <Esc>:CtrlPBuffer<CR>
let g:ctrlp_map = '<D-n>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" tagbar
nnoremap <silent> <D-F12> :TagbarToggle<CR>

" Start in insert mode for commit
function! BufEnterCommit()
  normal gg0
  if getline('.') == ''
    start
  end
endfunction

autocmd BufEnter    *.git/COMMIT_EDITMSG             exe BufEnterCommit()
autocmd BufReadPost fugitive://* set bufhidden=delete           " Automatically remove fugitive buffers
map <D-k> :Gstatus<CR>
imap <D-k> <Esc>:Gstatus<CR>

map <D-1> :execute 'NERDTreeToggle ' . getcwd()<CR>
imap <D-1> <Esc>:execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

nmap <D-/> :TComment<CR>j
imap <D-/> <Esc>:TComment<CR>ji
vmap <D-/> :TComment<CR>

noremap <S-C-F> "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

"  ~/.vim/functions.vim
map <leader>s :call ToggleScratch()<CR>
map <leader>c :call Cleanup()<CR>
map <silent> <F5> :call UpdateIndexes()<CR>

" map <leader>w :call g:IDSearchCurrentWord()<CR>
" map <leader>i :call g:IDSearchCustom()<CR>

nnoremap <D-2> :GundoToggle<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

"  __ _ _        _
" / _(_) | ___  | |_ _   _ _ __   ___  ___
"| |_| | |/ _ \ | __| | | | '_ \ / _ \/ __|
"|  _| | |  __/ | |_| |_| | |_) |  __/\__ \
"|_| |_|_|\___|  \__|\__, | .__/ \___||___/
"                    |___/|_|
autocmd FileType text setlocal textwidth=80

" Scala
autocmd FileType scala setlocal tabstop=4
autocmd FileType scala setlocal shiftwidth=4

" Java
autocmd FileType java setlocal tabstop=4
autocmd FileType java setlocal shiftwidth=4

autocmd BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=pandoc
autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

" Clojure
autocmd BufEnter,BufNewFile *.clj setfiletype clojure
autocmd BufEnter,BufNewFile *.clj setl lisp

" Protocol
autocmd BufEnter,BufNewFile *.proto setfiletype proto

" JSON
autocmd BufRead,BufNewFile *.json set filetype=json foldmethod=syntax

" Haskell
autocmd BufEnter *.hs compiler ghc
let g:haddock_browser = "firefox"
let g:haddock_docdir="~/.cabal/share/doc/"
let g:haddock_indexfiledir="~/.vim/bundle/haskell"
let g:hs_highlight_boolean = 1
let g:hs_highlight_types = 1
let g:hs_highlight_debug = 1
let g:hs_allow_hash_operator = 1
let g:hs_highlight_delimiters = 1

" Ion
autocmd BufEnter,BufNewFile *.ion setfiletype ion
autocmd BufEnter,BufNewFile *.ion setl lisp

" puppet
autocmd FileType puppet setlocal tabstop=4
autocmd FileType puppet setlocal shiftwidth=4
