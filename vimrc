" ==============================================================================
"                            Environment Settings
" ==============================================================================
let g:C_FormatDate = '%a %b %d, %y'

syntax on
filetype on
filetype plugin on
filetype plugin indent on

colorscheme slate

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
set autochdir               " automatically change the current dir
set shortmess=atI           " sorry i am just a student withno money...


" ==============================================================================
"                            Global Keymappings
" ==============================================================================
let g:Programming_Leader = ','
let g:Text_Editing_Leader = '<Space>'
let mapleader = g:Programming_Leader
" ------------------------------------------------------------------------------
"                              Bare Keymappings
"-------------------------------------------------------------------------------
inoremap <F1> <Esc>:up<CR>
" make sure to trigger the insertleave autocommand with <c-c>
inoremap <C-C> <ESC>
inoremap <C-V> <S-Insert>
inoremap <C-L> <space><space><space><space>
imap <C-Space> <Plug>IMAP_JumpForward
inoremap <C-E> <C-]><C-U>
inoremap <C-F> <Right>
inoremap <C-B> <Left>

nnoremap <C-N>t :tabnew<CR>
nnoremap h <C-W>h
nnoremap l <C-W>l
nnoremap j <C-W>j
nnoremap k <C-W>k
nnoremap J j
nnoremap K k
nnoremap <C-L> gt
nnoremap <C-H> gT
nnoremap <F1> :up<CR>
nnoremap ; :
"nnoremap <F6> :e<CR>
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>=="

" nnoremap j gj
" nnoremap k gk
nnoremap <F9> :!open .<CR><CR>
nnoremap gtf <C-W>gf

" buffer commands -- b as leader
nnoremap bb :buffers!<CR>:buffer<Space>
nnoremap bd :buffers!<CR>:bdelete<Space>
nnoremap L  :bnext<CR>
nnoremap H  :bprevious<CR>
nnoremap bsn :sbnext<CR>
nnoremap bsp :sbprevious<CR>
nnoremap bsb :buffers<CR>:sb<Space>
nnoremap bcs :new<CR>
nnoremap bcv :vnew<CR>
nnoremap bmm :bm<CR>
nnoremap bms :sbm<CR>


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

" ------------------------------------------------------------------------------
"                           Programming Keymappings
"-------------------------------------------------------------------------------
"****************************** Toggles ****************************************
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
" load the full environment
nnoremap <leader>. :NERDTreeToggle<CR><c-w>l:TagbarToggle<CR>
" So the toggles: bar: tb; tree: tt; mouse: tm;
" toggle errors
"nnoremap <leader>te :call ToggleSyntasticErrorsPanel()<CR>
"nnoremap <leader>ts :call SyntasticToggleMode()<CR>
" to toggle the error list; function provided by ycm
let g:lt_location_list_toggle_map = "<leader>te"
let g:lt_quickfix_list_toggle_map = "<leader>tq"

"*************************** Toggles end ***************************************
" a single check
"nnoremap <leader>sc :call SyntasticCheck()<CR>
"nnoremap <leader>sr :call SyntasticReset()<CR>
nnoremap <leader>sf :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>sd :YcmDiags<CR>
let g:ycm_key_detailed_diagnostics = "<leader>si"
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yc :YcmDiags<CR>
nnoremap <leader>gt :GoTo<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ea <Plug>(EasyAlign)

" ------------------------------------------------------------------------------
"                           Text Editing Keymappings
"-------------------------------------------------------------------------------

nnoremap <Space>sd :!subl .<CR><CR>
nnoremap <Space>sf :!subl %<CR><CR>


" the function is provide by CVim
nnoremap <Space>id :call C_InsertDateAndTime('d')<CR>a
nnoremap <Space>ww :up<CR>
nnoremap <Space>wq :wq<CR>
nnoremap <Space><Space> :q<CR>
nnoremap <Space>qq :qa<CR>
nnoremap <Space>Q :q!<CR>
nnoremap <Space>qQ :qa!<CR>
nnoremap <Space>h :noh<CR>
nnoremap <Space>tu :let g:autoreadargs={'autoread':1}<CR>
                  \:execute WatchForChanges("*",autoreadargs)<CR>
nnoremap <Space>tm :call ToggleMouse()<CR>
nnoremap <Space>rt :retab<CR>
nnoremap <Space>o o<ESC>k
nnoremap <Space>O O<ESC>
nnoremap <Space>j o<ESC>
nnoremap <Space>k O<ESC>
nnoremap <Space>J 2o<ESC>
nnoremap <Space>K 2O<ESC>
nnoremap <Space>r .
" set the spell check
" a stands for add, c stands for correcting
nnoremap <Space>ts :setlocal spell!<CR>
nnoremap <Space>s. ]s
nnoremap <Space>s, [s
nnoremap <Space>sa zg
nnoremap <Space>sc z=

" clean the trailing white spaces
" provided by better-whitespace
nnoremap <Space>cws :StripWhitespace<CR>


" ==============================================================================
"                            Global Commands
" ==============================================================================
command VRC !subl ~/dotfiles/vimrc
command VPI !subl ~/dotfiles/vim/bundle/
command VIM !subl ~/dotfiles/vim
" command WWW w !sudo -s "cat > %"
command WWW w !sudo tee % >/dev/null


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

" the powerline
let g:Powerline_symbols = 'fancy'

" the tagbar
" please don't sort the tags by name....
let g:tagbar_sort=0
"let g:tagbar_left=1

" the nerd-commenter
let NERDSpaceDelims = 1 "So we have padding spaces


" CtrlP
let g:ctrlp_map = '<Space>f'    " f stands for find here
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_show_hidden = 1
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.jpg,*.png

" synstastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" only enable it when we want
let g:syntastic_mode_map = {"mode": "passive" }
function! ToggleSyntasticErrorsPanel()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction


" powerline
let g:Powerline_colorscheme = 'solarized256'


" CVim time format, we need this setting for the general time insertion
let g:C_FormatDate            = '%c'
let g:C_FormatTime            = '%H:%M'

" esaymotion
let g:EasyMotion_do_mapping = 0


" emmet
" some changes for emmet -- an editor for html --Sun Feb  8 02:55:52 HKT 2015
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" YCM
let g:ycm_global_ycm_extra_conf = '~/dotfiles/vim/bundle/YouCompleteMe/
                            \third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_whitelist = { 'c': 1,
                                \'cpp': 1,
                                \ 'cuda':1,
                                \ 'python':1}

let g:ycm_warning_symbol = '->'
let g:ycm_complete_in_comments = 1

" pathogen
" the pathogen disable list
let g:pathogen_disabled = ['better-whitespace, syntastic']
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

