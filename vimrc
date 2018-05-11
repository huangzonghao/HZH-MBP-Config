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
let g:Text_Editing_Leader = '<Space>'
let mapleader = g:Programming_Leader
" ------------------------------------------------------------------------------
"                       Reserved for Plugins
"-------------------------------------------------------------------------------
" These key-mappings shall be set in plugin buffer-wise
" <C-E>
" ------------------------------------------------------------------------------
"                              Bare Keymappings
"-------------------------------------------------------------------------------
" this mapping is important for column insertion
" make sure to trigger the insertleave autocommand with <c-c>
inoremap <C-C> <ESC>
nnoremap <C-C> <ESC>

nnoremap ; :
vnoremap ; :
nnoremap u O
nnoremap U u
nnoremap * *N

imap <C-_> <Plug>IMAP_JumpForward
nmap <C-_> <Plug>IMAP_JumpForward

" this brings up a history command window
cnoremap <C-O> <C-F>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-N> <Down>
inoremap <C-P> <Up>
inoremap <C-Space> <C-N>
inoremap <C-J> <C-Left>
inoremap <C-K> <C-Right>

" use the following commands to change window size
" and arrows to navigate in normal mode
" nnoremap <C-H> h
" nnoremap <C-L> l
" nnoremap <C-N> j
" nnoremap <C-P> k
" we need to map f back and find another map for n
" so we can use n as a learder

nnoremap h <C-W>h
nnoremap l <C-W>l
nnoremap j <C-W>j
nnoremap k <C-W>k

nnoremap <C-W>m <C-W>_
nnoremap <C-W>w <C-W>=
nnoremap <C-W>k 2<C-W>-
" nnoremap <Up> 2<C-W>-
nnoremap <C-W>j 2<C-W>+
" nnoremap <Down> 2<C-W>+
" nnoremap <Left> 2<C-W><
" nnoremap <Right> 2<C-W>>
nnoremap <C-W>h 2<C-W><
nnoremap <C-W>l 2<C-W>>

" move a line downwards
nnoremap <C-J> :m .+1<CR>==
" move a line upwards
nnoremap <C-K> :m .-2<CR>=="
" join the current line upwards
" J is to join the current line downwards by default
nnoremap K kJ

nnoremap gtf <C-W>gf

" tab commands
" leader T
nnoremap TT :tabnew<CR>
nnoremap TC :tabclose<CR>
" this will close the tab and delete all the buffers
nnoremap TD :windo bdelete<CR>
nnoremap <C-L> gt
nnoremap <C-H> gT

" buffer commands -- b as leader
nnoremap bb  :buffers<CR>:buffer<Space>
nnoremap bd  :buffers<CR>:Bdelete<Space>
nnoremap bo  :Bdelete %<CR>
nnoremap bO  :Bdelete! %<CR>
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
nnoremap rg :reg<CR>

" disable the ex mode and have a short cut for recording
nnoremap Q @q

vnoremap j gj
vnoremap k gk

" note you cannot use noremap on <Plug> mappings
nmap t <Plug>(easymotion-w)
nmap e <Plug>(easymotion-b)
nmap w <Plug>(easymotion-e)
nmap - <Plug>(easymotion-bd-jk)
nmap m <Plug>(easymotion-ge)

vmap t <Plug>(easymotion-w)
vmap e <Plug>(easymotion-b)
vmap w <Plug>(easymotion-e)
vmap - <Plug>(easymotion-bd-jk)
vmap m <Plug>(easymotion-ge)
" vmap W <Plug>(easymotion-w)
" vmap B <Plug>(easymotion-b)
" vmap J <Plug>(easymotion-j)
" vmap K <Plug>(easymotion-k)
" vmap E <Plug>(easymotion-e)

" switch f and n for better experience
" It's actually stupid to have both / and ? for searching. As / + N (or F
" after mapping) is already that.
" So we use ? as the leader to take mappings passed by iterm
noremap n f
noremap N F
noremap f n
noremap F N

nnoremap zz z-

" ------------------------------------------------------------------------------
"                           Programming Keymappings
"-------------------------------------------------------------------------------
"****************************** Toggles ****************************************
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>r :NERDTreeToggle<CR>
nnoremap <leader>. :call ToggleProgrammingEnv()<CR>

let g:ycm_key_detailed_diagnostics = "<leader>si"

"*************************** Toggles end ***************************************
nnoremap <leader>sf :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>sd :YcmDiags<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yc :YcmDiags<CR>
nnoremap <leader>gt :GoTo<CR>

" go downwards to tag
nnoremap <leader>d <C-]>
" go upwards and back
nnoremap <leader>u <C-T>

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
nnoremap <Space>a :q<CR>
" close the preview window
nnoremap <Space>x :pc<CR>
nnoremap <Space>nh :noh<CR>

nnoremap <Space>sd :!subl .<CR><CR>
nnoremap <Space>sf :!subl %<CR><CR>

" the function is provide by CVim
nnoremap <Space>id : call C_InsertDateAndTime('d')<CR>a
nnoremap <Space>u  :up<CR>
nnoremap <Space>U  :w!<CR>
nnoremap <Space>w  :wq<CR>
nnoremap <Space>W  :w!q<CR>
nnoremap <Space>; :q!<CR>
nnoremap <Space>q :qa<CR>
nnoremap <Space>Q :qa!<CR>
nnoremap <Space>tu :let g:autoreadargs={'autoread':1}<CR>:execute WatchForChanges('*',autoreadargs)<CR>
nnoremap <Space>tm :call ToggleMouse()<CR>
nnoremap <Space>rt :retab<CR>
" to refresh the file
nnoremap <Space>rr :e<CR>
nnoremap <Space>j o<ESC>k
nnoremap <Space>k O<ESC>j<C-E>
" nnoremap <Space>J 2o<ESC>
" nnoremap <Space>K 2O<ESC>2<C-E>
" nnoremap <Space>. .
" set the spell check
" a stands for add, c stands for correcting
nnoremap <Space>ts :setlocal spell!<CR>
nnoremap c. ]s
nnoremap c, [s
" correction recommendations
nnoremap cr z=
" correct it
nnoremap c<Space> z=1<CR><CR>
nnoremap ca zg
" nnoremap <Space>ss z=1<CR><CR>
" nnoremap <Space>sa zg
" nnoremap <Space>sc z=
nnoremap d. ]c
nnoremap d, [c

" think of a way to set this commands to diff buffer only
nnoremap d' :.diffput<CR>:diffupdate<CR>
nnoremap dc :.diffget<CR>:diffupdate<CR>
nnoremap dr :diffg RE<CR>:diffupdate<CR>
nnoremap db :diffg BA<CR>:diffupdate<CR>
nnoremap dl :diffg LO<CR>:diffupdate<CR>
nnoremap du :diffupdate<CR>

nnoremap g. /<<<<<CR>:noh<CR>+
nnoremap g, 2?<<<<<CR>:noh<CR>+

" wrap graph
nnoremap <Space>g gwip

" clean the trailing white spaces
" provided by better-whitespace
nnoremap <Space>cws :StripWhitespace<CR>

" toggle hexmode
" can't use hm here as <Space>h is used
nnoremap <Space>bm :Hexmode<CR>

" nnoremap <Space>*p
" vnoremap <Space>*p
" vnoremap <Space>*y

" ------------------------------------------------------------------------------
"                        Keymapping Sequences for ITERM
"-------------------------------------------------------------------------------

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
let g:ctrlp_map = '<Space>f'
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
let g:EasyMotion_keys ='AOEUIDPYFGCRL,.JXMWKBSHNT'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_do_shade = 0


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
                                \'matlab' : 1,
                                \'java'   : 1}

let g:ycm_warning_symbol = '->'
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" stop vim from poping preview window while completing code
set completeopt-=preview

" markdown
let g:vim_markdown_math=1

" autopair
let g:AutoPairs = {'(':')', '[':']', '{':'}'}

" hexmode
" The files that would be treated as binary files and opened in hex mode
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.npy,*.png'

" rooter
" behavior for non-project files -- same as autochdir
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1

" nerdTree
let NERDTreeIgnore=['\.o$', 
                  \ '\~$', 
                  \ '\.class$', 
                  \ '\.mat$', 
                  \ '\.png$',
                  \ '^tags$',
                  \ '\.mex']

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
nnoremap <Space>cc :call CountingChineseCharacters()<CR>

" source local setting
" make it the last to wait for plugins
if filereadable(expand("$HOME/dotfiles/local_config/vimrc_after_plugin"))
    source $HOME/dotfiles/local_config/vimrc_after_plugin
endif

