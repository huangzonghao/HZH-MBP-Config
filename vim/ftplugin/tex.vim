"source imaps.vim
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_pdf = 'dvi2pdf $*.dvi'
"let g:Tex_CompileRule_pdf = 'latexmk -pdf -pv $*.tex'
let g:Tex_ViewRule_ps = 'open -a Preview'
"let g:Tex_ViewRule_pdf = 'open -a Preview'
let g:Tex_ViewRule_pdf = 'open -a Skim'
let g:Tex_ViewRule_dvi = 'open -a /Applications/texniscope.app'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_SmartKeyDot=0
set spell
"nmap <F2> \lv
"map <F3> :up<CR>:silent call Tex_RunLaTeX()<CR>
"nmap <F2> :!latexmk -pv -pdf *.tex<CR><CR>

"au VimLeave :!laclean<CR>

let g:tex_flavor='latex'

set grepprg=grep\ -nH\ $*
"let g:Imap_DeleteEmptyPlaceHolders = 0


noremap  <Tab> <C-j>


call IMAP ('_', '_{<++>}<++>', "tex")
call IMAP ('^', '^{<++>}<++>', "tex")
call IMAP ('ITE', '\item [<++>]<++>', "tex")
call IMAP ('ITT', '\item [] \textbf{<++>}: <++>', "tex")
call IMAP ('LFL', '\lfloor <++> \rfloor <++>', "tex")
call IMAP ('BFL', '\left \lfloor <++> \right \rfloor <++>', "tex")
call IMAP ('LCL', '\lceil <++> \rceil <++>', "tex")
call IMAP ('BCL', '\left \lceil <++> \right \rceil <++>', "tex")
call IMAP ('SST', '\subsection*{<++>}<++>', "tex")
call IMAP ('||', '|<++>|<++>', "tex")
call IMAP ('E$', '$$<++>$$<++>', "tex")
call IMAP ('&=& =', '==', "tex")
call IMAP ('HAT', '\hat{<++>}<++>', "tex")
call IMAP ('BAR', '\bar{<++>}<++>', "tex")
call IMAP ('DOT', '\dot{<++>}<++>', "tex")
call IMAP ('SMTX', '\begin{smallmatrix} <++> \end{smallmatrix} <++>', "tex")

" map the slash keys as mentioned in the update note --Sat Jul 25 01:32:14 2015
inoremap / \
inoremap \ /
