"maximize current windows and restore layout
if exists("g:vimcommonfunctionloaded")
    finish
else
    let g:vimcommonfunctionloaded=1
endif

if !has('gui_running')
    function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction
endif

function! StartifyCenter(lines) abort
    let longest_line=max(map(copy(a:lines),'strwidth(v:val)'))
    let centered_lines=map(copy(a:lines),
                \'repeat(" ",(&columns / 2)-(longest_line/2)).v:val')
    return centered_lines
endfunction

function! ToggleFullScreen()
    if g:fullscreen == 1
        let g:fullscreen = 0
        if has('nvim')
            :call GuiWindowFullScreen(0)
        endif
        let mod = "remove"
    else
        let g:fullscreen = 1
        if has('nvim')
            :call GuiWindowFullScreen(1)
        endif
        let mod = "add"
    endif
    if !has('g:GuiLoaded')
        call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
    endif
endfunction


function! HeightToSize(height)
    let currwinno=winnr()
    if winheight(currwinno)>a:height
        while winheight(currwinno)>a:height
            execute "normal \<c-w>-"
        endwhile
    elseif winheight(currwinno)<a:height
        while winheight(currwinno)<a:height
            execute "normal \<c-w>+"
        endwhile
    endif
endfunction

function! WidthToSize(width)
    let currwinno=winnr()
    if winwidth(currwinno)>a:width
        while winwidth(currwinno)>a:width
            execute "normal \<c-w><"
        endwhile
    elseif winwidth(currwinno)<a:width
        while winwidth(currwinno)<a:width
            execute "normal \<c-w>>"
        endwhile
    endif
endfunction

function! TweakWinSize(orgisize)
    call HeightToSize(a:orgisize[0])
    call WidthToSize(a:orgisize[1])
endfunction


function! RestoreWinLayout()
    if exists("g:layout")
        let orgiwinno=winnr()
        let winno=1
        for win in g:layout
            execute "normal \<c-w>w"
            let currwinno=winnr()
            "if currwinno!=1 && currwinno!=orgiwinno
            if currwinno!=orgiwinno
                call TweakWinSize(g:layout[currwinno-1])
            endif
        endfor
        unlet g:layout
    endif
endfunction

function! SaveWinLayout()
    let wnumber=winnr("$")
    let winlist=range(wnumber)
    let winno=0
    let layout=[]
    for index in winlist
        let winno+=1
        let wininfo=[winheight(winno),winwidth(winno)]
        call add(layout,wininfo)
    endfor
    let g:layout=layout
endfunction

function! ToggleMaxWin()
    if exists("g:layout")
        if winnr("$")==len(g:layout)
            call RestoreWinLayout()
        else
            call SaveWinLayout()
            execute "normal 200\<c-w>>"
            execute "normal \<c-w>_"
            call RestoreWinLayout()
        endif
    else
        call SaveWinLayout()
        execute "normal 200\<c-w>>"
        execute "normal \<c-w>_"
    endif
endfunction

command! -nargs=0 MaxWin call ToggleMaxWin()

if has('g:GuiLoaded')
    "Tabline
    function! MyTabLine()
        let s = ''
        for i in range(tabpagenr('$'))
            " select the highlighting
            if i + 1 == tabpagenr()
                let s .= '%#TabLineSel#'
            else
                let s .= '%#TabLine#'
            endif
            " set the tab page number (for mouse clicks)
            let s .= '%' . (i + 1) . 'T'
            " the label is made by MyTabLabel()
            let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
            let s .= '%=%#TabLine#%999Xclose'
        endif
        return s
    endfunction

    function! MyTabLabel(n)
        let buflist = tabpagebuflist(a:n)
        let winnr = tabpagewinnr(a:n)
        return bufname(buflist[winnr - 1])
    endfunction
    set tabline=%!MyTabLine()
endif

function! SiblingFiles(A,L,P)
    return map(split(globpath(expand("%:h")."/",a:A."*"),"\n"),'fnamemodify(v:val,":t")')
endfunction

function! TouchGitignore()
    let g:test = system("ls  -al | grep .gitignore")
    for bufnr in range(1, bufnr('$'))
        if ".gitignore"==bufname(bufnr)
            :b .gitignore
            return
        endif
    endfor
    if  g:test == ""
        call system("touch .gitignore")
    endif
    :e .gitignore
endfunction

function! Rename(name,bang)
    let l:curfile=expand("%:p")
    let l:curpath=expand("%:h")."/"
    let v:errmsg=""
    silent! exe "saveas" . a:bang . " " . fnameescape(l:curpath . a:name)
    if v:errmsg=~# '^$\|^E329'
        let l:oldfile=l:curfile
        let l:curfile=expand("%:p")
        if l:curfile !=# l:oldfile && filewritable(l:curfile)
            silent exe "bwipe! " . fnameescape(l:oldfile)
            if delete(l:oldfile)
                echoerr "Could not delete ".l:oldfile
            endif
        endif
    else
        echoerr v:errmsg
    endif
endfunction

command! -nargs=* -complete=customlist,SiblingFiles -bang Rename :call Rename("<args>","<bang>")
cabbrev rename <c-r>=getcmdpos()==1 && getcmdtype()==":"?"Rename":"rename"<CR>
noremap <Leader>wr :Rename



function! LoadCscope()
    if file_readable("cscope.out")
        cs add cscope.out
    endif
endfunction
call LoadCscope()

function! TabeVimrc()
    :e ~/a-vim/init.vim
endfunction

function! Compile()
    if filereadable('Makefile')
        execute ":AsyncRun make"
    elseif filereadable('pom.xml')
        execute ":AsyncRun mvn compile"
    elseif filereadable('go.mod')
        execute ":AsyncRun go build"
    elseif filereadable('CMakeLists.txt')
        execute ":AsyncRun cmake ."
        execute ":AsyncRun make"
    else
        echom "There is no project file"
    endif
endfunction

function! CompileCurrentFile()
    if &filetype  == 'java'
        call system("javac ".expand("%"))
    elseif &filetype  == 'c'
        call system("gcc".expand("%"))
    elseif &filetype  == 'cpp'
        call system("g++".expand("%"))
    endif
endfunction

command!  -nargs=* -bang Compile :call Compile()
noremap <f5> :Compile<cr>

function! StartTime()
    let g:current = localtime()
    let popupid   = popup_notification('start time', {})
    let bufnr     = winbufnr(popupid)
    call setbufline(bufnr, 2,g:current)
endfunction

function! EndTime()
    if exists("g:current")
        let s:total_time = localtime() - g:current
        let popupid      = popup_notification('end time', {})
        let bufnr        = winbufnr(popupid)
        call setbufline(bufnr, 2,s:total_time / 3600."H"
                    \.s:total_time /600."M"
                    \.s:total_time / 60."S")
    else
        let popupid = popup_notification('end time', {})
        let bufnr   = winbufnr(popupid)
        call setbufline(bufnr, 2,"Start a timer")
    endif
endfunction

function! AsyncGitPush()
    execute 'AsyncRun git push'
endfunction


"function! EqualSign(char)
"if a:char  =~ '='  && getline('.') =~ ".*("
"return a:char
"endif
"if a:char  =~ '[\/\<\>]' && getline('.') =~ '"'
"return a:char
"endif
"let ex1 = getline('.')[col('.') - 3]
"let ex2 = getline('.')[col('.') - 2]

""if &filetype == 'go' && getline('.')=~":"
""return "\<SPACE>".a:char."=\<SPACE>"
""endif

"if ex1 =~ "[-=+><>\/\*]"
"if ex2 !~ "\s"
"return "\<ESC>i".a:char."\<SPACE>"
"else
"return "\<ESC>xa".a:char."\<SPACE>"
"endif
"else
"if ex2 !~ "\s"
"return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
"else
"return a:char."\<SPACE>\<ESC>a"
"endif
"endif
"endfunction

":inoremap = <c-r>=EqualSign('=')<CR>
":inoremap + <c-r>=EqualSign('+')<CR>
":inoremap - <c-r>=EqualSign('-')<CR>
":inoremap / <c-r>=EqualSign('/')<CR>
":inoremap * <c-r>=EqualSign('*')<CR>
":inoremap > <c-r>=EqualSign('>')<CR>
":inoremap < <c-r>=EqualSign('<')<CR>
"":inoremap , ,<space>

function! RecollSearch()
    let file_name = input("Input the file name that you want to search:")
    let command = "recoll -t -q " . file_name
    let result = system('recoll  -t   -q '.file_name)->split('\n', 1)
    for item in result
        let path=matchstr(item, '\[\file\:.*\]\{1}')
        let pathlist = split(path)
        if empty(pathlist) == 0
            let file = pathlist[0]
            let start=stridx(file, '[')
            let end=stridx(file, ']')
            let newpath = strpart(file, start+1, end-1)
            let finalpath = strpart(newpath, 7 )
            :call setqflist([{'bufnr':'recoll',
                        \'filename':finalpath,
                        \'text':item}], 'a')
        else
            :call setqflist([{'bufnr':'recoll','text': item}] , 'a')
        endif
    endfor
    copen
endfunction
command! -nargs=0 Recoll call RecollSearch()

function! LogPrint()
    let logjob = job_start("tail -f /var/log/dpkg.log",
                \ {'out_io': 'buffer', 'out_name': 'dummy',
                \   'out_modifiable':0})
    sbuf dummy
endfunction
command! -nargs=0 Log call LogPrint()

function SearchInDict()
    let word = expand("<cword>")
    call system("goldendict " . word)
endfunction


function! ChangeBackground()
    if &background == 'light'
        :set background=dark
    else
        :set background=light
    endif
endfunction
noremap <Leader>bt :call ChangeBackground()<cr>

function LinuxKernel()
  let path="~/ISO/linux-kernel/linux-2.6.28.8" 
  execute "cd " . path
  cs add cscope.out
  "echo "The current work directory: " . path
  execute "pwd"
endfunction

