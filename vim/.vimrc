" Plugins installed though pacman:
" vim-nerdtree
" vim-ctrlp
" vim-instant-markdown
" vim-vimwiki
" Plugins installed	in ~/.vim/pack/plugins/start/:
" YouCompleteMe
" vim-autoclose

syntax on			" syntax coloring
set number			" show line numbers
set autoindent		" auto indent upon new line
set linebreak		" line wrap doesn't wrap mid-word
set breakindent		" word wrap takes indentation into account
set hlsearch		" highlights search results	
set mouse=a			" makes the mouse usable
set tabstop=4		" tabs are 4 spaces
filetype plugin on

set shiftwidth=4	" number of space characters used for indentation
:command ICS set expandtab | retab

set whichwrap=b,s,<,>,h,l,[,] " traverse line breaks with navigation keys

" ---- Key mappings ---------------------

" Ctrl+n toggles the NERDTree side menu
map <C-n> :NERDTreeToggle<CR>

" Move between open windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"imap <C-c> <CR><Esc>O

let g:ctrlp_show_hidden = 1
let g:instant_markdown_autostart = 0
let g:vimwiki_list = [{'path':'~/Documents/vimwiki', 'path_html':'~/Documents/vimwiki/html'}]
let g:powerline_pycmd="py3"
