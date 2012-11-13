" _ __ | |_   _  __ _(_)_ __  ___
"| '_ \| | | | |/ _` | | '_ \/ __|
"| |_) | | |_| | (_| | | | | \__ \
"| .__/|_|\__,_|\__, |_|_| |_|___/
"|_|            |___/
" Vundle managed
" :BundleInstall to install bundles
" :BundleUpdate to update all
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"
Bundle 'AutoTag'
Bundle 'CSApprox'
Bundle 'MultipleSearch2.vim'
Bundle 'Rename'
Bundle 'oscarh/vimerl'
Bundle 'confluencewiki.vim'
Bundle 'grep.vim'
Bundle 'scratch.vim'
Bundle 'surround.vim'

" UI Additions
Bundle 'Lokaltog/vim-powerline'
if has('gui_running') && (!has('win64') || !has('win32'))
  let g:Powerline_symbols='unicode'
endif
let g:Powerline_stl_path_style = 'short'
call Pl#Theme#RemoveSegment('fugitive:branch')
call Pl#Theme#RemoveSegment('fileformat')
call Pl#Theme#RemoveSegment('fileencoding')
call Pl#Theme#RemoveSegment('scrollpercent')

Bundle 'nanotech/jellybeans.vim'

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
nmap <D-e> :FufBuffer<CR>
nmap <D-n> :FufTaggedFile<CR>

" Tagbar
Bundle 'Tagbar'
nnoremap <silent> <D-F12> :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1

" git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" Start in insert mode for commit
function! BufEnterCommit()
  normal gg0
  if getline('.') == ''
    start
  end
endfunction
autocmd BufEnter    *.git/COMMIT_EDITMSG             exe BufEnterCommit()

autocmd BufReadPost fugitive://* set bufhidden=delete           " Automatically remove fugitive buffers


" NERDTree
Bundle 'scrooloose/nerdtree'
map <D-1> :execute 'NERDTreeToggle ' . getcwd()<CR>
imap <D-1> <Esc>:execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let g:NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let g:NERDTreeMinimalUI=1


" idutils
Bundle 'milkbikis/IDSearch.vim'
map <leader>w :call g:IDSearchCurrentWord()<CR>
map <leader>i :call g:IDSearchCustom()<CR>

" tComment
" Command-/ to toggle comments
Bundle "tComment"
nmap <D-/> :TComment<CR>j
imap <D-/> <Esc>:TComment<CR>ji
vmap <D-/> :TComment<CR>

" Ack
Bundle "ack.vim"
noremap <S-C-F> "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" automatic helper
Bundle 'scrooloose/syntastic'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

" commands
Bundle 'godlygeek/tabular'

" language
Bundle 'VimClojure'
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#DynamicHighlighting = 1
let g:vimclojure#ParenRainbow = 0
let g:vimclojure#WantNailgun = 0

Bundle 'JSON.vim'
Bundle 'syntaxhaskell.vim'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'hallison/vim-markdown'
Bundle 'rodjek/vim-puppet'

" Makes css colors show up as their actual colors, works better with CSApprox
" or macvim
Bundle 'ap/vim-css-color'


" custom functions
source ~/.vim/functions.vim

map <leader>s :call ToggleScratch()<CR>
map <leader>c :call Cleanup()<CR>
map <silent> <F5> :call UpdateIndexes()<CR>

"scala
"lushtags
"golang
"haskell

filetype plugin indent on     " required by vundle!
syntax on

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
set showcmd                             "show command
set incsearch                           "start search while typing
set hlsearch                            "mark search results
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
set timeoutlen=250                      "time to wait after ESC (default causes an annoying delay)

set encoding=utf-8

let mapleader = ","
let maplocalleader = ","

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

set spell " Spell checking on

"__   _(_)___ _   _  __ _| |
"\ \ / / / __| | | |/ _` | |
" \ V /| \__ \ |_| | (_| | |
"  \_/ |_|___/\__,_|\__,_|_|
"
set t_Co=256                            "force 256 colours (for CSApprox)
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

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END


set guitabtooltip=%F                    "Set up tab tooltips with every buffer name

colorscheme jellybeans

" _     _           _ _
"| |__ (_)_ __   __| (_)_ __   __ _ ___
"| '_ \| | '_ \ / _` | | '_ \ / _` / __|
"| |_) | | | | | (_| | | | | | (_| \__ \
"|_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
"                             |___/

autocmd FileType text setlocal textwidth=80
autocmd BufWrite * :call Cleanup()
autocmd Syntax * syn match ErrorMsg /\s\+$/
" Highlight current line in input mode
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

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
set completeopt=menu
imap <C-Space> <C-p>
imap <C-S-Space> <C-n>

" Recursive grep
nnoremap <silent> <F4> :Rgrep<CR>

" Window management
nnoremap <M-Right> <C-W>>
nnoremap <M-Left>  <C-W><
nnoremap <M-Down>  <C-W>+
nnoremap <M-Up>    <C-W>-

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


" / _(_) | ___  | |_ _   _ _ __   ___  ___
"| |_| | |/ _ \ | __| | | | '_ \ / _ \/ __|
"|  _| | |  __/ | |_| |_| | |_) |  __/\__ \
"|_| |_|_|\___|  \__|\__, | .__/ \___||___/
"                    |___/|_|
" Scala settings
au FileType scala setlocal tabstop=4
au FileType scala setlocal shiftwidth=4

" Java settings
au FileType java setlocal tabstop=4
au FileType java setlocal shiftwidth=4

au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=pandoc
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

" Clojure Settings
au BufEnter,BufNewFile *.clj setfiletype clojure
au BufEnter,BufNewFile *.clj setl lisp

" Protocol buffers
au BufEnter,BufNewFile *.proto setfiletype proto

" JSON
au BufRead,BufNewFile *.json set filetype=json foldmethod=syntax

" Haskell Settings
au BufEnter *.hs compiler ghc
let g:haddock_browser = "firefox"
let g:haddock_docdir="~/.cabal/share/doc/"
let g:haddock_indexfiledir="~/.vim/bundle/haskell"
let g:hs_highlight_boolean = 1
let g:hs_highlight_types = 1
let g:hs_highlight_debug = 1
let g:hs_allow_hash_operator = 1
let g:hs_highlight_delimiters = 1

" Ion Settings
au BufEnter,BufNewFile *.ion setfiletype ion
au BufEnter,BufNewFile *.ion setl lisp


" Markdown
augroup ft_markdown
    autocmd!
    " Use <localLeader>1/2/3/4/5/6 to add headings
    autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>
    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
    autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>
    " Use <localLeader>e1/2/3 to add emphasis symbols
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
    " Use <Leader>P to preview markdown file in browser
    autocmd Filetype markdown nnoremap <buffer> <Leader>P :MarkdownPreview<CR>
augroup END

