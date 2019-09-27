set nocompatible              " required
filetype off                  " required

syntax enable
set background=dark
if has('nvim')
	colorscheme NeoSolarized
	set termguicolors
else
	colorscheme solarized
endif

" misc options
filetype plugin indent on    " required
set number relativenumber

" PEP 8
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" PLUGINS
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" autocomplete
if (v:version > 7041577) || has('nvim')
	Plugin 'Valloric/YouCompleteMe'
	let g:ycm_autoclose_preview_window_after_completion=1
	map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
	let g:ycm_server_keep_logfiles = 1
endif
" color schemes
Plugin 'iCyMind/NeoSolarized'
Plugin 'lifepillar/vim-solarized8'
" LaTeX plugin
Plugin 'lervag/vimtex'
" syntax highlighting
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Python
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
" COMMANDS
" surround command
Plugin 'tpope/vim-surround'
" commentary command
Plugin 'tpope/vim-commentary'
" Fuzzy file find
Plugin 'kien/ctrlp.vim'
call vundle#end()            " required
