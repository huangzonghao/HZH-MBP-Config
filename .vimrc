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
imap <F1> <Esc>:up<CR>
nmap <F1> :up<CR>
nnoremap <F6> :e<CR>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

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
" the vim pathogen package manager
execute pathogen#infect()
"the powerline
let g:Powerline_symbols = 'fancy'
