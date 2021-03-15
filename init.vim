":::'###:::::::::::::'##::::'##:'####:'##::::'##:'########:::'######::
"::'## ##:::::::::::: ##:::: ##:. ##:: ###::'###: ##.... ##:'##... ##:
"'##:::. ##:'#######: ##:::: ##:: ##:: ## ### ##: ########:: ##:::::::
":'##:. ##::::::::::: ##:::: ##:: ##:: ####'####: ##:::: ##: ##:::..::
" #########:........:. ##:: ##::: ##:: ##. #: ##: ##.. ##::: ##:::::::
" ##.... ##:::::::::::. ## ##:::: ##:: ##:.:: ##: ##::. ##:: ##::: ##:
" ##:::: ##::::::::::::. ###::::'####: ##:::: ##: ##:::. ##:. ######::
"..:::::..::::::::::::::...:::::....::..:::::..::..:::::..:::......:::

"basic seting
let $PATH="~/bin:/local/usr/bin:/".$PATH
let g:mapleader = "\<Space>"
let loaded_matchparen = 1
let g:maplocalleader = ','
let g:current_path="~/a-vim""
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-,g-,f-
set t_Co=256
set shellslash
set nocompatible                           " be improved, required
set ruler
set autoindent
set relativenumber
set number
set showcmd
set foldmethod=marker
set hidden                                 " Allw buffer switching saving
set showmode                               " Display current mode
set splitright                             " Puts new vsplit windows to the right of the current
set splitbelow                             " Puts new split windows to the bottom of the current
set fileformat=unix
set encoding=utf-8
set nobackup
set fileencodings=utf-8,gb18030,gbk,gk2312
set mouse=a
set cursorline
set wrapmargin=4
set wrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouseshape=s:udsizing,m:no
set pastetoggle=<F1>

filetype off                               " required
filetype plugin indent on                  " required

"set spell
set dictionary=/usr/share/dict/words
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=2  " always display the status line

"set termwinsize=10*0
if has('nvim')
    set viminfo='100,n$HOME/.vim/files/info/viminfo
    tnoremap <C-[> <C-\><C-n>
    tnoremap <Esc> <C-\><C-n>
    :tnoremap <C-w>h <C-\><C-N><C-w>h
    :tnoremap <C-w>j <C-\><C-N><C-w>j
    :tnoremap <C-w>k <C-\><C-N><C-w>k
    :tnoremap <C-w>l <C-\><C-N><C-w>l
else
    tnoremap <Esc> <C-W>N
    tnoremap <C-[> <C-W>N
endif




"#####################################################################
"#
"# common function
"#
"#####################################################################

:source ~/a-vim/common.vim

"#####################################################################
"#
"# vim-plug
"#
"#####################################################################

call plug#begin('~/.vim/bundle')


"kite
"let g:kite_supported_languages = ['python', 'javascript', 'go','c','c++','typescript']


if !has('nvim')
    set completeopt+=popup
    set completepopup=height:10,width:60,highlight:Pmenu,border:off
    set completeopt+=menuone   " show the popup menu even when there is only 1 match
    set completeopt+=noinsert  " don't insert any text until user chooses a match
    set completeopt-=longest   " don't insert the longest common text
endif
"Auto Complete
"Plug 'ycm-core/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

if !has('gui_running')
    "Loading plugin when gvim running
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'https://github.com/morhetz/gruvbox.git'
endif

Plug 'https://github.com/dracula/vim.git'
"The appearness about vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'



"Userful tool
"Plug 'jmcantrell/vim-virtualenv'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattesgroeger/vim-bookmarks'
"Plug 'KabbAmine/zeavim.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Chiel92/vim-autoformat'
Plug 'mhinz/vim-startify'
Plug 'haya14busa/incsearch.vim'
Plug 'https://github.com/skywind3000/asyncrun.vim.git'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skanehira/docker.vim'
Plug 'skanehira/docker-compose.vim'
Plug 'https://github.com/tpope/vim-dadbod.git', {'on':'DBUIToggle'}
Plug 'https://github.com/kristijanhusak/vim-dadbod-ui.git'
Plug 'skywind3000/vim-preview'

"Plug 'wakatime/vim-wakatime'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"The guide of key
Plug 'liuchengxu/vim-which-key'

"Plug 'sirtaj/vim-openscad'     , {'for':'scad'}
"
"Web develop
"Plug 'pangloss/vim-javascript' , {'for':'js'}
"Plug 'ap/vim-css-color'        , {'for':'css'}
"Plug 'mxw/vim-jsx'             , {'for':'js'}
"Plug 'https://github.com/peitalin/vim-jsx-typescript.git', {'for':['ts', 'tsx']}
"Plug 'lvht/phpcd.vim'          , { 'for': 'php'   , 'do': 'composer install' }
Plug 'jupyter-vim/jupyter-vim' , {'for':'python'}
Plug  'https://github.com/jmcantrell/vim-virtualenv.git' , {'for':'python'}

"code format
"Plug 'prettier/vim-prettier', {
            "\ 'do': 'yarn install',
            "\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss',
"\'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"Plug 'mattn/emmet-vim'         , {'for':['html,js,vue']}


"tools
Plug 'majutsushi/tagbar'         , {'on':'TagbarToggle'}
"Plug 'francoiscabrol/ranger.vim' , {'on':'Ranger'}
"Plug 'mbbill/undotree'           , {'on':'UndotreeToggle'}
"Plug 'gu-fan/colorv.vim'         , {'on':'ColorV'}
"Plug 'https://github.com/vim-scripts/fcitx.vim.git'

"Plug 'https://github.com/MTDL9/vim-log-highlighting.git'

Plug 'junegunn/goyo.vim'
Plug 'https://tpope.io/vim/eunuch.git'

"text object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'              , {'for':['c' , 'cpp' , 'vim' , 'java']}
Plug 'sgur/vim-textobj-parameter'
Plug 'bps/vim-textobj-python'                 , {'for':['python']}
"Plug 'thinca/vim-textobj-function-javascript' , {'for':['javascript']}
Plug 'kamichidu/vim-textobj-function-go'      , {'for':['go']}
"Plug 'kentaro/vim-textobj-function-php'       , {'for':['php']}
Plug 'diepm/vim-rest-console'

"test
"Plug 'https://github.com/vim-test/vim-test.git'

"Plug 'https://github.com/vim/killersheep.git'

"ansible
"Plug 'pearofducks/ansible-vim' ,{'for':'yaml'}

if has('nvim')
    Plug 'icymind/NeoSolarized'
else
    Plug 'https://github.com/ericbn/vim-solarized.git'
endif
call plug#end()
let g:plug_window = "new"


"#####################################################################
"#
"#  startify
"#
"#####################################################################

"let g:startify_padding_left=30

"let g:startify_custom_header =
            "\ 'startify#center(startify#fortune#cowsay())'

let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")
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
    let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
"let t:startify_new_tab = 1
"#####################################################################
"#
"#  YouCompleteMe
"#
"#####################################################################

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_add_preview_to_completeopt   = 1
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:ycm_error_symbol                 = '>>'
let g:ycm_warning_symbol               = '>*'
let g:ycm_global_ycm_extra_conf        = "~/a-vim/.ycm_extra_conf.py"
let g:ycm_key_detailed_diagnostics= ''


"#####################################################################
"#
"# fzf
"#
"#####################################################################

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }

" CTRL-A CTRL-Q to select all and build quickfix list

"function! s:build_quickfix_list(lines)
"call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"copen
"cc
"endfunction

"let g:fzf_action = {
            "\ 'ctrl-q': function('s:build_quickfix_list'),
            "\ 'ctrl-t': 'tab split',
            "\ 'ctrl-x': 'split',
            "\ 'ctrl-v': 'vsplit' }

"let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

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
let g:NERDTreeUseTCD=1
let g:NERDTreeWinSize=25
let g:NERDTreeWinPos='left'
let g:NERDTreeHijackNetrw = 0
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_startup_cd = 1



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
"#  vim-indent-guides
"#
"#####################################################################

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
"let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes=['help','tagbar','nerdtree','startify']
let g:indent_guides_default_mapping=0
let g:indent_guides_space_guides=1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=37
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=36
"let g:indent_guides_color_change_percent = 1

"#####################################################################
"#
"#  ctrlp
"#
"#####################################################################
"if executable("ag")
    ""set grepprg=ag\ --nogroup\ --nocolor
    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif


"#####################################################################
"#
"#  autoformat
"#
"#####################################################################
noremap <F3> :Autoformat<CR>
"au BufWrite * :Autoformat


"#####################################################################
"#
"#  tagbar
"#
"#####################################################################
"tagabr
let g:tagbar_left=1
let g:tagbar_width=25
"let g:tagbar_autopreview=1

"#####################################################################
"#
"#  emmet
"#
"#####################################################################

"let g:user_emmet_install_global = 1
"autocmd FileType js,html,css EmmetInstall
""let g:user_emmet_mode='n'    "only enable normal mode functions.
""let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_mode='a'    "enable all function in all mode.

"#####################################################################
"#
"#  ale
"#
"#####################################################################
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 0
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
set omnifunc=ale#completion#OmniFunc
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_fixers= {'javascript':['prettier', 'eslint']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint'],
            \'c':['clang'],
            \'python':['pylint'],
            \'c++':['clang'],
            \'vimscript':['vint']}


"#####################################################################
"#
"#  keybind
"#
"#####################################################################

"switch buffer
noremap <Leader>bn :bnext<cr>
noremap <Leader>bp :bprevious<cr>
noremap <Leader>bd :bdelete<cr>
"edit .vimrc qucick
"noremap <Leader>ev :tabe ~/a-vim/init.vim<cr>
noremap <Leader>ev :call TabeVimrc()<cr>
noremap <Leader>sv :source ~/a-vim/init.vim<cr>
vmap <Leader>ee "xy:@x<CR>


"noremap <space>sr :silent execute "grep! -r" . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
"
"noremap <space>sm :silent execute "Man " .
"\shellescape(expand("<cword>")) . " ."<cr>

"noremap <space>of :silent execute "cs find s" .
"\shellescape(expand("<cword>")) . " ."<cr>
" operatoring about quickfix

noremap <leader>qn :cn<cr>
noremap <Leader>qp :cp<cr>
noremap <Leader>qo :copen<cr>
noremap <Leader>qc :cclose<cr>


noremap <Leader>th :Hexmode<cr>

"NERDTree
noremap <Leader>tn :NERDTreeTabsToggle<cr>

"TagbarToggle
noremap <Leader>tt :TagbarToggle<cr>
"ColorV
noremap <Leader>tc :ColorV<cr>
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)


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
"nmap     <Leader>sn <Plug>CtrlSFCwordPath
"nmap     <Leader>sp <Plug>CtrlSFPwordPath
"nnoremap <Leader>so :CtrlSFOpen<CR>
"nnoremap <Leader>st :CtrlSFToggle<CR>
"inoremap <Leader>st <Esc>:CtrlSFToggle<CR>


"cscope keybind
function! SearchInSymbol(arg)
    execute "cs find ". a:arg ." <cword>"
    :copen
endfunction


nnoremap <Leader>os :call SearchInSymbol("s") <cr>
nnoremap <Leader>og :call SearchInSymbol("g")<cr>
nnoremap <Leader>oc :call SearchInSymbol("c")<cr>
nnoremap <Leader>od :call SearchInSymbol("d")<cr>





"Asyncrun
noremap <Leader>sb  :AsyncRun qutebrowser <cword> <CR>

nnoremap <C-j> :m .+1<cr>==
nnoremap <C-k> :m .-2<cr>==
inoremap <C-j> <Esc>:m .+1<cr>==gi
inoremap <C-k> <Esc>:m .-2<cr>==gi
vnoremap <C-k> :m '<-2<cr>gv=gv
vnoremap <C-j> :m '>+1<cr>gv=gv


noremap  <space>db :DBUIToggle<cr>



"#####################################################################
"#
"#  gui settting
"#
"#####################################################################

"colorscheme onedark
let g:ctrlp_show_hidden = 1
if has("nvim")
    if exists('g:GuiLoaded')
        ":GuiFont! Ubuntu\ Mono:h14
        Guifont! Monaco:h13
        let g:fullscreen = 0
        map <silent> <F11> :call ToggleFullScreen()<CR>
    endif
    set background=dark
    colorscheme NeoSolarized
else
    if stridx(&rtp,"solarized") != -1
        :colorscheme solarized
    endif
    if has("gui_running")
        ":set background  = light
        ":colorscheme my-scheme
        :set background=dark
        ":set guioptions -= r
        ":set guioptions -= L "remove the scroll bar
        ":set guioptions -= m "remove the menu bar
        ":set guioptions -=T "remove the tab bar
        :set guioptions="";
        ":set guifont     =Ubuntu\ Mono\ Bold\ Italic\ 14
        :set guifont     =Ubuntu\ Mono\ Bold\ 14
        ":set guifont     =DejaVu\ Sans\ Mono\ Nerd\ Font
        ":set guifont =Ubuntu\ Mono\ Nerd\ Font\ Bold\ Italic\ 14
        let g:tagbar_iconchars = ['▸', '▾']
        "let g:tagar_previewwin_pos="rightbelow"
        let g:fullscreen = 0
        map <silent> <F11> :call ToggleFullScreen()<CR>
    else
        highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
        "highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
        "colorscheme gruvbox
        set background=dark
        let g:NERDTreeDirArrowExpandable='|+'
        let g:NERDTreeDirArrowCollapsible='|-'
        colorscheme default
        "AirlineTheme aurora
    endif
endif
:set background=light
"if has("gui_running")
"if has("gui_gtk2")
":set guifont=Luxi\ Mono\ 12
"elseif has("x11")
"" Also for GTK 1
":set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
"elseif has("gui_win32")
":set guifont=Luxi_Mono:h12:cANSI
"endif
"endif

"#####################################################################
"#
"#  easymotion
"#
"#####################################################################

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

nmap <Leader>mt <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ms <Plug>BookmarkShowAll
nmap <Leader>mn <Plug>BookmarkNext
nmap <Leader>mp <Plug>BookmarkPrev
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mC :BookmarkClearAll<cr>
let g:bookmark_no_default_key_mappings = 1
"nmap <Leader>m <Plug>BookmarkClearAll

"#####################################################################
"#
"# which key
"#
"#####################################################################

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=500
if stridx(&rtp,"vim-which-key") != -1
    call which_key#register('<Space>', "g:which_key_map")
endif

let NERDCreateDefaultMappings= 0
let g:which_key_use_floating_win=0
let g:which_key_map={}
let g:which_key_run_map_on_popup=1
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
            \ 'm' : ['MaxWin'    , 'max-window']            ,
            \ 'r' : 'rename-window',
            \ }
let g:which_key_map['b']={
            \'name' : '+buffer',
            \'n' : ['bnext'     , 'next-buffer']     ,
            \'p' : ['bprevious' , 'previous-buffer'] ,
            \'d' : ['bdelete'   , 'delete-buffer']   ,
            \'s' : ['Buffers'   , 'switch-buffer']   ,
            \'t' : 'background'   ,
            \}
let g:which_key_map['p']={
            \'name':'+plugin',
            \'s':['PlugStatus'  , 'plug-status' ]  ,
            \'i':['PlugInstall' , 'plug-install' ] ,
            \'u':['PlugUpdate'  , 'plug-update' ]  ,
            \'c':['PlugClean'   , 'plug-clean']    ,
            \}
let g:which_key_map['m']={
            \'name':'+mark',
            \'s':'bookmark-show'      ,
            \'n':'bookmark-next'      ,
            \'p':'bookmark-prev'      ,
            \'i':'bookmark-insert'    ,
            \'t':'bookmark-toggle'    ,
            \'c':'bookmark-clear'     ,
            \'C':'bookmark-clear-all' ,
            \}
let g:which_key_map['e']={
            \'name':'+jump/vimrc',
            \}
"\'m' : 'man-search'    ,
let g:which_key_map['s']={
            \'name':'+search/session',
            \'a' : ['SLoad'         , 'load-session']               ,
            \'s' : ['SSave'         , 'save-session']               ,
            \'f' : ['FZF'           , 'file-search']                ,
            \'l' : ['BTags'         , 'localization-symbol-search'] ,
            \'g' : ['Tags'          , 'global-symbol-search']       ,
            \'b' : 'broswer-search' ,
            \'n' : ['Ag'  , 'fzf-search']
            \}
let g:which_key_map['g']={
            \ 'name'  : '+git/version-control' ,
            \ 'b'     : ['Gblame'            , 'fugitive-blame']             ,
            \ 'c'     : ['BCommits'          , 'commits-for-current-buffer'] ,
            \ 'C'     : ['Gcommit'           , 'fugitive-commit']            ,
            \ 'd'     : ['Gdiff'             , 'fugitive-diff']              ,
            \ 'e'     : ['Gedit'             , 'fugitive-edit']              ,
            \ 'l'     : ['Glog'              , 'fugitive-log']               ,
            \ 'r'     : ['Gread'             , 'fugitive-read']              ,
            \ 's'     : ['Gstatus'           , 'fugitive-status']            ,
            \ 'w'     : ['Gwrite'            , 'fugitive-write']             ,
            \ 'p'     : ['AsyncGitPush()'    , 'fugitive-push']              ,
            \ 'i'     : ['TouchGitignore()'  , 'touch-gitignore']            ,
            \ 'y'     : ['Goyo'              , 'goyo-mode']                  ,
            \ 'j'     : ['GitGutterNextHunk' , 'gitgutter-next']             ,
            \ 'k'     : ['GitGutterPrevHunk' , 'gitgutter-prev']             ,
            \ 'f'     : ['GitGutterFold'     , 'gitgutter-fold']             ,
            \}
let g:which_key_map['t']={
            \'name' : '+tool-window'    ,
            \'n'    : 'NERDTree-window' ,
            \'t'    : 'Tagbar-window'   ,
            \'u'    : 'UndoTree-window' ,
            \'g'    : ['SearchInDict()','goldendict-search'] ,
            \}
let g:which_key_map['k']={
            \'name':'+docker',
            \'c'    : ['DockerContainers'  , 'docker-container-list' ] ,
            \'i'    : ['DockerImages'      , 'docker-image-list' ]     ,
            \'s'    : ['DockerImageSearch' , 'docker-image-search' ]   ,
            \}
let g:which_key_map['a']={
            \'name' : '+align',
            \','    : 'tabularize-align',
            \'='    : 'tabularize-align',
            \':'    : 'tabularize-align',
            \}
let g:which_key_map['q']={
            \'name':'+quickfix',
            \'o':'quickfix-open'  ,
            \'n':'next-error'     ,
            \'p':'previous-error' ,
            \}
let g:which_key_map['c']={
            \'name':'+comment',
            \'c' : [ '<Plug>NERDCommenterComment'   , 'nerdcommenter-comment'   ] ,
            \'u' : [ '<Plug>NERDCommenterUncomment' , 'nerdcommenter-uncommnt' ]  ,
            \'t' : [ '<Plug>NERDCommenterToggle'    , 'nerdcommenter-toggle' ]    ,
            \}
let g:which_key_map['z']={
            \'name':'+zeal-search',
            \'s':'zeal-search',
            \'k':'zeal-cursor',
            \}
let g:which_key_map['d'] = {
            \'name':'+database',
            \'b':'dadbod-ui',
            \'w'    : ['<Plug>(DBUI_SaveQuery)' , 'dbui-savequery ' ]   ,
            \}
let g:which_key_map['o']={
            \'name':'+cscope',
            \'s':'cscope-symbol'     ,
            \'g':'cscope-definition' ,
            \'c':'cscope-calling'    ,
            \'d':'cscope-called'     ,
            \}
"let g:which_key_map.d = 'which_key_ignore'

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>


"#####################################################################
"#
"#  asyncrun
"#
"#####################################################################
let g:asyncrun_open=10

"#####################################################################
"#
"#  database
"#
"#####################################################################
let g:db_ui_winwidth = 30
let g:db_ui_env_variable_url = 'DATABASE_URL'
let g:db_ui_env_variable_name = 'DATABASE_NAME'
let g:dbs = [
            \ { 'name': 'sqlite'  , 'url': 'sqlite:/home/ren/test.db' }                                                         ,
            \ { 'name': 'orgmode' , 'url': 'sqlite:/home/ren/Documents/react-ant-desing/django/django/OrgmodeBlog/db.sqlite3' } ,
            \ { 'name': 'wiki'    , 'url': 'sqlite:/home/ren/Desktop/pdf/wiser/trunk/wikipedia_1000.db' }                       ,
            \ ]

"#####################################################################
"#
"#  autocmd
"#
"#####################################################################

augroup strartUpSetting
    if stridx(&rtp,"startify") != -1
        autocmd TabNew * Startify | setlocal nowrap  

    endif
    autocmd FileType python set sw=4
    autocmd FileType python set ts=4
    autocmd FileType python set sts=4
    autocmd FileType html   set tabstop=2
    autocmd FileType js     set tabstop=2
    autocmd FileType html   set shiftwidth=2
    autocmd FileType js     set shiftwidth=2
augroup END


autocmd VimLeave * NERDTreeTabsClose
autocmd TabEnter * NERDTreeCWD
"autocmd TabNew * NERDTreeTabsToggle
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


"Hiden line numer in terminal
if !has('nvim')
    au TerminalOpen * if &buftype == 'terminal' | setlocal nonumber |setlocal norelativenumber| endif
    au BufNew * if &buftype=='quickfix' | setlocal nonumber | setlocal norelativenumber
endif

autocmd! FileType which_key
"autocmd  FileType which_key set laststatus=0 noshowmode noruler
autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"let plugins=g:plugs_order

"for item in plugins
""echo escape(item,'\')
""execute "amenu Plugin.".shellescape(item,'\')."  <cr>"
"execute "amenu Plugin.".shellescape(item,'\')."  <cr>"
"endfor

amenu Plugin.vim-plug.Status  :PlugStatus<cr>
amenu Plugin.vim-plug.Update  :PlugUpdate<cr>
amenu Plugin.vim-plug.Install :PlugInstall<cr>
amenu Plugin.vim-plug.Clean   :PlugClean<cr>
amenu Plugin.vim-plug.Diff    :PlugDiff<cr>

hi Normal ctermfg=256 ctermbg=none

runtime ftplugin/man.vim

