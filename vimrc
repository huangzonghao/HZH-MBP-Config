" ==============================================================================
"                            Environment Settings
" ==============================================================================
if filereadable(expand("$HOME/dotfiles/local_config/vimrc_before_plugin"))
    source $HOME/dotfiles/local_config/vimrc_before_plugin
endif

" CVim time format, we need this setting for the general time insertion
" the current setting is the defult setting of system date
let g:C_FormatDate = '%a %b %d %H:%M:%S %Z %Y'

syntax on
filetype on
filetype plugin on
filetype plugin indent on

set number
set ruler
set cursorline
set ttyfast        " for fast terminal... but what the hell is this...
set lazyredraw
set nocompatible   " Disable vi-compatibility
" set scrolloff=5  " useless now as we no longer use jk to scroll
set backspace=2    " because of the stupid vim7.4
set tabstop=4
set shiftwidth=4   " this sets 4 spaces for each indention
set expandtab
set softtabstop=4  " delete 4 spaces at a time

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set list
" set listchars=tab:>.,trail:~,extends:#,nbsp:.
set listchars=tab:>.,extends:#,nbsp:.
set cc=80
highlight ColorColumn ctermbg=gray

" ==============================================================================
"                            Global Behavior Settings
" ==============================================================================

" Note the settings for specific file type should go to ftplugin
set hlsearch
set incsearch               " show search matches as you type
set hidden                  " then we don't have to save the file before leaving
set nowrap                  " don't wrap lines
set ignorecase              " ignore case when searching
set smartcase               " ignore case if search pattern is all lowercase,
                            " case-sensitive otherwise
set wildmenu
set wildignore=*.o,*~,*.pyc " ignore those files in all expansions
set whichwrap+=<,>,h,l      " allow those keys to move to the prev or next line
set showcmd
set shiftround              " use multiple of sw when indenting with '<' and '>'
set pastetoggle=<F2>
" set autochdir               " automatically change the current dir
                                " This actually affects CtrlP and other  plugins
set shortmess=atI           " sorry i am just a student withno money...
set tags=./tags;            " Search tags from current file folder and upwards


" ==============================================================================
"                            Global Keymappings
" ==============================================================================
let g:Programming_Leader = ','
let g:Text_Editing_Leader = 'a'
" The alternative leader serves when the original leader-key combo is hard to
" press
let g:Alternative_Leader = 'r'
let mapleader = g:Programming_Leader
" ------------------------------------------------------------------------------
"                              Bare Keymappings
"-------------------------------------------------------------------------------
inoremap <F1> <Esc>:up<CR>
" make sure to trigger the insertleave autocommand with <c-c>
inoremap <C-L> <space><space><space><space>
imap <C-Space> <Plug>IMAP_JumpForward
inoremap <C-E> <C-]><C-U>
inoremap <C-F> <Right>
inoremap <C-B> <Left>

nnoremap <Space> a

" tag commands
nnoremap <C-J> <C-]>
nnoremap <C-K> <C-T>

" tab commands
nnoremap <C-T>t :tabnew<CR>
nnoremap <C-T><Space> :tabclose<CR>
" this will close the tab and delete all the buffers
nnoremap <C-T>q :windo bdelete<CR>
nnoremap <C-L> gt
nnoremap <C-H> gT

nnoremap h <C-W>h
nnoremap l <C-W>l
nnoremap j <C-W>j
nnoremap k <C-W>k
nnoremap <C-N> j
nnoremap <C-P> k
nnoremap <F1> :up<CR>
nnoremap ; :
nnoremap <C-W>m <C-W>_
nnoremap <C-W>w <C-W>=
nnoremap <C-W>k 2<C-W>-
nnoremap <Up> 2<C-W>-
nnoremap <C-W>j 2<C-W>+
nnoremap <Down> 2<C-W>+
nnoremap <Left> 2<C-W><
nnoremap <Right> 2<C-W>>
"nnoremap <F6> :e<CR>
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>=="

" nnoremap j gj
" nnoremap k gk
nnoremap gtf <C-W>gf

" buffer commands -- b as leader
nnoremap bb  :buffers<CR>:buffer<Space>
nnoremap bd  :buffers<CR>:Bdelete<Space>
nnoremap bo  :Bdelete %<CR>
nnoremap L   :bnext<CR>
nnoremap H   :bprevious<CR>
" open the current buffer in new (v)split
nnoremap bs :split<CR>
nnoremap bv :vsplit<CR>
" create a new (v)split
nnoremap bns :new<CR>
nnoremap bnv :vnew<CR>
" move to the next modified buffer
nnoremap bmm :bm<CR>
nnoremap bms :sbm<CR>


" register commands -- r as leader
" but need to find a way to stop this in NERD-Tree
" Sat Jan 27 15:20:17 EST 2018
nnoremap rr :reg<CR>

" disable the ex mode and have a short cut for recording
nnoremap Q @q


vnoremap j gj
vnoremap k gk
vnoremap ; :

" note you cannot use noremap on <Plug> mappings
nmap t <Plug>(easymotion-w)
nmap e <Plug>(easymotion-b)
nmap w <Plug>(easymotion-e)
nmap T <Plug>(easymotion-j)
nmap E <Plug>(easymotion-k)
nmap W <Plug>(easymotion-ge)

vmap W <Plug>(easymotion-w)
vmap B <Plug>(easymotion-b)
vmap J <Plug>(easymotion-j)
vmap K <Plug>(easymotion-k)
vmap E <Plug>(easymotion-e)

" switch f and n for better experience
nnoremap n f
nnoremap f n
nnoremap N F

nnoremap zz z-

" ------------------------------------------------------------------------------
"                           Programming Keymappings
"-------------------------------------------------------------------------------
"****************************** Toggles ****************************************
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>. :call ToggleProgrammingEnv()<CR>

let g:ycm_key_detailed_diagnostics = "<leader>si"

"*************************** Toggles end ***************************************
nnoremap <leader>sf :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>sd :YcmDiags<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yc :YcmDiags<CR>
nnoremap <leader>gt :GoTo<CR>

" shortcuts for git provided by fugitive
" :Gstatus seems to be the most useful, deserives a better shortcut
nnoremap <leader>gg :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gbl :Gblame<CR>
" behavior of the following commands depends on if you are on index or working
" directory. Essentially transfer contents between the two
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
" edit the index file
nnoremap <leader>ge :Gedit<CR>
" this command can bring up and make editable the stage version of the file
nnoremap <leader>gd :Gdiff<CR>
" load historical versions of file into quickfix
nnoremap <leader>gl :Glog<CR><CR><CR>
" browse file on github
nnoremap <leader>gbr :Gbrowse<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ea <Plug>(EasyAlign)

" shortcuts for quickfix window
nnoremap <leader>ff :copen<CR>
nnoremap <leader>fn :cnext<CR>
nnoremap <leader>fp :cprevious<CR>

" ------------------------------------------------------------------------------
"                           Text Editing Keymappings
"-------------------------------------------------------------------------------

exe "nnoremap ".g:Alternative_Leader.g:Text_Editing_Leader." :q<CR>"
" close the preview window
exe "nnoremap ".g:Text_Editing_Leader."x :pc<CR>"
exe "nnoremap ".g:Text_Editing_Leader."h :noh<CR>"

exe "nnoremap ".g:Text_Editing_Leader."sd :!subl .<CR><CR>"
exe "nnoremap ".g:Text_Editing_Leader."sf :!subl %<CR><CR>"

" the function is provide by CVim
exe "nnoremap ".g:Text_Editing_Leader."id : call C_InsertDateAndTime('d')<CR>a"
exe "nnoremap ".g:Text_Editing_Leader."u  :up<CR>"
exe "nnoremap ".g:Text_Editing_Leader."U  :w!<CR>"
exe "nnoremap ".g:Text_Editing_Leader."w  :wq<CR>"
exe "nnoremap ".g:Text_Editing_Leader."W  :w!q<CR>"
exe "nnoremap ".g:Text_Editing_Leader."; :q!<CR>"
exe "nnoremap ".g:Text_Editing_Leader."q :qa<CR>"
exe "nnoremap ".g:Text_Editing_Leader."Q :qa!<CR>"
exe "nnoremap ".g:Text_Editing_Leader."tu :let g:autoreadargs={'autoread':1}<CR>:execute WatchForChanges('*',autoreadargs)<CR>"
exe "nnoremap ".g:Text_Editing_Leader."tm :call ToggleMouse()<CR>"
exe "nnoremap ".g:Text_Editing_Leader."rt :retab<CR>"
exe "nnoremap ".g:Text_Editing_Leader."o o<ESC>k"
exe "nnoremap ".g:Text_Editing_Leader."O O<ESC>j"
exe "nnoremap ".g:Text_Editing_Leader."j o<ESC>"
exe "nnoremap ".g:Text_Editing_Leader."k O<ESC>"
exe "nnoremap ".g:Text_Editing_Leader."J 2o<ESC>"
exe "nnoremap ".g:Text_Editing_Leader."K 2O<ESC>"
exe "nnoremap ".g:Text_Editing_Leader.". ."
" set the spell check
" a stands for add, c stands for correcting
exe "nnoremap ".g:Text_Editing_Leader."ts :setlocal spell!<CR>"
exe "nnoremap ".g:Text_Editing_Leader."s. ]s"
exe "nnoremap ".g:Text_Editing_Leader."s, [s"
exe "nnoremap ".g:Text_Editing_Leader."ss z=1<CR><CR>"
exe "nnoremap ".g:Text_Editing_Leader."sa zg"
exe "nnoremap ".g:Text_Editing_Leader."sc z="
exe "nnoremap ".g:Text_Editing_Leader."c. ]c"
exe "nnoremap ".g:Text_Editing_Leader."c, [c"
exe "nnoremap ".g:Text_Editing_Leader."dr :diffg RE<CR>:diffupdate<CR>"
exe "nnoremap ".g:Text_Editing_Leader."db :diffg BA<CR>:diffupdate<CR>"
exe "nnoremap ".g:Text_Editing_Leader."dl :diffg LO<CR>:diffupdate<CR>"
exe "nnoremap ".g:Text_Editing_Leader."du :diffupdate<CR>"
exe "nnoremap ".g:Text_Editing_Leader."d. /<<<<<CR>:noh<CR>+"
exe "nnoremap ".g:Text_Editing_Leader."d, 2?<<<<<CR>:noh<CR>+"

" clean the trailing white spaces
" provided by better-whitespace
exe "nnoremap ".g:Text_Editing_Leader."cws :StripWhitespace<CR>"

" toggle hexmode
" can't use hm here as g:Text_Editing_Leader.h is used
exe "nnoremap ".g:Text_Editing_Leader."bm :Hexmode<CR>"

exe "nnoremap ".g:Text_Editing_Leader.'p "*p'
exe "vnoremap ".g:Text_Editing_Leader.'p "*p'
exe "vnoremap ".g:Text_Editing_Leader.'y "*y'

" ==============================================================================
"                            Global Commands
" ==============================================================================
" the ! after command told vim to overwrite the previous defined command
" this helps to avoid vim from issuing errors on commands already exist when
" reload vimrc
command! SVRC !subl ~/dotfiles/vimrc
command! SVPI !subl ~/dotfiles/vim/bundle/
command! SVIM !subl ~/dotfiles/vim
command! VRC edit ~/dotfiles/vimrc
command! VRL source ~/dotfiles/vimrc
" command WWW w !sudo -s "cat > %"
command! WWW w !sudo tee % >/dev/null

" ------------------------------------------------------------------------------
"                           Command Abbervations
"-------------------------------------------------------------------------------
" By using abbervation we may define commands start with lowercase letter
cnoreabbrev j J
cnoreabbrev ; !

" ==============================================================================
"                            Auto Commands
" ==============================================================================

" place the cursor to the last open position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                                                \| exe "normal! g'\"" | endif
endif

" remove the trailing white space before write
" should be done in a cleaver way, there may be files do need a trailing
" white space at the end
" autocmd BufWritePre * :%s/\s\+$//e


" ==============================================================================
"                            Plugin Settings
" ==============================================================================

" the tagbar
" please don't sort the tags by name....
let g:tagbar_sort=0
"let g:tagbar_left=1

" the nerd-commenter
let g:NERDSpaceDelims = 1 "So we have padding spaces
let g:NERDDahuangSexyComs = 1 "So we have my preferred sexy comments

" airline settings
let g:airline_theme='light'
" just don't include the error and warning messages in the statusbar atm
let g:airline_section_error=''
let g:airline_section_warning=''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_section_c = '%n-%f%r%m'


" CtrlP
" Use a as an leader, f stands for find here
exe "let g:ctrlp_map ='".g:Text_Editing_Leader."f'"
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_show_hidden = 1
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.jpg,*.png
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " ag makes ctrlp ridiculously faster omg
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" esaymotion
let g:EasyMotion_do_mapping = 0


" emmet
" some changes for emmet -- an editor for html --Sun Feb  8 02:55:52 HKT 2015
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

" YCM
let g:ycm_global_ycm_extra_conf = '~/dotfiles/vim/bundle/YouCompleteMe/
                            \third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_whitelist ={  'c'      : 1,
                                \'cpp'    : 1,
                                \'cuda'   : 1,
                                \'python' : 1,
                                \'java' : 1}

let g:ycm_warning_symbol = '->'
let g:ycm_complete_in_comments = 1

" markdown
let g:vim_markdown_math=1

" hexmode
" The files that would be treated as binary files and opened in hex mode
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.npy,*.png'

" rooter
" behavior for non-project files -- same as autochdir
let g:rooter_change_directory_for_non_project_files = 'current'

" pathogen
" the pathogen disable list
" Should be called at the end to make sure all the modification done in this
" file take effect
execute pathogen#infect()

" ==============================================================================
"                            My Functions
" ==============================================================================

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunction

" absolutely uselessly ... we have <C-]> to get you out of completion mode...
"function! DeleteLine()
"    " check the current cursor position
"    if col('.') == 1
"        " before delete to that line, get the number of cols first
"        normal! k
"        let s:num_cols = col('$')
"        exe "normal! j0i\<BS>\<ESC>"
"        if col('$') == s:num_cols
"            startinsert!
"        else
"            normal! l
"            startinsert
"        endif
"        unlet s:num_cols
"    else
"        normal! d0x
"        startinsert
"    endif
"endfunction
"inoremap <C-B> <ESC>:call DeleteLine()<CR>

" start the nerdtree if there is no file opened
" the function will be called after all other plugins has been loaded
function! CheckStartupStatus()
    if @% == ""
        NERDTree
    endif
endfunction
autocmd VimEnter * call CheckStartupStatus()

" Set the current dir to git root if in git repo
" otherwise autochdir


function! ToggleProgrammingEnv()
    let s:tagbarwinnr = bufwinnr("__Tagbar__")
    let s:nerdtreewinnr = bufwinnr("NERD_tree_1")
    if s:tagbarwinnr != -1 && s:nerdtreewinnr != -1 ||
      \s:tagbarwinnr == -1 && s:nerdtreewinnr == -1
        NERDTreeToggle
        TagbarToggle
    elseif s:tagbarwinnr == -1
        TagbarToggle
    elseif s:nerdtreewinnr == -1
        NERDTreeToggle
    endif
endfunction

"counting chinese characters
function! CountingChineseCharacters()
    exe '%s/\S/&/gn'
endfunction
exe "nnoremap ".g:Text_Editing_Leader."cc :call CountingChineseCharacters()<CR>"

" source local setting
" make it the last to wait for plugins
if filereadable(expand("$HOME/dotfiles/local_config/vimrc_after_plugin"))
    source $HOME/dotfiles/local_config/vimrc_after_plugin
endif

