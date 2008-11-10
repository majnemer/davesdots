" vimrc
" Main, Original author: Saleem Abdulrasool <compnerd@compnerd.org>
" Trivial modifications: David Majnemer
" vim: set ts=3 sw=3 et nowrap:

scriptencoding utf-8       " This file is in UTF-8

" ---- Terminal Setup ----
if (&term =~ "xterm") && (&termencoding == "")
   set termencoding=utf-8
endif

if (&term =~ "rxvt-unicode") && (&termencoding == "")
   set termencoding=utf-8
endif
" ---- General Setup ----
set nocompatible           " Don't emulate vi's limitations
set encoding=utf-8         " Default encoding should always be UTF-8
set tabstop=4              " 4 spaces for tabs
set shiftwidth=4           " 4 spaces for indents
set smarttab              " Tab next line based on current line
set expandtab             " Spaces for indentation
set autoindent            " Automatically indent next line
set smartindent           " Indent next line based on current line
set linebreak             " Display long lines wrapped at word boundaries
set incsearch              " Enable incremental searching
set hlsearch               " Highlight search matches
set ignorecase             " Ignore case when searching
set infercase              " Attempt to figure out the correct case
set showfulltag            " Show full tags when doing completion
set virtualedit=block      " Only allow virtual editing in block mode
set lazyredraw             " Lazy Redraw (faster macro execution)
set wildmenu               " Menu on completion please
set wildmode=longest,full  " Match the longest substring, complete with first
set wildignore=*.o,*~      " Ignore temp files in wildmenu
set scrolloff=3            " Show 3 lines of context during scrolls
set sidescrolloff=2        " Show 2 columns of context during scrolls
set backspace=2            " Normal backspace behavior
"set textwidth=80          " Break lines at 80 characters
set hidden                 " Allow flipping of buffers without saving
set noerrorbells           " Disable error bells
set visualbell             " Turn visual bell on
set t_vb=                  " Make the visual bell emit nothing

if has('autocmd')
   autocmd GuiEnter * set t_vb=  " Disable the visual bell in gvim
endif
" ---- Filetypes ----
if has('syntax')
   syntax on
endif

if has('osfiletype')
   filetype on                " Detect filetype by extension
   filetype indent on         " Enable indents based on extensions
   filetype plugin on         " Load filetype plugins
endif

" ---- Folding ----
if has('eval')
   fun! WideFold()
      if winwidth(0) > 90
         setlocal foldcolumn=1
      else
         setlocal foldcolumn=0
      endif
   endfun

   let g:detectindent_preferred_expandtab = 0
   let g:detectindent_preferred_indent = 4
endif

if has('autocmd')
   autocmd BufEnter * :call WideFold()
   autocmd BufReadPost * :DetectIndent
endif

" ---- Spelling ----
if (v:version >= 700)
   set spelllang=en_us        " US English Spelling please

   " Toggle spellchecking with F10
   nmap <silent> <F10> :silent set spell!<CR>
   imap <silent> <F10> <C-O>:silent set spell!<CR>
endif

" Always display a pretty statusline
set title
set laststatus=2
set shortmess=atI
set statusline=Editing:\ %r%t%m\ %=Location:\ Line\ %l/%L\ \ Col:\ %c\ (%p%%)

" Enable modelines only on secure vim
if (v:version == 603 && has("patch045")) || (v:version > 603)
   set modeline
else
   set nomodeline
endif

" Shamelessly stolen from Ciaran McCreesh <ciaranm@ciaranm.org>
if has('eval')
   fun! LoadColorScheme(schemes)
      let l:schemes = a:schemes . ":"

      while l:schemes != ""
         let l:scheme = strpart(l:schemes, 0, stridx(l:schemes, ":"))
         let l:schemes = strpart(l:schemes, stridx(l:schemes, ":") + 1)

         try
            exec "colorscheme" l:scheme
            break
         catch
         endtry
      endwhile
   endfun
endif

if has("gui_running")
   set background=light                                     " We use a light background here
   call LoadColorScheme("wombat:desert")                    " Set the colorscheme
elseif &t_Co == 256
   set background=light                                     " We use a light background here
   call LoadColorScheme("wombat:inkpot")                    " Set the colorscheme
elseif &t_Co == 88
   set background=dark                                      " We use a dark background here
   call LoadColorScheme("inkpot:zellner")                   " Set the colorscheme
else
   set background=dark                                      " We use a dark background here
   call LoadColorScheme("zellner")                          " Set the colorscheme
endif

" Show trailing whitespace visually
" Shamelessly stolen from Ciaran McCreesh <ciaranm@gentoo.org>
if (&termencoding == "utf-8") || has("gui_running")
   if v:version >= 700
      set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
   else
      set list listchars=tab:»·,trail:·,extends:…
   endif
else
   if v:version >= 700
      set list listchars=tab:>-,trail:.,extends:>,nbsp:_
   else
      set list listchars=tab:>-,trail:.,extends:>
   endif
endif

if has('mouse')
   " Dont copy the listchars when copying
   set mouse=nvi
endif

" Get rid of the annoying UI
if has("gui")
   set guioptions-=t       " Disable menu tear-offs
   set guioptions-=T       " Disable the toolbar
   set guioptions-=m       " Disable the menu
   set guioptions-=R       " Disable the (right) scrollbar
   set guioptions-=r       " Disable the (right) scrollbar
   set guioptions-=l       " Disable the (left) scrollbar
   set guioptions-=L       " Disable the (left) scrollbar
endif

if has('autocmd')
   " unhighlight search when idle
   autocmd CursorHold * nohls | redraw

   " always refresh syntax from the start
   autocmd BufEnter * syntax sync fromstart

   " subversion commit messages need not be backed up
   autocmd BufRead svn-commit.tmp :setlocal nobackup

   " mutt does not like UTF-8
   autocmd BufRead,BufNewFile *
      \ if &ft == 'mail' | set fileencoding=iso8859-1 | endif

   " fix up procmail rule detection
   autocmd BufRead procmailrc :setfiletype procmail
endif

" ---- cscope/ctags setup ----
if has('cscope') && filereadable('/usr/bin/cscope')
   " Search cscope and ctags, in that order
   set cscopetag
   set cscopetagorder=0

   set nocsverb
   if filereadable('cscope.out')
      cs add cscope.out
   endif
   set csverb
endif

" ---- Key Mappings ----

" improved lookup
if has('eval')
   fun! GoDefinition()
      let pos = getpos(".")
      normal! gd
      if getpos(".") == pos
         exe "tag " . expand("<cword>")
      endif
   endfun
endif

nmap <C-]> :call GoDefinition()<CR>

if has('autocmd')
   " Shortcuts
   fun! <SID>cabbrev()
      iab #i #include
      iab #I #include

      iab #d #define
      iab #D #define

      iab #e #endif
      iab #E #endif
   endfun

   autocmd FileType c,cpp :call <SID>cabbrev()

   " make tab reindent in normal mode
   autocmd FileType c,cpp,cs,java nmap <Tab> =0<CR>
endif

" tab indents selection
vmap <silent> <Tab> >gv

" shift-tab unindents
vmap <silent> <S-Tab> <gv

" Page using space
noremap <Space> <C-F>

" shifted arrows are stupid
inoremap <S-Up> <C-O>gk
noremap  <S-Up> gk
inoremap <S-Down> <C-O>gj
noremap  <S-Down> gj

" Y should yank to EOL
map Y y$

" vK is stupid
vmap K k

" W is annoying
nmap :W :w

" Q is annoying
nmap :Q :q

" WQ is annoying
nmap :WQ :wq

" Wq is annoying
nmap :Wq :wq

" just continue
map K K<cr>

" Toggle numbers with F12
nmap <silent> <F12> :silent set number!<CR>
imap <silent> <F12> <C-O>:silent set number!<CR>

" Don't force column 0 for #
inoremap # X<BS>#

" Python specific stuff
if has('eval')
   let python_highlight_all = 1
   let python_slow_sync = 1
endif
