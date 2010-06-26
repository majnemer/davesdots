
" Vim syntax file
" Language:		NOWEB
" Author:		Xun GONG <minus273@BonBon.net>, Dirk Baechle <dl9obn@darc.de>
" Date:			2008-01-26
" Version:		1.2
" Derived from: 	cweb.vim by Andreas Scherer

" History
"
" v1.2: Major revision, fixed bug with modern "tex.vim"
" v1.1: Corrected `current_syntax = "noweb"' to
"                 `current_syntax = "nw"'
"
" v1.0: Initial version

" NOWEB is a collection of tools for "Literate Programming". 
" Unlike WEB or CWEB it is not bound to a specific programming
" language like PASCAL or C.
" For more informations about NOWEB, the sources or binary distributions
" have a look at 
"
" http://www.eecs.harvard.edu/~nr/noweb
"

" For informations about "Literate Programming" in general
"
" http://www.literateprogramming.com
"
" could be a place to start.
"

" Remove any old syntax stuff hanging around
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


" Like in CWEB, a NOWEB source file is treated as a TeX file
" including code chunks in between.
if version < 600
  source <sfile>:p:h/tex.vim
else
  runtime! syntax/tex.vim
  unlet b:current_syntax
endif

syntax include @nowebIncludedC syntax/c.vim
unlet b:current_syntax
syntax include @nowebIncludedCpp syntax/cpp.vim
unlet b:current_syntax
syntax include @nowebIncludedOcaml syntax/ocaml.vim
unlet b:current_syntax
syntax include @nowebIncludedMakefile syntax/make.vim
unlet b:current_syntax
syntax include @nowebIncludedConf syntax/conf.vim
unlet b:current_syntax

" The reference to a chunk of code in another code chunk.
syntax match nowebCodeRef contained /<<.>>\|<<[^ ].*[^ ]>>/

" The code text within a code chunk.
syntax region nowebCodeBody contained start=/>>=.\|>>=$/lc=3 end=/^@ \|^@$/me=e-3 contains=nowebCodeRef

syn region  nowebTT     start="\[\["hs=s+2 end="\]\]"he=e-2 
syn region  nowebXX     start="|"hs=s+1 end="|"he=e-1 
syn region  nowebName   start="<<" end=">>" oneline contains=nowebTT

" NOWEB code chunks are defined by <<chunk_name>>=
" and ended by the next "@" (not a "@@"!) in the first column of a line.
syntax region nowebCode start=/<<.>>=\|<<[^ ].*[^ ]>>=/ end=/^@ \|^@$/me=e-3 contains=@nowebIncludedConf, nowebName containedin=tex.*Zone
syntax region nowebCode start=/<<[^ ].*\.c>>=/ end=/^@ \|^@$/me=e-3 contains=@nowebIncludedC, nowebName containedin=tex.*Zone
syntax region nowebCode start=/<<[^ ].*\.\(ml\|mli\)>>=/ end=/^@ \|^@$/me=e-3 contains=@nowebIncludedOcaml, nowebName containedin=tex.*Zone
syntax region nowebCode start=/<<[^ ].*\.\(cc\|cpp\|C\|h\)>>=/ end=/^@ \|^@$/me=e-3 contains=@nowebIncludedCpp, nowebName containedin=tex.*Zone
syntax region nowebCode start=/<<Makefile>>=/ end=/^@ \|^@$/me=e-3 contains=@nowebIncludedMakefile, nowebName containedin=tex.*Zone

" Here, we mark the beginning of a new text chunk.
" syntax match nowebStartText /<<.>>=\|<<[^ ].*[^ ]>>=/
syntax match nowebStartText /^@ \|^@$/

if !exists("did_noweb_syntax_inits")
  let did_noweb_syntax_inits = 1
  " The default methods for highlighting. Can be overridden later.
  hi link nowebCodeRef Type
  hi link nowebCodeBody Comment
  hi link nowebStartText Constant
  hi def link nowebTT     Constant
  hi def link nowebXX     Constant
  hi def link nowebName     Type
endif

let b:current_syntax = "noweb"

" vim: ts=8
