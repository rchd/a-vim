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

" set chinese
set encoding=UTF-8
set fileencodings=utf-8,gb18030,gbk,gk2312
set mouse=a
set cursorline
set nowrap
filetype off                  " required
" set the runtime path to include Vundle and initialize
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"set termencoding=utf-8
"set langmenu=zh_CN.UTF-8
"set fileencoding=utf-8
"set spell
"set spelllang=en_us
"set tabstop=1
"}}}

"#####################################################################
"#
"# common function
"#
"#####################################################################

function! StartifyCenter(lines) abort
	let longest_line=max(map(copy(a:lines),'strwidth(v:val)'))
	let centered_lines=map(copy(a:lines),
				\'repeat(" ",(&columns / 2)-(longest_line/2)).v:val')
	return centered_lines
endfunction

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

"#####################################################################
"#
"# Vundle
"#
"#####################################################################
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
Plugin 'fidian/hexmode'
Plugin 'mhinz/vim-startify'
Plugin 'liuchengxu/vim-which-key'
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
"let g:startify_padding_left=30
let s:header=[
			\'     ___           ___                       ___           ___           ___     ',
			\'    /\  \         /\__\          ___        /\__\         /\  \         /\  \    ',
			\'   /::\  \       /:/  /         /\  \      /::|  |       /::\  \       /::\  \   ',
			\'  /:/\:\  \     /:/  /          \:\  \    /:|:|  |      /:/\:\  \     /:/\:\  \  ',
			\' /::\~\:\  \   /:/__/  ___      /::\__\  /:/|:|__|__   /::\~\:\  \   /:/  \:\  \ ',
			\'/:/\:\ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ /:/\:\ \:\__\ /:/__/ \:\__\ ',
			\'\/__\:\/:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / \/_|::\/:/  / \:\  \  \/__/',
			\'     \::/  /   |:|__/:/  /  \::/__/           /:/  /     |:|::/  /   \:\  \      ',
			\'     /:/  /     \::::/__/    \:\__\          /:/  /      |:|\/__/     \:\  \     ',
			\'    /:/  /       ~~~~         \/__/         /:/  /       |:|  |        \:\__\    ',
			\'    \/__/                                   \/__/         \|__|         \/__/    ',
			\]

let g:startify_custom_header=StartifyCenter(s:header)
let g:startify_custom_fotter=StartifyCenter(s:header)
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
"edit .vimrc qucick
noremap <Leader>ev :e ~/a-vim/.vimrc<cr>
noremap <Leader>sv :source ~/.vimrc<cr>

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


"YouCompleteMe
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<cr>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<cr>

"zeavim
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

	map <silent> <F11> :call ToggleFullscreen()<CR>
else
	highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
	"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
	let g:NERDTreeDirArrowExpandable='|+'
	let g:NERDTreeDirArrowCollapsible='|-'

endif

"#####################################################################
"#
"# which key
"#
"#####################################################################
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=500
let g:which_key_map={}
let g:which_key_map['w'] = {
			\ 'name' : '+windows' ,
			\ 'w' : ['<C-W>w'     , 'other-window']          ,
			\ 'd' : ['<C-W>c'     , 'delete-window']         ,
			\ '-' : ['<C-W>s'     , 'split-window-below']    ,
			\ '|' : ['<C-W>v'     , 'split-window-right']    ,
			\ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
			\ 'h' : ['<C-W>h'     , 'window-left']           ,
			\ 'j' : ['<C-W>j'     , 'window-below']          ,
			\ 'l' : ['<C-W>l'     , 'window-right']          ,
			\ 'k' : ['<C-W>k'     , 'window-up']             ,
			\ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
			\ 'J' : ['resize +5'  , 'expand-window-below']   ,
			\ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
			\ 'K' : ['resize -5'  , 'expand-window-up']      ,
			\ '=' : ['<C-W>='     , 'balance-window']        ,
			\ 's' : ['<C-W>s'     , 'split-window-below']    ,
			\ 'v' : ['<C-W>v'     , 'split-window-below']    ,
			\ '?' : ['Windows'    , 'fzf-window']            ,
			\ }
let g:which_key_map['g']={
			\ 'name' : '+git/version-control' ,
			\ 'b' : ['Gblame'     , 'fugitive-blame']             ,
			\ 'c' : ['BCommits'   , 'commits-for-current-buffer'] ,
			\ 'C' : ['Gcommit'    , 'fugitive-commit']            ,
			\ 'd' : ['Gdiff'      , 'fugitive-diff']              ,
			\ 'e' : ['Gedit'      , 'fugitive-edit']              ,
			\ 'l' : ['Glog'       , 'fugitive-log']               ,
			\ 'r' : ['Gread'      , 'fugitive-read']              ,
			\ 's' : ['Gstatus'    , 'fugitive-status']            ,
			\ 'w' : ['Gwrite'     , 'fugitive-write']             ,
			\ 'p' : ['Git push'   , 'fugitive-push']              ,
			\ 'y' : ['Goyo'       , 'goyo-mode']                  ,
			\}
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
"#####################################################################
"#
"#  autocmd
"#
"#####################################################################
autocmd vimenter *
			\ if !argc()
			\ | Startify
			\ | NERDTree
			\ | endif
"autocmd vimenter * Tagbar
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
			\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
