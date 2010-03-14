" This scheme was created by CSApproxSnapshot
" on Wed, 25 Nov 2009

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || &term =~? "^konsole"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=230 gui=NONE guibg=#1a1a1a guifg=#fffedc
    CSAHi cNumbersCom term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cNumbers term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=234 ctermfg=230 gui=underline guibg=#1a1a1a guifg=#fffedc
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Error term=reverse cterm=NONE ctermbg=95 ctermfg=231 gui=NONE guibg=#602020 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=234 ctermfg=145 gui=bold,italic guibg=#1a1a1a guifg=#8a9597
    CSAHi String term=NONE cterm=NONE ctermbg=234 ctermfg=144 gui=NONE guibg=#1a1a1a guifg=#a2a96f
    CSAHi Function term=NONE cterm=NONE ctermbg=234 ctermfg=145 gui=NONE guibg=#1a1a1a guifg=#a999ac
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=234 ctermfg=236 gui=NONE guibg=#1a1a1a guifg=#303030
    CSAHi NonText term=bold cterm=bold ctermbg=236 ctermfg=102 gui=bold guibg=#303030 guifg=#605958
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#dad085
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=184 ctermfg=100 gui=bold guibg=#c0c000 guifg=#606000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#34383c guifg=#64686c
    CSAHi cppMinMax term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=underline ctermbg=236 ctermfg=102 gui=underline guibg=#303030 guifg=#605958
    CSAHi PmenuSel term=NONE cterm=underline ctermbg=238 ctermfg=145 gui=underline guibg=#404040 guifg=#a09998
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=234 ctermfg=145 gui=underline guibg=#202020 guifg=#a09998
    CSAHi TabLineSel term=bold cterm=underline ctermbg=60 ctermfg=145 gui=underline guibg=#404850 guifg=#a09998
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=234 ctermfg=145 gui=underline guibg=#202020 guifg=#a09998
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=153 ctermfg=234 gui=NONE guibg=#b0d0f0 guifg=#1a1a1a
    CSAHi Conditional term=NONE cterm=NONE ctermbg=234 ctermfg=186 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi Repeat term=NONE cterm=NONE ctermbg=234 ctermfg=186 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi Operator term=NONE cterm=NONE ctermbg=234 ctermfg=222 gui=NONE guibg=#1a1a1a guifg=#ebc471
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#006411
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=236 ctermfg=230 gui=italic,underline guibg=#303030 guifg=#fffedc
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=236 ctermfg=102 gui=italic,underline guibg=#303030 guifg=#605958
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=236 ctermfg=236 gui=NONE guibg=#303030 guifg=#303030
    CSAHi Title term=bold cterm=underline ctermbg=234 ctermfg=180 gui=underline guibg=#1a1a1a guifg=#d08356
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#404040 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=160 gui=NONE guibg=bg guifg=#dd0805
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#fbf204 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi cUserCont term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBitField term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cCppParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cCppBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=234 gui=NONE guibg=#fffedc guifg=#1a1a1a
    CSAHi MatchParen term=reverse cterm=bold ctermbg=145 ctermfg=231 gui=bold guibg=#80a090 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=234 ctermfg=102 gui=italic guibg=#1a1a1a guifg=#64686c
    CSAHi Constant term=underline cterm=NONE ctermbg=234 ctermfg=180 gui=NONE guibg=#1a1a1a guifg=#d08356
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=187 gui=NONE guibg=#1a1a1a guifg=#c2c98f
    CSAHi Identifier term=underline cterm=NONE ctermbg=234 ctermfg=145 gui=NONE guibg=#1a1a1a guifg=#8a9597
    CSAHi Statement term=bold cterm=NONE ctermbg=234 ctermfg=186 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi PreProc term=underline cterm=NONE ctermbg=234 ctermfg=145 gui=NONE guibg=#1a1a1a guifg=#8a9597
    CSAHi Type term=underline cterm=NONE ctermbg=234 ctermfg=187 gui=italic guibg=#1a1a1a guifg=#e3d796
    CSAHi cMulti term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Structure term=NONE cterm=NONE ctermbg=234 ctermfg=186 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=20 gui=bold guibg=#008080 guifg=#0000d4
    CSAHi DiffText term=reverse cterm=bold ctermbg=160 ctermfg=fg gui=bold guibg=#dd0805 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=Cyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=231 gui=NONE guibg=#1a1a1a guifg=#fffedc
    CSAHi cNumbersCom term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cNumbers term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=234 ctermfg=231 gui=underline guibg=#1a1a1a guifg=#fffedc
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Error term=reverse cterm=NONE ctermbg=95 ctermfg=255 gui=NONE guibg=#602020 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=234 ctermfg=152 gui=bold,italic guibg=#1a1a1a guifg=#8a9597
    CSAHi String term=NONE cterm=NONE ctermbg=234 ctermfg=187 gui=NONE guibg=#1a1a1a guifg=#a2a96f
    CSAHi Function term=NONE cterm=NONE ctermbg=234 ctermfg=188 gui=NONE guibg=#1a1a1a guifg=#a999ac
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=234 ctermfg=236 gui=NONE guibg=#1a1a1a guifg=#303030
    CSAHi NonText term=bold cterm=bold ctermbg=236 ctermfg=102 gui=bold guibg=#303030 guifg=#605958
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#dad085
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=226 ctermfg=100 gui=bold guibg=#c0c000 guifg=#606000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=103 gui=NONE guibg=#34383c guifg=#64686c
    CSAHi cppMinMax term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=underline ctermbg=236 ctermfg=102 gui=underline guibg=#303030 guifg=#605958
    CSAHi PmenuSel term=NONE cterm=underline ctermbg=238 ctermfg=188 gui=underline guibg=#404040 guifg=#a09998
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=234 ctermfg=188 gui=underline guibg=#202020 guifg=#a09998
    CSAHi TabLineSel term=bold cterm=underline ctermbg=102 ctermfg=188 gui=underline guibg=#404850 guifg=#a09998
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=234 ctermfg=188 gui=underline guibg=#202020 guifg=#a09998
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=195 ctermfg=234 gui=NONE guibg=#b0d0f0 guifg=#1a1a1a
    CSAHi Conditional term=NONE cterm=NONE ctermbg=234 ctermfg=223 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi Repeat term=NONE cterm=NONE ctermbg=234 ctermfg=223 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi Operator term=NONE cterm=NONE ctermbg=234 ctermfg=229 gui=NONE guibg=#1a1a1a guifg=#ebc471
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#006411
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=236 ctermfg=231 gui=italic,underline guibg=#303030 guifg=#fffedc
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=236 ctermfg=102 gui=italic,underline guibg=#303030 guifg=#605958
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=236 ctermfg=236 gui=NONE guibg=#303030 guifg=#303030
    CSAHi Title term=bold cterm=underline ctermbg=234 ctermfg=216 gui=underline guibg=#1a1a1a guifg=#d08356
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#404040 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#dd0805
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#fbf204 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=152 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi cUserCont term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBitField term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cCppParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cCppBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=NONE guibg=#fffedc guifg=#1a1a1a
    CSAHi MatchParen term=reverse cterm=bold ctermbg=151 ctermfg=255 gui=bold guibg=#80a090 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=234 ctermfg=103 gui=italic guibg=#1a1a1a guifg=#64686c
    CSAHi Constant term=underline cterm=NONE ctermbg=234 ctermfg=216 gui=NONE guibg=#1a1a1a guifg=#d08356
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=229 gui=NONE guibg=#1a1a1a guifg=#c2c98f
    CSAHi Identifier term=underline cterm=NONE ctermbg=234 ctermfg=152 gui=NONE guibg=#1a1a1a guifg=#8a9597
    CSAHi Statement term=bold cterm=NONE ctermbg=234 ctermfg=223 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi PreProc term=underline cterm=NONE ctermbg=234 ctermfg=152 gui=NONE guibg=#1a1a1a guifg=#8a9597
    CSAHi Type term=underline cterm=NONE ctermbg=234 ctermfg=230 gui=italic guibg=#1a1a1a guifg=#e3d796
    CSAHi cMulti term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Structure term=NONE cterm=NONE ctermbg=234 ctermfg=223 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=152 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=#008080 guifg=#0000d4
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#dd0805 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=59 ctermfg=152 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=Cyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=230 gui=NONE guibg=#1a1a1a guifg=#fffedc
    CSAHi cNumbersCom term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cNumbers term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=234 ctermfg=230 gui=underline guibg=#1a1a1a guifg=#fffedc
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Error term=reverse cterm=NONE ctermbg=52 ctermfg=231 gui=NONE guibg=#602020 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=234 ctermfg=102 gui=bold,italic guibg=#1a1a1a guifg=#8a9597
    CSAHi String term=NONE cterm=NONE ctermbg=234 ctermfg=143 gui=NONE guibg=#1a1a1a guifg=#a2a96f
    CSAHi Function term=NONE cterm=NONE ctermbg=234 ctermfg=139 gui=NONE guibg=#1a1a1a guifg=#a999ac
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=234 ctermfg=236 gui=NONE guibg=#1a1a1a guifg=#303030
    CSAHi NonText term=bold cterm=bold ctermbg=236 ctermfg=59 gui=bold guibg=#303030 guifg=#605958
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#dad085
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=142 ctermfg=58 gui=bold guibg=#c0c000 guifg=#606000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#34383c guifg=#64686c
    CSAHi cppMinMax term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=underline ctermbg=236 ctermfg=59 gui=underline guibg=#303030 guifg=#605958
    CSAHi PmenuSel term=NONE cterm=underline ctermbg=238 ctermfg=138 gui=underline guibg=#404040 guifg=#a09998
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=234 ctermfg=138 gui=underline guibg=#202020 guifg=#a09998
    CSAHi TabLineSel term=bold cterm=underline ctermbg=59 ctermfg=138 gui=underline guibg=#404850 guifg=#a09998
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=234 ctermfg=138 gui=underline guibg=#202020 guifg=#a09998
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=153 ctermfg=234 gui=NONE guibg=#b0d0f0 guifg=#1a1a1a
    CSAHi Conditional term=NONE cterm=NONE ctermbg=234 ctermfg=180 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi Repeat term=NONE cterm=NONE ctermbg=234 ctermfg=180 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi Operator term=NONE cterm=NONE ctermbg=234 ctermfg=185 gui=NONE guibg=#1a1a1a guifg=#ebc471
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=#006411
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=236 ctermfg=230 gui=italic,underline guibg=#303030 guifg=#fffedc
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=236 ctermfg=59 gui=italic,underline guibg=#303030 guifg=#605958
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=236 ctermfg=236 gui=NONE guibg=#303030 guifg=#303030
    CSAHi Title term=bold cterm=underline ctermbg=234 ctermfg=173 gui=underline guibg=#1a1a1a guifg=#d08356
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#404040 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=160 gui=NONE guibg=bg guifg=#dd0805
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#fbf204 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi cUserCont term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBitField term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cCppParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cCppBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=234 gui=NONE guibg=#fffedc guifg=#1a1a1a
    CSAHi MatchParen term=reverse cterm=bold ctermbg=108 ctermfg=231 gui=bold guibg=#80a090 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=234 ctermfg=59 gui=italic guibg=#1a1a1a guifg=#64686c
    CSAHi Constant term=underline cterm=NONE ctermbg=234 ctermfg=173 gui=NONE guibg=#1a1a1a guifg=#d08356
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=150 gui=NONE guibg=#1a1a1a guifg=#c2c98f
    CSAHi Identifier term=underline cterm=NONE ctermbg=234 ctermfg=102 gui=NONE guibg=#1a1a1a guifg=#8a9597
    CSAHi Statement term=bold cterm=NONE ctermbg=234 ctermfg=180 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi PreProc term=underline cterm=NONE ctermbg=234 ctermfg=102 gui=NONE guibg=#1a1a1a guifg=#8a9597
    CSAHi Type term=underline cterm=NONE ctermbg=234 ctermfg=186 gui=italic guibg=#1a1a1a guifg=#e3d796
    CSAHi cMulti term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Structure term=NONE cterm=NONE ctermbg=234 ctermfg=180 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=30 ctermfg=20 gui=bold guibg=#008080 guifg=#0000d4
    CSAHi DiffText term=reverse cterm=bold ctermbg=160 ctermfg=fg gui=bold guibg=#dd0805 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=Cyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=78 gui=NONE guibg=#1a1a1a guifg=#fffedc
    CSAHi cNumbersCom term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cNumbers term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=80 ctermfg=78 gui=underline guibg=#1a1a1a guifg=#fffedc
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Error term=reverse cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#602020 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=80 ctermfg=37 gui=bold,italic guibg=#1a1a1a guifg=#8a9597
    CSAHi String term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#1a1a1a guifg=#a2a96f
    CSAHi Function term=NONE cterm=NONE ctermbg=80 ctermfg=84 gui=NONE guibg=#1a1a1a guifg=#a999ac
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#1a1a1a guifg=#303030
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=81 gui=bold guibg=#303030 guifg=#605958
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#dad085
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=78 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=56 ctermfg=36 gui=bold guibg=#c0c000 guifg=#606000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#34383c guifg=#64686c
    CSAHi cppMinMax term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=underline ctermbg=80 ctermfg=81 gui=underline guibg=#303030 guifg=#605958
    CSAHi PmenuSel term=NONE cterm=underline ctermbg=80 ctermfg=84 gui=underline guibg=#404040 guifg=#a09998
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=78 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=80 ctermfg=84 gui=underline guibg=#202020 guifg=#a09998
    CSAHi TabLineSel term=bold cterm=underline ctermbg=21 ctermfg=84 gui=underline guibg=#404850 guifg=#a09998
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=80 ctermfg=84 gui=underline guibg=#202020 guifg=#a09998
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=59 ctermfg=80 gui=NONE guibg=#b0d0f0 guifg=#1a1a1a
    CSAHi Conditional term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi Repeat term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi Operator term=NONE cterm=NONE ctermbg=80 ctermfg=73 gui=NONE guibg=#1a1a1a guifg=#ebc471
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#006411
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=80 ctermfg=78 gui=italic,underline guibg=#303030 guifg=#fffedc
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=80 ctermfg=81 gui=italic,underline guibg=#303030 guifg=#605958
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#303030 guifg=#303030
    CSAHi Title term=bold cterm=underline ctermbg=80 ctermfg=53 gui=underline guibg=#1a1a1a guifg=#d08356
    CSAHi Visual term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#404040 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#dd0805
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#fbf204 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi cUserCont term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBitField term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cCppParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cCppBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi cBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=78 ctermfg=80 gui=NONE guibg=#fffedc guifg=#1a1a1a
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#80a090 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=80 ctermfg=37 gui=italic guibg=#1a1a1a guifg=#64686c
    CSAHi Constant term=underline cterm=NONE ctermbg=80 ctermfg=53 gui=NONE guibg=#1a1a1a guifg=#d08356
    CSAHi Special term=bold cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#1a1a1a guifg=#c2c98f
    CSAHi Identifier term=underline cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#1a1a1a guifg=#8a9597
    CSAHi Statement term=bold cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi PreProc term=underline cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#1a1a1a guifg=#8a9597
    CSAHi Type term=underline cterm=NONE ctermbg=80 ctermfg=57 gui=italic guibg=#1a1a1a guifg=#e3d796
    CSAHi cMulti term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Structure term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#1a1a1a guifg=#ceb67f
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=21 ctermfg=18 gui=bold guibg=#008080 guifg=#0000d4
    CSAHi DiffText term=reverse cterm=bold ctermbg=48 ctermfg=fg gui=bold guibg=#dd0805 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#34383c guifg=#8a9597
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=Cyan
endif

if 1
    delcommand CSAHi
endif
