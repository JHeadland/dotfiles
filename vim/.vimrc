" ---- Vundle Settings ------------

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'suan/vim-instant-markdown'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

" To install plugins through Vundle, run the commands:
" :PluginInstall

syntax on						" syntax coloring
set number						" show line numbers
set autoindent					" auto indent upon new line
set linebreak					" line wrap doesn't wrap mid-word
set breakindent					" word wrap takes indentation into account
set hlsearch					" highlights search results
set mouse=a						" makes the mouse usable
set tabstop=4					" tabs are 4 spaces
set shiftwidth=4				" number of space characters used for indentation
set whichwrap=b,s,<,>,h,l,[,] 	" traverse line breaks with navigation keys
filetype plugin on

" ---- Key mappings ---------------------

" Ctrl+n toggles the NERDTree side menu
map <C-n> :NERDTreeToggle<CR>

" Move between open windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"imap <C-c> <CR><Esc>O

" NERD Commenter add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:ctrlp_show_hidden = 1

" Use command :InstantMarkdownPreview to view live md preview instead of
let g:instant_markdown_autostart = 0

" Vim-Notes
"let g:notes_directories = ['~/Documents/Notes']
"let g:notes_suffix = '.note'
"let g:notes_markdown_program = 'markdown_py'
"let g:notes_conceal_url = 0

" Vimwiki directories
let g:vimwiki_list = [{'path':'~/Documents/vimwiki', 'path_html':'~/Documents/vimwiki/html'}]

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
set noshowmode 	" don't show mode indicator
:let g:airline_theme='distinguished' " default theme
let g:airline_powerline_fonts=1 " set airline to use powerline fonts/symbols
let g:airline#extensions#tabline#enabled = 1 " display all buffers at top
let g:airline#extensions#tabline#buffer_nr_show = 1 " display buffer number
" leave insert mode quickly
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
