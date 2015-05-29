" +++++++++++ Environment Settings ++++++++++
syntax on
filetype on
filetype plugin on
filetype plugin indent on
colorscheme slate
set number
set ruler
set cursorline

"+++++++++++ Global Behavior Settings ++++++++++
" Note the settings for specific file type should go to ftplugin
set backspace=2      "because of the stupid vim7.4
set showcmd
"set mouse=a
set tabstop=4
"set expandtab




"+++++++++++ Global Keymappings ++++++++++
let mapleader=","
imap <F1> <Esc>:up<CR>
nmap <F1> :up<CR>

nmap <leader>sa :up<CR>
nmap <leader>sw :wq<CR>
nmap <leader>w :q<CR>
nmap <leader>W :q!<CR>
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

nnoremap <F6> :e<CR>

"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==

nnoremap j gj
nnoremap k gk
nnoremap J 5gj
nnoremap K 5gk
vmap j gj
vmap k gk

nnoremap W 5w
nnoremap B 5b

nnoremap <F9> :!open .<CR><CR>

imap <c-v> <S-Insert>



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
nmap <leader>tg :TagbarToggle<CR>
"let g:tagbar_left=1

"the nerdtree
nmap <leader>nt :NERDTreeToggle<CR>

"load the full environment
nmap <leader>. :NERDTreeToggle<CR><c-w>l:TagbarToggle<CR>



" the pathogen disable list
let g:pathogen_disabled = ['clang_complete']
"let g:clang_library_path='/Users/huangzonghao/.vim/bundle/clang_complete/plugin'

" this is the configuration of the libclang for the clang_complete
"let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
"if isdirectory(s:clang_library_path)
		"let g:clang_library_path=s:clang_library_path
"endif

" the vim pathogen package manager
execute pathogen#infect()
