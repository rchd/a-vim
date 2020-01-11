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
let g:mapleader = "\<Space>"
let loaded_matchparen = 1
let g:maplocalleader = ','
set cscopequickfix=g-
set shellslash
set t_Co=256
set nocompatible                           " be improved, required
set autoindent
set ruler
set relativenumber
set number
set hlsearch
set showcmd
set foldmethod=marker
set hidden                                 " Allw buffer switching saving
set showmode                               " Display current mode
set splitright                             " Puts new vsplit windows to the right of the current
set splitbelow                             " Puts new split windows to the bottom of the current
set fileformat=unix
set encoding=UTF-8
set nobackup
set fileencodings=utf-8,gb18030,gbk,gk2312
set mouse=a
set cursorline
set nowrap
"set paste
filetype off                               " required
filetype plugin indent on                  " required
"set spell

"}}}

"#####################################################################
"#
"# common function
"#
"#####################################################################
"{{{
function! StartifyCenter(lines) abort
	let longest_line=max(map(copy(a:lines),'strwidth(v:val)'))
	let centered_lines=map(copy(a:lines),
				\'repeat(" ",(&columns / 2)-(longest_line/2)).v:val')
	return centered_lines
endfunction

function! ToggleFullScreen()
	if g:fullscreen == 1
		let g:fullscreen = 0
		let mod = "remove"
	else
		let g:fullscreen = 1
		let mod = "add"
	endif
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endfunction

"function! SearchInMan()
""let l:word=expand("<cword")
":silent execute "Man " . shellescape(expand("<cword>")) . " ."<cr>

"endfunction


"function! BookmarkUnmapKeys()
"unmap mm
"unmap mi
"unmap mn
"unmap mp
"unmap ma
"unmap mc
"unmap mx
"unmap mkk
"unmap mjj
"endfunction

"}}}
"#####################################################################
"#
"# vim-plug
"#
"#####################################################################
"{{{
call plug#begin('~/.vim/bundle')

Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/Shougo/vimshell.vim.git'
"Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/jalvesaq/Nvim-R.git'
if !has('gui_running')
	Plug 'https://github.com/morhetz/gruvbox.git'
endif
"Plug 'https://github.com/altercation/solarized.git'
Plug 'https://github.com/dracula/vim.git'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'KabbAmine/zeavim.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'dyng/ctrlsf.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'klen/python-mode'
Plug 'fidian/hexmode'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
"Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'sirtaj/vim-openscad'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'joshdick/onedark.vim'
"Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'vim-utils/vim-man'
"plug 'cosminadrianpopescu/vim-sql-workbench'
call plug#end()


"}}}
"#####################################################################
"#
"#  startify
"#
"#####################################################################
"{{{
"let g:startify_padding_left=30
let s:header=[
			\'        ___           ___                       ___           ___           ___     ',
			\'       /\  \         /\__\          ___        /\__\         /\  \         /\  \    ',
			\'      /::\  \       /:/  /         /\  \      /::|  |       /::\  \       /::\  \   ',
			\'     /:/\:\  \     /:/  /          \:\  \    /:|:|  |      /:/\:\  \     /:/\:\  \  ',
			\'    /::\~\:\  \   /:/__/  ___      /::\__\  /:/|:|__|__   /::\~\:\  \   /:/  \:\  \ ',
			\'   /:/\:\ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ /:/\:\ \:\__\ /:/__/ \:\__\ ',
			\'   \/__\:\/:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / \/_|::\/:/  / \:\  \  \/__/',
			\'        \::/  /   |:|__/:/  /  \::/__/           /:/  /     |:|::/  /   \:\  \      ',
			\'        /:/  /     \::::/__/    \:\__\          /:/  /      |:|\/__/     \:\  \     ',
			\'       /:/  /       ~~~~         \/__/         /:/  /       |:|  |        \:\__\    ',
			\'       \/__/                                   \/__/         \|__|         \/__/    ',
			\]

let g:startify_custom_header=s:header
let g:startify_custom_fotter=StartifyCenter(s:header)
"}}}
"#####################################################################
"#
"#  YouCompleteMe
"#
"#####################################################################
"{{{
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
"}}}

"#####################################################################
"#
"#  UltiSnips
"#
"#####################################################################
"{{{
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"}}}
"#####################################################################
"#
"#  airline
"#
"#####################################################################
"{{{
let g:airline#extensions#tabline#enabled=1
" set the arrow of powerline
if !has("gui_running")
	let g:airline_powerline_fonts=1
endif
"}}}
"#####################################################################
"#
"#  NERDTree
"#
"#####################################################################
"{{{
" set the width and position of NERDTree
let g:NERDTreeWinSize=25
let g:NERDTreeWinPos='left'
let g:NERDTreeHijackNetrw = 0
"}}}


"#####################################################################
"#
"#  undotree
"#
"#####################################################################
"undotree{{{
let g:undotree_WindowLayout=3
let g:undotree_SplitWidth=30
"}}}
"#####################################################################
"#
"#  indentLine
"#
"#####################################################################
"{{{
let g:indentLine_char='¦'
"}}}
"#####################################################################
"#
"#  ctrlp
"#
"#####################################################################
"if executable("ag")
"set grepprg=ag\ --nogroup\ --nocolor
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif


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
"au BufWrite * :Autoformat

"#####################################################################
"#
"#  tagbar
"#
"#####################################################################
"tagabr{{{
let g:tagbar_left=1
let g:tagbar_width=25
let g:tagbar_autopreview=1
"}}}
"#####################################################################
"#
"#  emmet
"#
"#####################################################################
"{{{
let g:user_emmet_install_global = 1
autocmd FileType js,html,css EmmetInstall
"let g:user_emmet_mode='n'    "only enable normal mode functions.
"let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
"}}}
"#####################################################################
"#
"#  ale
"#
"#####################################################################
let g:ale_set_loclist=0
let g:ale_set_quickfix=1

"#####################################################################
"#
"#  keybind
"#
"#####################################################################
"{{{
"switch tab
noremap <Leader>bn :bnext<cr>
noremap <Leader>bp :bprevious<cr>
noremap <Leader>bd :bdelete<cr>
"edit .vimrc qucick
noremap <Leader>ev :e ~/a-vim/init.vim<cr>
noremap <Leader>sv :source ~/a-vim/init.vim<cr>

" noremap <space>g :silent execute "grep! -r" . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
noremap <space>sm :silent execute "Man " . shellescape(expand("<cword>")) . " ."<cr>
" operatoring about quickfix
noremap <leader>qn :cn<cr>
noremap <Leader>qp :cp<cr>
noremap <Leader>qo :copen<cr>

"NERDTree
noremap <Leader>tn :NERDTreeToggle<cr>

"TagbarToggle
noremap <Leader>tt :TagbarToggle<cr>
" map / <Plug>(incsearch-forward)
" map ? <Plug>(incsearch-backward)


"YouCompleteMe
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<cr>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<cr>

"map / <Plug><easymotion-sn>
"omap / <Plug>(easymotion-tn)
"map n<Plug>(easymotion-next)
"map N<Plug>(easymotion-prev)

"zeavim
nmap <Leader>zs <Plug>Zeavim
"vmap <Leader>zv <Plug>ZVVisSelection
"nmap <Leader>zo <Plug>ZVOperator
nmap <Leader>zk <Plug>ZVKeyDocset


"tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
"undotree
nmap <Leader>tu :UndotreeToggle<cr>
"nmap <Leader>u
"CtrlSF
"nmap     <Leader>sf <Plug>CtrlSFPrompt
"vmap     <Leader>sf <Plug>CtrlSFVwordPath
"vmap     <Leader>sF <Plug>CtrlSFVwordExec
nmap     <Leader>sn <Plug>CtrlSFCwordPath
"nmap     <Leader>sp <Plug>CtrlSFPwordPath
"nnoremap <Leader>so :CtrlSFOpen<CR>
nnoremap <Leader>st :CtrlSFToggle<CR>
inoremap <Leader>st <Esc>:CtrlSFToggle<CR>
"}}}
"#####################################################################
"#
"#  gui settting
"#
"#####################################################################
"{{{
"colorscheme onedark
let g:ctrlp_show_hidden = 1
if has("gui_running")
	":set background  = light
	:colorscheme dracula
	:set background=dark
	":set guioptions -= r
	":set guioptions -= L "remove the scroll bar
	":set guioptions -= m "remove the menu bar
	":set guioptions -= T "remove the tab bar
	:set guioptions="";
	:set guifont     =Monospace\ Bold\ 12
	let g:tagbar_iconchars = ['▸', '▾']
	"let g:tagar_previewwin_pos="rightbelow"
	let g:fullscreen = 0

	map <silent> <F11> :call ToggleFullScreen()<CR>
else
	highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
	"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
	colorscheme gruvbox
	set background=dark
	let g:NERDTreeDirArrowExpandable='|+'
	let g:NERDTreeDirArrowCollapsible='|-'
	"AirlineTheme aurora


endif
"}}}
"#####################################################################
"#
"#  easymotion
"#
"#####################################################################
"{{{
"map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>ef <Plug>(easymotion-bd-f)
nmap <Leader>ef <Plug>(easymotion-overwin-f)

"" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

"" Move to line
map <Leader>el <Plug>(easymotion-bd-jk)
nmap <Leader>el <Plug>(easymotion-overwin-line)

"" Move to word
map  <Leader>ew <Plug>(easymotion-bd-w)
nmap <Leader>ew <Plug>(easymotion-overwin-w)
"}}}


"#####################################################################
"#
"#  goyo
"#
"#####################################################################

let g:goyo_width=160


"#####################################################################
"#
"#  vim-bookmarks
"#
"#####################################################################
nmap <Leader>mt <Plug>BookmarkToggle"{{{
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ms <Plug>BookmarkShowAll
nmap <Leader>mn <Plug>BookmarkNext
nmap <Leader>mp <Plug>BookmarkPrev
nmap <Leader>mc <Plug>BookmarkClear
"nmap <Leader>m <Plug>BookmarkClearAll
"}}}
"#####################################################################
"#
"# which key
"#
"#####################################################################
"{{{
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=500


let g:which_key_map={}
let g:which_key_map['w'] = {
			\ 'name' : '+windows' ,
			\ 'w'    : ['<C-W>w'     , 'other-window']          ,
			\ 'd'    : ['<C-W>c'     , 'delete-window']         ,
			\ '-'    : ['<C-W>s'     , 'split-window-below']    ,
			\ '|'    : ['<C-W>v'     , 'split-window-right']    ,
			\ '2'    : ['<C-W>v'     , 'layout-double-columns'] ,
			\ 'h'    : ['<C-W>h'     , 'window-left']           ,
			\ 'j'    : ['<C-W>j'     , 'window-below']          ,
			\ 'l'    : ['<C-W>l'     , 'window-right']          ,
			\ 'k'    : ['<C-W>k'     , 'window-up']             ,
			\ 'H'    : ['<C-W>5<'    , 'expand-window-left']    ,
			\ 'J'    : ['resize +5'  , 'expand-window-below']   ,
			\ 'L'    : ['<C-W>5>'    , 'expand-window-right']   ,
			\ 'K'    : ['resize -5'  , 'expand-window-up']      ,
			\ '='    : ['<C-W>='     , 'balance-window']        ,
			\ 's'    : ['<C-W>s'     , 'split-window-below']    ,
			\ 'v'    : ['<C-W>v'     , 'split-window-below']    ,
			\ '?'    : ['Windows'    , 'fzf-window']            ,
			\ }
let g:which_key_map['b']={
			\'name' : '+buffer',
			\'n' : ['bnext'     , 'next-buffer']     ,
			\'p' : ['bprevious' , 'previous-buffer'] ,
			\'d' : ['bdelete'   , 'delete-buffer']   ,
			\'s' : ['Buffers'   , 'switch-buffer']   ,
			\}
let g:which_key_map['p']={
			\'name':'+plugin',
			\'s':['PlugStatus'  , 'plug-status' ]  ,
			\'i':['PlugInstall' , 'plug-install' ] ,
			\'u':['PlugUpdate'  , 'plug-update' ]  ,
			\}
let g:which_key_map['m']={
			\'name':'+mark',
			\'s':'bookmark-show'   ,
			\'n':'bookmark-next'   ,
			\'p':'bookmark-prev'   ,
			\'i':'bookmark-insert' ,
			\'t':'bookmark-toggle' ,
			\'c':'bookmark-clear'  ,
			\}
let g:which_key_map['e']={
			\'name':'+jump/vimrc',
			\}
let g:which_key_map['s']={
			\'name':'+search/session',
			\'l' : ['SLoad'        , 'load-session'] ,
			\'s' : ['SSave'        , 'save-session'] ,
			\'f' : ['FZF'          , 'file-search']  ,
			\'m' : 'man-search'    ,
			\'t' : 'ctrlsf-toogle' ,
			\'n' : 'ctrlsf-search' ,
			\}
let g:which_key_map['g']={
			\ 'name'  : '+git/version-control' ,
			\ 'b'     : ['Gblame'     , 'fugitive-blame']             ,
			\ 'c'     : ['BCommits'   , 'commits-for-current-buffer'] ,
			\ 'C'     : ['Gcommit'    , 'fugitive-commit']            ,
			\ 'd'     : ['Gdiff'      , 'fugitive-diff']              ,
			\ 'e'     : ['Gedit'      , 'fugitive-edit']              ,
			\ 'l'     : ['Glog'       , 'fugitive-log']               ,
			\ 'r'     : ['Gread'      , 'fugitive-read']              ,
			\ 's'     : ['Gstatus'    , 'fugitive-status']            ,
			\ 'w'     : ['Gwrite'     , 'fugitive-write']             ,
			\ 'p'     : ['Git push'   , 'fugitive-push']              ,
			\ 'y'     : ['Goyo'       , 'goyo-mode']                  ,
			\}
let g:which_key_map['t']={
			\'name' : '+tool-window'    ,
			\'n'    : 'NERDTree-window' ,
			\'t'    : 'Tagbar-window'   ,
			\'u'    : 'UndoTree-window' ,
			\}
let g:which_key_map['a']={
			\'name' : '+align',
			\','    : 'tabularize-align'		  ,
			\'='    : 'tabularize-align'		  ,
			\':'    : 'tabularize-align'		  ,
			\}
let g:which_key_map['q']={
			\'name':'+quickfix',
			\'o':'quickfix-open'  ,
			\'n':'next-error'     ,
			\'p':'previous-error' ,
			\}
let g:which_key_map['c']={
			\'name':'+comment',
			\}
let g:which_key_map['z']={
			\'name':'+zeal-search',
			\'s':'zeal-search',
			\'k':'zeal-cursor',
			\}
let g:which_key_map.d = 'which_key_ignore'
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
"}}}
"#####################################################################
"#
"#  autocmd
"#
"#####################################################################
"{{{
augroup strartUpSetting
	autocmd vimenter *
				\ if !argc()
				\ | Startify
				\ | NERDTree
				\ | endif
	"autocmd vimenter * Tagbar
	autocmd FileType python set sw=4
	autocmd FileType python set ts=4
	autocmd FileType python set sts=4
augroup END

"autocmd VimLeave * NERDTreeClose

autocmd! FileType which_key
"autocmd  FileType which_key set laststatus=0 noshowmode noruler
autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"autocmd BufEnter * :call BookmarkUnmapKeys()
"}}}
