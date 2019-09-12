" ---- Vundle Settings ------------

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'suan/vim-instant-markdown'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'
Plugin 'itchyny/calendar.vim'

call vundle#end()
filetype plugin indent on

" To install plugins through Vundle, run the commands:
" :so %
" :PluginInstall

syntax on						" syntax coloring
set number						" show line numbers
set autoindent					" auto indent upon new line
set linebreak					" line wrap doesn't wrap mid-word
set breakindent 				" word wrap takes indentation into account
set hlsearch					" highlights search results
set mouse=a						" makes the mouse usable
set tabstop=4					" tabs are 4 spaces
set shiftwidth=4				" number of space characters used for indentation
set whichwrap=b,s,<,>,h,l,[,] 	" traverse line breaks with navigation keys
filetype plugin on

" ---- Key mappings ---------------------

nnoremap H ^
nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>

" Ctrl+n toggles the NERDTree side menu
map <C-n> :NERDTreeToggle<CR>

" Move between tiles
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"imap <C-c> <CR><Esc>O

" NERD Commenter add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:ctrlp_show_hidden = 1

" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0 "for compatibility with syntastic

" Use command :InstantMarkdownPreview to view live md preview instead
let g:instant_markdown_autostart = 0

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
set noshowmode 	" don't show mode indicator in command line
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

" Emmet
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Remap trigger key to Ctrl+z , (comma)
let g:user_emmet_leader_key='<C-Z>'

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/snips"
let g:UltiSnipsSnippetDirectories=["snips"]

"Calendar
:nnoremap <leader>c :Calendar<CR>
