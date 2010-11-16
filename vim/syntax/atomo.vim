" Remove any old syntax stuff hanging around
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

" Reserved symbols--cannot be overloaded.
syn match atomoDelimiter  "(\|)\|\[\|\]\|,\|;\|_\|{\|}"

" Strings and constants
syn match   atomoSpecialChar	contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn match   atomoSpecialChar	contained "\\\(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|RS\|US\|SP\|DEL\)"
syn match   atomoSpecialCharError	contained "\\&\|'''\+"
syn region  atomoString		start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=atomoSpecialChar
syn match   atomoCharacter		"[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=atomoSpecialChar,atomoSpecialCharError
syn match   atomoCharacter		"^'\([^\\]\|\\[^']\+\|\\'\)'" contains=atomoSpecialChar,atomoSpecialCharError
syn match   atomoNumber		"\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match   atomoFloat		"\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"

syn match atomoSpecialIdent      "[A-Z][a-zA-Z0-9~!@#$%^&*\-_=+./\\|<>\?]*"
syn match atomoIdentifier        "[a-zA-Z!#$%^&*\-_=+./\\|<>\?][a-zA-Z0-9~!@#$%^&*\-_=+./\\|<>\?]*"
syn match atomoKeyword	         "[a-zA-Z0-9~!@#$%^&*\-_=+./\\|<>\?]*:"

syn match atomoBoolean          "\<\(True\|False\)\>"
syn match atomoConditional		"\<\(if\|then\|else\)\>"
syn match atomoSpecial	        "\<\(this\|self\|macro\|for-macro\|operator\)\>"

" Operators, optionally with a : prefix (for :=)
syn match atomoOperator ":\=[~!@#$%^&\*\-=\+./\\|<>\?]\+\( \|$\)"

syn match atomoParticle	       "@\([a-zA-Z:~!@#$%^&*\-_=+./\\|<>\?]\+\)"
syn region atomoParticle	       start=+@(+ end=+)+ contains=atomoString,atomoCharacter,atomoNumber,atomoFloat,atomoKeyword,atomoSpecialIdent,atomoOperator,atomoQuote,atomoIdentifier

syn match atomoUnquote	       "\~\([a-zA-Z:~!@#$%^&*\-_=+./\\|<>\?]\+\)"
syn region atomoUnquote	       start=+\~(+ end=+)+ contains=atomoString,atomoCharacter,atomoNumber,atomoFloat,atomoKeyword,atomoSpecialIdent,atomoOperator,atomoIdentifier

syn match atomoQuote	       "`\([a-zA-Z:~!@#$%^&*\-_=+./\\|<>\?]\+\)"
syn region atomoQuote	       start=+`(+ end=+)+ contains=atomoString,atomoCharacter,atomoNumber,atomoFloat,atomoKeyword,atomoSpecialIdent,atomoOperator,atomoUnquote,atomoIdentifier

" Comments
syn match   atomoLineComment      "---*\s\?\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
syn region  atomoBlockComment     start="{-"  end="-}" contains=atomoBlockComment

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_atomo_syntax_inits")
  if version < 508
    let did_atomo_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink atomoBlockComment		  atomoComment
  HiLink atomoLineComment			  atomoComment
  HiLink atomoComment			  Comment
  HiLink atomoSpecial			  PreProc
  HiLink atomoConditional			  Conditional
  HiLink atomoSpecialChar			  SpecialChar
  HiLink atomoOperator			  Operator
  HiLink atomoSpecialCharError		  Error
  HiLink atomoString			  String
  HiLink atomoCharacter			  Character
  HiLink atomoNumber			  Number
  HiLink atomoFloat			  Float
  HiLink atomoConditional			  Conditional
  HiLink atomoBoolean             Boolean

  delcommand HiLink
endif

let b:current_syntax = "atomo"
