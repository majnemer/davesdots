if has('autocmd')
    autocmd GuiEnter * set t_vb=  " Disable the visual bell
endif

" Get rid of the annoying UI
set guioptions-=t       " Disable menu tear-offs
set guioptions-=T       " Disable the toolbar
set guioptions-=m       " Disable the menu
set guioptions-=R       " Disable the (right) scrollbar
set guioptions-=r       " Disable the (right) scrollbar
set guioptions-=l       " Disable the (left) scrollbar
set guioptions-=L       " Disable the (left) scrollbar
set guioptions-=a       " Share the copy buffer with visual mode

" gtk tabs are ugly
if has('gui_gtk')
    set guioptions-=e       " Kill off the GUI tabs
    set guifont=monospace\ 9
elseif has('gui_macvim')
    set guifont=menlo:h11
endif
