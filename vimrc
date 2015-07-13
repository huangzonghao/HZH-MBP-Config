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

"set list
"set listchars=tab:\ \ ,trail:.
"set autoread

set more    " Use more prompt
"+++++++++++ Global Behavior Settings ++++++++++
" Note the settings for specific file type should go to ftplugin
set backspace=2      "because of the stupid vim7.4
set showcmd
"set mouse=a
set tabstop=4
set shiftwidth=4        "this sets 4 spaces for each indention
"set expandtab




"+++++++++++ Global Keymappings ++++++++++
let mapleader=","
imap <F1> <Esc>:up<CR>
imap <C-V> <S-Insert>
imap <C-L> <space><space><space><space>

nmap <leader>sa :up<CR>
nmap <leader>sw :wq<CR>
nmap <leader><leader> :q<CR>
nmap <leader>w :qa<CR>
nmap <leader>WW :q!<CR>
nmap <leader>Wa :qa!<CR>
nmap <leader>th :noh<CR>
nmap <leader>au :let g:autoreadargs={'autoread':1}<CR>:execute WatchForChanges("*",autoreadargs)<CR>
nmap th <C-W>h
nmap tn <C-W>l
nmap tj <C-W>j
nmap tk <C-W>k
nmap <C-L> gt
nmap <C-H> gT
nmap <F1> :up<CR>
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

vmap j gj
vmap k gk
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
nmap <leader>tb :TagbarToggle<CR>
"let g:tagbar_left=1

"the nerdtree
nmap <leader>tt :NERDTreeToggle<CR>

"load the full environment
nmap <leader>. :NERDTreeToggle<CR><c-w>l:TagbarToggle<CR>


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
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" the pathogen disable list
let g:pathogen_disabled = ['clang_complete']
"let g:clang_library_path='/Users/huangzonghao/.vim/bundle/clang_complete/plugin'

" this is the configuration of the libclang for the clang_complete
"let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
"if isdirectory(s:clang_library_path)
		"let g:clang_library_path=s:clang_library_path
"endif

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
endfunc
nmap <leader>tm :call ToggleMouse()<CR>
