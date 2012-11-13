if has("gui_running")
  if has("gui_win32")
    set guifont=Lucida_Sans_Typewriter:h10:cANSI
  else
    set guifont=Terminus:h16
    set noantialias
  endif

  set mouse=a                     "allow mouse in normal, visual and insert mode"
  set lines=65
  set columns=160
  set guioptions-=T " Start without the toolbar
  set guioptions-=m
  set guioptions-=b
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif

if has("gui_mac") || has("gui_macvim")
  macmenu File.New\ Window    key=<nop>
  macmenu Tools.Make    key=<nop>

" Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

" Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
endif
