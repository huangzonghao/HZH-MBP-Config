setlocal textwidth=80
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
setlocal spell
"nmap <F2> \lv
"map <F3> :up<CR>:silent call Tex_RunLaTeX()<CR>
"nmap <F2> :!latexmk -pv -pdf *.tex<CR><CR>

"au VimLeave :!laclean<CR>

let g:tex_flavor='latex'

setlocal grepprg=grep\ -nH\ $*
"let g:Imap_DeleteEmptyPlaceHolders = 0

call IMAP ('_', '_{<++>}<++>', "tex")
call IMAP ('-_', '_', "tex")
call IMAP ('^', '^{<++>}<++>', "tex")
call IMAP ('ITE', '\item [<++>]<++>', "tex")
call IMAP ('ITM', '\item ', "tex")
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
inoremap <buffer> / \
inoremap <buffer> \ /

nnoremap <buffer> <CR> o<CR>
nnoremap <buffer> <Space><CR> O<Esc>jo<Esc>k$

imap <silent> <buffer> <C-E> <Plug>Tex_FastEnvironmentInsert
imap <silent> <buffer> <C-N> <Plug>Tex_FastCommandInsert

imap <buffer> <Tab> <Plug>IMAP_JumpForward
nmap <buffer> <Tab> <Plug>IMAP_JumpForward

" Let vim wrap the lines automatically --Fri Feb 16 10:45:42 EST 2018
" set fo+=a
" TODO:
" Set handy mappings to  environment generation and command generation

" Define environments which can be expanded by the envirnoment hotkey
" currently <C-E> --Mon Mar 19 20:19:47 EDT 2018
let g:Tex_Env_cfigure = "{\\centering\\includegraphics[width=<++>\\linewidth]{<++>}}"
let g:Tex_Env_Cfigure = "\\begin{center}\<CR>    \\includegraphics[width=<++>\\linewidth]{<++>}\<CR>\\end{center}"
" bm bracket matrix, pm parenthesis matrix, vm vertical matrix
let g:Tex_Env_bm_aliasto = "bmatrix"
let g:Tex_Env_pm_aliasto = "pmatrix"
let g:Tex_Env_vm_aliasto = "vmatrix"
let g:Tex_Env_Vm_aliasto = "Vmatrix"
let g:Tex_Env_eq_aliasto = "equation"
let g:Tex_Env_es_aliasto = "equation*"
let g:Tex_Env_mc_aliasto = "multicols"

" Add the customized environment to the selection menu
let g:Tex_PromptedEnvironments = g:Tex_PromptedEnvironments.",cfigure"
let g:Tex_PromptedEnvironments = "cfigure"

" Define commands expansions
let g:Tex_Com_center = "{\\centering <++>}"
let g:Tex_Com_b = "\\textbf{<++>}<++>"
let g:Tex_Com_i = "\\textit{<++>}<++>"
let g:Tex_Com_ig = "\\includegraphics[width=<++>\\linewidth]{<++>}"
let g:Tex_Com_ip = "\\includegraphics[width=<++>\\linewidth, page=<++>]{<++>}"
let g:Tex_Com_ips = "\\includepdf[pages={<++>}, pagecommand={<++>}]{<++>}"
let g:Tex_Com_lb = "\\label{<++>}<++>"

" The mapping below are taking from some seldom used greek letters.
" n - nu, k - kappa, c - chi, h - eta, z - zeta, v - varsigma, 9, 0
" They are either never used or just similar to english letters
call IMAP (g:Tex_Leader.'n', '\frac{<++>}{<++>}<++>', "tex")
call IMAP (g:Tex_Leader.'c', '\theta', "tex")

function! CreateMatrix(rows, ...) abort
  let cols = a:0 ? a:1 : 3
  let matrix = ['\begin{bmatrix}']
  call extend(matrix, repeat([repeat('<++> & ', cols - 1) . '<++>\\'], a:rows))
  call add(matrix, '\end{bmatrix}<++>')
  call append(line('.') - 1, matrix)
endfunction
command! -nargs=+ Matrix silent call CreateMatrix(<f-args>)
