":::'###:::::::::::::'##::::'##:'####:'##::::'##:'########:::'######::
"::'## ##:::::::::::: ##:::: ##:. ##:: ###::'###: ##.... ##:'##... ##:
":'##:. ##::::::::::: ##:::: ##:: ##:: ####'####: ##:::: ##: ##:::..::
"'##:::. ##:'#######: ##:::: ##:: ##:: ## ### ##: ########:: ##:::::::
" #########:........:. ##:: ##::: ##:: ##. #: ##: ##.. ##::: ##:::::::
" ##.... ##:::::::::::. ## ##:::: ##:: ##:.:: ##: ##::. ##:: ##::: ##:
" ##:::: ##::::::::::::. ###::::'####: ##:::: ##: ##:::. ##:. ######::
"..:::::..::::::::::::::...:::::....::..:::::..::..:::::..:::......:::

"#####################################################################
"#
"#
"#
"#
"#
"#####################################################################
"basic setting "{{{
let $PATH="~/bin:/local/usr/bin:/".$PATH
set cscopequickfix=g-
set shellslash
set t_Co=256
set nocompatible              " be improved, required
set autoindent
set ruler
set relativenumber
set hlsearch
set showcmd
setlocal foldmethod=marker
filetype off                  " required
" set the runtime path to include Vundle and initialize
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" set chinese
set encoding=UTF-8
set fileencodings=utf-8,gb18030,gbk,gk2312
set mouse=a
set cursorline
"set termencoding=utf-8
"set langmenu=zh_CN.UTF-8
"set fileencoding=utf-8
"set spell
"set spelllang=en_us
"set tabstop=1
"}}}

"#####################################################################
"#
"# Vundle
"#
"#####################################################################
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/jiangmiao/auto-pairs.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/Shougo/vimshell.vim.git'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'https://github.com/jalvesaq/Nvim-R.git'
Plugin 'https://github.com/morhetz/gruvbox.git'
Plugin 'https://github.com/altercation/solarized.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/vimproc.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'w0rp/ale'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'mbbill/undotree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'klen/python-mode'
Plugin 'mhinz/vim-startify'
if has("gui_running")
	Plugin 'ryanoasis/vim-devicons'
else
	Plugin 'edkolev/tmuxline.vim'
endif
"Plugin 'cosminadrianpopescu/vim-sql-workbench'
call vundle#end()


"#####################################################################
"#
"#  startify
"#
"#####################################################################

let g:startify_custom_header=[
			\'               ___           ___                       ___           ___           ___     ',
			\'              /\  \         /\__\          ___        /\__\         /\  \         /\  \    ',
			\'             /::\  \       /:/  /         /\  \      /::|  |       /::\  \       /::\  \   ',
			\'            /:/\:\  \     /:/  /          \:\  \    /:|:|  |      /:/\:\  \     /:/\:\  \  ',
			\'           /::\~\:\  \   /:/__/  ___      /::\__\  /:/|:|__|__   /::\~\:\  \   /:/  \:\  \ ',
			\'          /:/\:\ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ /:/\:\ \:\__\ /:/__/ \:\__\ ',
			\'          \/__\:\/:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / \/_|::\/:/  / \:\  \  \/__/',
			\'               \::/  /   |:|__/:/  /  \::/__/           /:/  /     |:|::/  /   \:\  \      ',
			\'               /:/  /     \::::/__/    \:\__\          /:/  /      |:|\/__/     \:\  \     ',
			\'              /:/  /       ~~~~         \/__/         /:/  /       |:|  |        \:\__\    ',
			\'              \/__/                                   \/__/         \|__|         \/__/    ',
			\]


"#####################################################################
"#
"#  YouCompleteMe
"#
"#####################################################################
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'

"nnoremap <leader>gl :YcmCompleter GoToDeclaration<cr>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<cr>

"#####################################################################
"#
"#  UltiSnips
"#
"#####################################################################
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"#####################################################################
"#
"#  airline
"#
"#####################################################################
let g:airline#extensions#tabline#enabled=1
" set the arrow of powerline
if !has("gui_running")
	let g:airline_powerline_fonts=1
endif

"#####################################################################
"#
"#  NERDTree
"#
"#####################################################################
" set the width and position of NERDTree
let g:NERDTreeWinSize=25
let g:NERDTreeWinPos='left'
let g:NERDTreeHijackNetrw = 0



"#####################################################################
"#
"#  undotree
"#
"#####################################################################
"undotree
let g:undotree_WindowLayout=3
let g:undotree_SplitWidth=30

"#####################################################################
"#
"#  indentLine
"#
"#####################################################################
let g:indentLine_char='¦'

"#####################################################################
"#
"#  ctrlp
"#
"#####################################################################
if executable("ag")
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


"#####################################################################
"#
"#  ctrlsf
"#
"#####################################################################
"setting ag command as the default search command
let g:ctrlsf_ackprg='ag'

if executable("ag")
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"#####################################################################
"#
"#  autoformat
"#
"#####################################################################
"noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat

"#####################################################################
"#
"#  tagbar
"#
"#####################################################################
"tagabr
let g:tagbar_left=1
let g:tagbar_width=25
let g:tagbar_autopreview=1

"#####################################################################
"#
"#  emmet
"#
"#####################################################################
let g:user_emmet_install_global = 1
autocmd FileType js,html,css EmmetInstall
"let g:user_emmet_mode='n'    "only enable normal mode functions.
"let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

"#####################################################################
"#
"#  ale
"#
"#####################################################################
let g:ale_set_loclist=0
let g:ale_set_quickfix=1

"#####################################################################
"#
"#  keyblind
"#
"#####################################################################
"switch tab
noremap <Leader>bn :bn<cr>
noremap <Leader>bp :bp<cr>
noremap <Leader>bd :bd<cr>

" noremap <space>g :silent execute "grep! -r" . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
" operatoring about quickfix
noremap <leader>cn :cn<cr>
noremap <Leader>cp :cp<cr>
noremap <Leader>co :copen<cr>

"NERDTree
noremap <Leader>n :NERDTree<cr>
"TagbarToggle
noremap <Leader>t :TagbarToggle<cr>
" map / <Plug>(incsearch-forward)
" map ? <Plug>(incsearch-backward)

noremap <Leader>ev :e ~/a-vim/.vimrc<cr>
noremap <Leader>sv :source ~/.vimrc<cr>

nmap <Leader>z <Plug>Zeavim
vmap <Leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <Leader><Leader>z <Plug>ZVKeyDocset


"#####################################################################
"#
"#  gui settting
"#
"#####################################################################
let g:ctrlp_show_hidden = 1
if has("gui_running")
	colorscheme solarized
	:set background=dark
	:set guioptions-=r
	:set guioptions-=L "remove the scroll bar
	:set guioptions-=m "remove the menu bar
	:set guioptions-=T "remove the tab bar
	:set guifont=Monaco
	let g:tagbar_iconchars = ['▸', '▾']
	"let g:tagar_previewwin_pos="rightbelow"
	let g:fullscreen = 0
	function! ToggleFullscreen()
		if g:fullscreen == 1
			let g:fullscreen = 0
			let mod = "remove"
		else
			let g:fullscreen = 1
			let mod = "add"
		endif
		call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
	endfunction

	map <silent> <F11> :call ToggleFullscreen()<CR>
else
	highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
	"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
	let g:NERDTreeDirArrowExpandable='|+'
	let g:NERDTreeDirArrowCollapsible='|-'

endif

"#####################################################################
"#
"#  autocmd
"#
"#####################################################################
autocmd vimenter *
			\ if !argc()
			\  | Startify
			\ | NERDTree
			\ | endif
"autocmd vimenter * Tagbar
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

