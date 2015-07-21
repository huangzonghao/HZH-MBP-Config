" +++++++++++ Environment Settings ++++++++++
syntax on
filetype on
filetype plugin on
filetype plugin indent on
colorscheme slate
set number
set ruler
set cursorline
set ttyfast "for fast terminal... but what the hell is this...
set scrolloff=5
set lazyredraw
set hlsearch
set incsearch     " show search matches as you type
set hidden    "then we don't have to save the file before shifting to
set nowrap        " don't wrap lines
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

set list
set listchars=tab:>.,trail:~,extends:#,nbsp:.

set more    " Use more prompt
"+++++++++++ Global Behavior Settings ++++++++++
" Note the settings for specific file type should go to ftplugin
set backspace=2      "because of the stupid vim7.4
set showcmd
set tabstop=4
set shiftwidth=4        "this sets 4 spaces for each indention
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set softtabstop=4 "delete 4 spaces at a time
set pastetoggle=<F2>




"+++++++++++ Global Keymappings ++++++++++
let mapleader=","
inoremap <F1> <Esc>:up<CR>
"make sure to trigger the insertleave autocommand with <c-c>"
inoremap <C-C> <ESC>
inoremap <C-V> <S-Insert>
inoremap <C-L> <space><space><space><space>
"simulate the behavior of <C-U> which has been disabled by YouCompleteMe
"inoremap <C-B> <ESC>d0xi<C-U>
inoremap <leader>id <ESC>o<ESC>:. !date<CR>i<BS><ESC>A

nnoremap <leader>sa :up<CR>
nnoremap <leader>sw :wq<CR>
nnoremap <leader><leader> :q<CR>
nnoremap <leader>w :qa<CR>
nnoremap <leader>WW :q!<CR>
nnoremap <leader>Wa :qa!<CR>
nnoremap <leader>th :noh<CR>
nnoremap <leader>au :let g:autoreadargs={'autoread':1}<CR>:execute WatchForChanges("*",autoreadargs)<CR>
nnoremap <leader>rt :retab<CR>
nnoremap th <C-W>h
nnoremap tn <C-W>l
nnoremap tj <C-W>j
nnoremap tk <C-W>k
nnoremap <C-L> gt
nnoremap <C-H> gT
nnoremap <F1> :up<CR>
nnoremap ; :
"nnoremap <F6> :e<CR>
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
nnoremap j gj
nnoremap k gk
nnoremap J 5gj
nnoremap K 5gk
nnoremap W 5w
nnoremap B 5b
nnoremap <F9> :!open .<CR><CR>
"nnoremap <leader>id o<ESC>:. !date<CR>i<BS><ESC>A

vnoremap j gj
vnoremap k gk

"So now do w!! once forget to sudo before editing
cmap w!! w !sudo tee % >/dev/null
"+++++++++++++++++++++++++++++++++++++++++


" some changes for emmet -- an editor for html --Sun Feb  8 02:55:52 HKT 2015
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"pandoc batch conversion
" for file in $(ls *.md); do pandoc -f markdown -t html "${file}" -o "${file%md}html"; done





"++++++++++ Some Functions +++++++++
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



"+++++++++ Plugin Settings ++++++++
"the powerline
let g:Powerline_symbols = 'fancy'

"the tagbar
nnoremap <leader>tb :TagbarToggle<CR>
"let g:tagbar_left=1

"the nerdtree
nnoremap <leader>tt :NERDTreeToggle<CR>

"load the full environment
nnoremap <leader>. :NERDTreeToggle<CR><c-w>l:TagbarToggle<CR>


"So the toggles: bar: tb; tree: tt; mouse: tm;

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_show_hidden = 1
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.jpg,*.png

"synstastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"only enable it when we want
let g:syntastic_mode_map = {"mode": "passive" }
function! ToggleSyntasticErrorsPanel()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
"toggle errors
nnoremap <leader>te :call ToggleSyntasticErrorsPanel()<CR>
nnoremap <leader>ts :call SyntasticToggleMode()<CR>
"a sigle check
nnoremap <leader>sc :call SyntasticCheck()<CR>
nnoremap <leader>sr :call SyntasticReset()<CR>

"powerline
let g:Powerline_colorscheme = 'solarized256'


" the pathogen disable list
let g:pathogen_disabled = ['']


" the vim pathogen package manager
" Should be called at the end to make sure all the modification done in this
" file take effect
execute pathogen#infect()


"++++++++++++++ my functions +++++++++++++
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
nnoremap <leader>tm :call ToggleMouse()<CR>

function! DeleteLine()
    " check the current cursor position
    if col('.') == 1
        exe "normal! i\<BS>\<ESC>"
        if col(".") == col("$")-1
            startinsert!
        else
            normal! l
            startinsert
        endif
    else
        normal! d0x
        startinsert
    endif
endfunction
inoremap <C-B> <ESC>:call DeleteLine()<CR>
