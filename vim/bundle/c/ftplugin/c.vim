" ==============================================================================
" Huge changes on mappings -- 2015.7.23
" map all the local leader in normal mode and visual mode to <Space>
" most imaps has been disabled for better typing experience
" and also convert all + class to e which stands for extra
"
" Huge changes on mappings again -- 2015.7.24
" this time use dot as the leader and comment out all the
" useless mappings
"
" And we may later use it to compile and run some simple code.
"
" And actually for programming template, there are only two big categories,
"  the comments and the real code blocks. So we just need to assign to them
"  different leaders to make the separation.
"
" Note we want the mappings be buffer wise since we may edit different filetypes
" at the same time and they may have different kinds of templates
" ==============================================================================

" Only do this when not done yet for this buffer
"
if exists("b:did_C_ftplugin")
  finish
endif
let b:did_C_ftplugin = 1
"
" ---------- system installation or local installation ----------
"
let s:installation              ='local'
if match( expand("<sfile>"), escape( $VIM,' \' ) ) == 0
    let s:installation                      ='system'
endif
"

" ---------- C/C++ dictionary -----------------------------------
" This will enable keyword completion for C and C++
" using Vim's dictionary feature |i_CTRL-X_CTRL-K|.
" Set the new dictionaries in front of the existing ones
"
if exists("g:C_Dictionary_File")
  let save=&dictionary
  silent! exe'setlocal dictionary='.g:C_Dictionary_File
  silent! exe'setlocal dictionary+='.save
endif

" ==============================================================================
"                            Key Mappings
" ==============================================================================
if exists("g:C_Insert_Mode_Leader")
    let s:C_Insert_Mode_Leader = g:C_Insert_Mode_Leader
else
    let s:C_Insert_Mode_Leader ='\'
endif

if exists("g:C_Normal_Mode_Leader")
    let s:C_Normal_Mode_Leader = g:C_Normal_Mode_Leader
else
    let s:C_Normal_Mode_Leader ='.'
endif

let s:N_Map_Prefix = 'nnoremap <buffer> <silent>'
let s:I_Map_Prefix = 'inoremap <buffer> <silent>'
let s:V_Map_Prefix = 'vnoremap <buffer> <silent>'

" logic here: for N mode we type comments more but for I mode we type code more
let s:C_N_Mode_Comment_Leader = s:N_Map_Prefix.s:C_Normal_Mode_Leader
let s:C_N_Mode_Code_Leader    = s:N_Map_Prefix.s:C_Normal_Mode_Leader.s:C_Normal_Mode_Leader
let s:C_V_Mode_Comment_Leader = s:V_Map_Prefix.s:C_Normal_Mode_Leader
let s:C_V_Mode_Code_Leader    = s:V_Map_Prefix.s:C_Normal_Mode_Leader.s:C_Normal_Mode_Leader
let s:C_I_Mode_Comment_Leader = s:I_Map_Prefix.s:C_Insert_Mode_Leader.s:C_Insert_Mode_Leader
let s:C_I_Mode_Code_Leader    = s:I_Map_Prefix.s:C_Insert_Mode_Leader


" ------------------------------------------------------------------------------
"                           Programming Keymappings
"-------------------------------------------------------------------------------
" The programming leader is defined in the vimrc file
" --Tue 20 Dec 2016 02:41:47 PM HKT
exe s:N_Map_Prefix.g:Programming_Leader."cj         :call C_AdjustLineEndComm()<CR>"
exe s:N_Map_Prefix.g:Programming_Leader."eco        :call C_InsertTemplate('cpp.cout')<CR>"
exe s:N_Map_Prefix.g:Programming_Leader."nr         :call C_CodeSnippet('r')<CR>"
exe s:N_Map_Prefix.g:Programming_Leader."nw         :call C_CodeSnippet('w')<CR>"
exe s:N_Map_Prefix.g:Programming_Leader."ne         :call C_CodeSnippet('e')<CR>"
exe s:V_Map_Prefix.g:Programming_Leader."cj    <Esc>:call C_AdjustLineEndComm()<CR>"
exe s:V_Map_Prefix.g:Programming_Leader."nw    <Esc>:call C_CodeSnippet('wv')<CR>"


" ------------------------------------------------------------------------------
"                          N Mode Insertion Keymappings
" ------------------------------------------------------------------------------

" ****************************   Comments  ************************************ "
exe s:C_N_Mode_Comment_Leader."ff   :call C_InsertTemplate('comment.end-of-file')<CR>:call C_InsertTemplate('comment.file-description')<CR> "
exe s:C_N_Mode_Comment_Leader."fd   :call C_InsertTemplate('comment.file-description')<CR>"
exe s:C_N_Mode_Comment_Leader."fe   :call C_InsertTemplate('comment.end-of-file')<CR>"
exe s:C_N_Mode_Comment_Leader."fl   :call C_InsertTemplate('comment.frame-large')<CR>"
exe s:C_N_Mode_Comment_Leader."fr   :call C_InsertTemplate('comment.frame')<CR>"
exe s:C_N_Mode_Comment_Leader."fs   :CFileSection<Space>"
exe s:C_N_Mode_Comment_Leader."hs   :HFileSection<Space>"
exe s:C_N_Mode_Comment_Leader."fu   :call C_InsertTemplate('comment.function')<CR>"
exe s:C_N_Mode_Comment_Leader."cl   :call C_InsertTemplate('comment.class')<CR>"
exe s:C_N_Mode_Comment_Leader."me   :call C_InsertTemplate('comment.method')<CR>"
exe s:C_N_Mode_Comment_Leader."rm   :call C_InsertTemplate('comment.keyword-remarks')<CR>"
exe s:C_N_Mode_Comment_Leader."td   :call C_InsertTemplate('comment.keyword-todo')<CR>"
exe s:C_N_Mode_Comment_Leader."fi   :call C_InsertTemplate('comment.keyword-fixit')<CR>"
exe s:C_N_Mode_Comment_Leader."kg   :call C_InsertTemplate('comment.kaiguang')<CR>"
exe s:C_N_Mode_Comment_Leader."kc   :KeywordComment<Space>"


" ******************************   Codes  ************************************* "
exe s:C_N_Mode_Code_Leader."dw   :call C_InsertTemplate('statements.do-while')<CR>"
exe s:C_N_Mode_Code_Leader."fr   :call C_InsertTemplate('statements.for-block')<CR>"
exe s:C_N_Mode_Code_Leader."if   :call C_InsertTemplate('statements.if-block')<CR>"
exe s:C_N_Mode_Code_Leader."el   :call C_InsertTemplate('statements.else-block')<CR>"
exe s:C_N_Mode_Code_Leader."wh   :call C_InsertTemplate('statements.while-block')<CR>"
exe s:C_N_Mode_Code_Leader."sw   :call C_InsertTemplate('statements.switch')<CR>"
exe s:C_N_Mode_Code_Leader."cs   :call C_InsertTemplate('statements.case')<CR>"
exe s:C_N_Mode_Code_Leader."pif  :call C_InsertTemplate('preprocessor.if-endif')<CR>"
exe s:C_N_Mode_Code_Leader."pie  :call C_InsertTemplate('preprocessor.if-else-endif')<CR>"
exe s:C_N_Mode_Code_Leader."pid  :call C_InsertTemplate('preprocessor.ifdef-else-endif')<CR>"
exe s:C_N_Mode_Code_Leader."pin  :call C_InsertTemplate('preprocessor.ifndef-else-endif')<CR>"
exe s:C_N_Mode_Code_Leader."pind :call C_InsertTemplate('preprocessor.ifndef-def-endif')<CR>"
exe s:C_N_Mode_Code_Leader."ph   :call C_InsertTemplate('preprocessor.header-protector')<CR>"
exe s:C_N_Mode_Code_Leader."p<   :call C_InsertTemplate('preprocessor.include-global')<CR>"
exe s:C_N_Mode_Code_Leader."ps   :IncludeStdLibrary<Space>"
exe s:C_N_Mode_Code_Leader."p'   :call C_InsertTemplate('preprocessor.include-local')<CR>"
exe s:C_N_Mode_Code_Leader."pd   :call C_InsertTemplate('preprocessor.define')<CR>"
exe s:C_N_Mode_Code_Leader."pu   :call C_InsertTemplate('preprocessor.undefine')<CR>"
exe s:C_N_Mode_Code_Leader."fu   :call C_InsertTemplate('idioms.function' )<CR>"
exe s:C_N_Mode_Code_Leader."fi   :call C_InsertTemplate('idioms.inline-function' )<CR>"
exe s:C_N_Mode_Code_Leader."keg  :call C_InsertTemplate('idioms.kernel-global')<CR>"
exe s:C_N_Mode_Code_Leader."ked  :call C_InsertTemplate('idioms.kernel-device')<CR>"
exe s:C_N_Mode_Code_Leader."mn   :call C_InsertTemplate('idioms.main' )<CR>"
exe s:C_N_Mode_Code_Leader."st   :call C_InsertTemplate('idioms.struct' )<CR>"
exe s:C_N_Mode_Code_Leader."pf   :call C_InsertTemplate('idioms.printf' )<CR>"
exe s:C_N_Mode_Code_Leader."ca   :call C_InsertTemplate('idioms.calloc' )<CR>"
exe s:C_N_Mode_Code_Leader."ma   :call C_InsertTemplate('idioms.malloc' )<CR>"
exe s:C_N_Mode_Code_Leader."ra   :call C_InsertTemplate('idioms.realloc' )<CR>"
exe s:C_N_Mode_Code_Leader."en   :call C_InsertTemplate('idioms.enum' )<CR>"
exe s:C_N_Mode_Code_Leader."cd   :call C_InsertTemplate('cpp.class-using-new-definition' )<CR>"
exe s:C_N_Mode_Code_Leader."ci   :call C_InsertTemplate('cpp.class-using-new-implementation' )<CR>"
exe s:C_N_Mode_Code_Leader."mi   :call C_InsertTemplate('cpp.method-implementation' )<CR>"
exe s:C_N_Mode_Code_Leader."ai   :call C_InsertTemplate('cpp.accessor-implementation' )<CR>"
exe s:C_N_Mode_Code_Leader."tcd  :call C_InsertTemplate('cpp.template-class-using-new-definition' )<CR>"
exe s:C_N_Mode_Code_Leader."tci  :call C_InsertTemplate('cpp.template-class-using-new-implementation' )<CR>"
exe s:C_N_Mode_Code_Leader."tmi  :call C_InsertTemplate('cpp.template-method-implementation' )<CR>"
exe s:C_N_Mode_Code_Leader."tai  :call C_InsertTemplate('cpp.template-accessor-implementation' )<CR>"
exe s:C_N_Mode_Code_Leader."tf   :call C_InsertTemplate('cpp.template-function' )<CR>"
exe s:C_N_Mode_Code_Leader."ec   :call C_InsertTemplate('cpp.error-class' )<CR>"
exe s:C_N_Mode_Code_Leader."tch  :call C_InsertTemplate('cpp.try-catch' )<CR>"
exe s:C_N_Mode_Code_Leader."oof  :call C_InsertTemplate('idioms.open-output-file' )<CR>"
exe s:C_N_Mode_Code_Leader."oif  :call C_InsertTemplate('idioms.open-input-file' )<CR>"

"exe s:C_N_Mode_Code_Leader."etc   :call C_InsertTemplate('cpp.template-class-definition' )<CR>"
"exe s:C_N_Mode_Code_Leader."etci  :call C_InsertTemplate('cpp.template-class-implementation' )<CR>"
"exe s:C_N_Mode_Code_Leader."eci   :call C_InsertTemplate('cpp.class-implementation' )<CR>"
"exe s:C_N_Mode_Code_Leader."epc   :IncludeCppCLibrary<Space>"
"exe s:C_N_Mode_Code_Leader."eps   :IncludeCppLibrary<Space>"
"exe s:C_N_Mode_Code_Leader."ec    :call C_InsertTemplate('cpp.class-definition' )<CR>"


" ------------------------------------------------------------------------------
"                          V Mode Insertion Keymappings
" -------------------------------------------------------------------------------
" ****************************   Comments  ************************************ "
exe s:C_V_Mode_Comment_Leader."fr  <Esc>:call C_InsertTemplate('comment.frame','v' )<CR>"
exe s:C_V_Mode_Comment_Leader."fl  <Esc>:call C_InsertTemplate('comment.frame-large','v' )<CR>"

" ******************************   Codes  ************************************* "
exe s:C_V_Mode_Code_Leader."dw  <Esc>:call C_InsertTemplate('statements.do-while','v' )<CR>"
exe s:C_V_Mode_Code_Leader."fr  <Esc>:call C_InsertTemplate('statements.for-block','v' )<CR>"
exe s:C_V_Mode_Code_Leader."if  <Esc>:call C_InsertTemplate('statements.if-block','v' )<CR>"
exe s:C_V_Mode_Code_Leader."el  <Esc>:call C_InsertTemplate('statements.else-block','v' )<CR>"
exe s:C_V_Mode_Code_Leader."wh  <Esc>:call C_InsertTemplate('statements.while-block','v' )<CR>"
exe s:C_V_Mode_Code_Leader."trh <Esc>:call C_InsertTemplate('cpp.try-catch','v' )<CR>"
exe s:C_V_Mode_Code_Leader."sw  <Esc>:call C_InsertTemplate('statements.switch','v' )<CR>"
"

" ------------------------------------------------------------------------------
"                          I Mode Insertion Keymappings
" -------------------------------------------------------------------------------
" ****************************   Comments  ************************************ "
exe s:C_I_Mode_Comment_Leader."fr   <Esc>:call C_InsertTemplate('comment.frame', 'i')<CR>"
exe s:C_I_Mode_Comment_Leader."fl   <Esc>:call C_InsertTemplate('comment.frame-large', 'i')<CR>"
exe s:C_I_Mode_Comment_Leader."fs   <Esc>:CFileSection<Space>"
exe s:C_I_Mode_Comment_Leader."hs   <Esc>:HFileSection<Space>"
exe s:C_I_Mode_Comment_Leader."kc   <Esc>:KeywordComment<Space>"
exe s:C_I_Mode_Comment_Leader."td   <Esc>:KeywordComment TODO<CR>"

" ******************************   Codes  ************************************* "
exe s:C_I_Mode_Code_Leader."dw  <Esc>:call C_InsertTemplate('statements.do-while', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."fr  <Esc>:call C_InsertTemplate('statements.for-block', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."if  <Esc>:call C_InsertTemplate('statements.if-block', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."el  <Esc>:call C_InsertTemplate('statements.else-block', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."wh  <Esc>:call C_InsertTemplate('statements.while-block', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."sw  <Esc>:call C_InsertTemplate('statements.switch', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."cs  <Esc>:call C_InsertTemplate('statements.case', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."fu  <Esc>:call C_InsertTemplate('idioms.function', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."fi  <Esc>:call C_InsertTemplate('idioms.inline-function', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."keg <Esc>:call C_InsertTemplate('idioms.kernel-global', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."ked <Esc>:call C_InsertTemplate('idioms.kernel-device', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."p<  <Esc>:call C_InsertTemplate('preprocessor.include-global', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."p'  <Esc>:call C_InsertTemplate('preprocessor.include-local', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."pd  <Esc>:call C_InsertTemplate('preprocessor.define', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."pu  <Esc>:call C_InsertTemplate('preprocessor.undefine', 'i')<CR>"
exe s:C_I_Mode_Code_Leader."pf  <Esc>:call C_InsertTemplate('idioms.printf', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."ca  <Esc>:call C_InsertTemplate('idioms.calloc', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."ma  <Esc>:call C_InsertTemplate('idioms.malloc', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."ra  <Esc>:call C_InsertTemplate('idioms.realloc', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."fod <Esc>:call C_CodeFor('down')<CR>"
exe s:C_I_Mode_Code_Leader."fou <Esc>:call C_CodeFor('up'  )<CR>"
exe s:C_I_Mode_Code_Leader."cd  <Esc>:call C_InsertTemplate('cpp.class-using-new-definition', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."ci  <Esc>:call C_InsertTemplate('cpp.class-using-new-implementation', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."mi  <Esc>:call C_InsertTemplate('cpp.method-implementation', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."ai  <Esc>:call C_InsertTemplate('cpp.accessor-implementation', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."tcd <Esc>:call C_InsertTemplate('cpp.template-class-using-new-definition', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."tci <Esc>:call C_InsertTemplate('cpp.template-class-using-new-implementation', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."tmi <Esc>:call C_InsertTemplate('cpp.template-method-implementation', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."tai <Esc>:call C_InsertTemplate('cpp.template-accessor-implementation', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."tf  <Esc>:call C_InsertTemplate('cpp.template-function', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."ec  <Esc>:call C_InsertTemplate('cpp.error-class', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."tcd <Esc>:call C_InsertTemplate('cpp.try-catch', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."oof <Esc>:call C_InsertTemplate('idioms.open-output-file', 'i' )<CR>"
exe s:C_I_Mode_Code_Leader."oif <Esc>:call C_InsertTemplate('idioms.open-input-file', 'i' )<CR>"

"exe s:C_I_Mode_Code_Leader."epc   <Esc>:IncludeCppCLibrary<Space>"
"exe s:C_I_Mode_Code_Leader."ps    <Esc>:IncludeStdLibrary<Space> "
"exe s:C_I_Mode_Code_Leader."eps   <Esc>:IncludeCppLibrary<Space> "
"exe s:C_I_Mode_Code_Leader."ec    <Esc>:call C_InsertTemplate('cpp.class-definition' )<CR>"
"exe s:C_I_Mode_Code_Leader."eci   <Esc>:call C_InsertTemplate('cpp.class-implementation' )<CR>"
"exe s:C_I_Mode_Code_Leader."etc   <Esc>:call C_InsertTemplate('cpp.template-class-definition' )<CR>"
"exe s:C_I_Mode_Code_Leader."etci  <Esc>:call C_InsertTemplate('cpp.template-class-implementation' )<CR>"


" ==============================================================================
"                             Commands
" ==============================================================================
command! -nargs=1 -complete=customlist,C_CFileSectionList        CFileSection       call C_CFileSectionListInsert   (<f-args>)
command! -nargs=1 -complete=customlist,C_HFileSectionList        HFileSection       call C_HFileSectionListInsert   (<f-args>)
command! -nargs=1 -complete=customlist,C_KeywordCommentList      KeywordComment     call C_KeywordCommentListInsert (<f-args>)
command! -nargs=1 -complete=customlist,C_SpecialCommentList      SpecialComment     call C_SpecialCommentListInsert (<f-args>)
command! -nargs=1 -complete=customlist,C_StdLibraryIncludesList  IncludeStdLibrary  call C_StdLibraryIncludesInsert (<f-args>)
command! -nargs=1 -complete=customlist,C_C99LibraryIncludesList  IncludeC99Library  call C_C99LibraryIncludesInsert (<f-args>)
command! -nargs=1 -complete=customlist,C_CppLibraryIncludesList  IncludeCppLibrary  call C_CppLibraryIncludesInsert (<f-args>)
command! -nargs=1 -complete=customlist,C_CppCLibraryIncludesList IncludeCppCLibrary call C_CppCLibraryIncludesInsert(<f-args>)
command! -nargs=1 -complete=customlist,C_StyleList               CStyle             call C_Style                    (<f-args>)

" ==============================================================================
"                            Function Calls
" ==============================================================================
