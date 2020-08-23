" ---- Vundle Settings ------------

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
    " Ctrl+n toggles the NERDTree side menu
    map <C-n> :NERDTreeToggle<CR>

Plugin 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

Plugin 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_show_hidden = 1 " Shows hidden files

Plugin 'Valloric/YouCompleteMe'
    let g:ycm_show_diagnostics_ui = 0 " For compatibility with syntastic
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"Plugin 'rdnetto/YCM-Generator'

Plugin 'scrooloose/syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_mode_map = {'passive_filetypes': ['tex']} " ignore latex

Plugin 'sheerun/vim-polyglot'

Plugin 'Raimondi/delimitMate'

Plugin 'vim-airline/vim-airline'
    set noshowmode  " don't show mode indicator in command line
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

Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='distinguished'

Plugin 'mattn/emmet-vim'
    let g:user_emmet_install_global = 0 " Enable just for html/css
    autocmd FileType html,css EmmetInstall
    let g:user_emmet_leader_key='<C-Z>' " Remap trigger key to Ctrl+z , (comma)

Plugin 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    "let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'

Plugin 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsSnippetsDir="~/.vim/snips"
    let g:UltiSnipsSnippetDirectories=["snips"]

Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'
    set conceallevel=0 " set to 2 if you want conceal
    let g:vim_markdown_folding_disabled = 1

Plugin 'suan/vim-instant-markdown'
    " Use command :InstantMarkdownPreview to view live md preview instead
    let g:instant_markdown_autostart = 0

Plugin 'lervag/wiki.vim'
    let g:wiki_root='~/Documents/Notes'
    let g:wiki_filetypes=['md']
    let g:wiki_link_target_type='md'

Plugin 'ryanoasis/vim-devicons'
    set guifont=DejavuSansMono\ Nerd\ Font\ 12

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

call vundle#end()
filetype plugin indent on

" To install plugins through Vundle, run the commands:
" :so ~/.vimrc
" :PluginInstall

" ---- General Settings ----------------

syntax on                       " syntax coloring
set number                      " show line numbers
set autoindent                  " auto indent upon new line
set linebreak                   " line wrap doesn't wrap mid-word
set breakindent                 " word wrap takes indentation into account
set hlsearch                    " highlights search results
set ignorecase                  " case insensitive searching
set smartcase                   " lower case search insensitive
set incsearch                   " incremental search
set mouse=a                     " makes the mouse usable
set tabstop=4                   " tabs are 4 spaces
set shiftwidth=4                " number of space characters used for indentation
set expandtab                   " pressing Tab key inserts spaces
set whichwrap=b,s,<,>,h,l,[,]   " traverse line breaks with navigation keys
filetype plugin on

" ---- Key mappings ---------------------

nnoremap H ^
nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>

" Move between tiles
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"imap <C-c> <CR><Esc>O
