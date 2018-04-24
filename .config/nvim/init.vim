""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        						     NVIM UI        					       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" Set undo directory so that after exitting files, some steps are retained
if has("persistent_undo")
    silent !mkdir -p ~/.undodir
    set undodir=~/.undodir/
    set undofile
endif

"Disable 'upper' status bar in nvim.
set laststatus=0
set diffopt+=vertical

" Plugin manager plugin for nvim: https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugs')
" Fuzzy search: https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git from vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Bracket autocompletion
Plug 'jiangmiao/auto-pairs'
" Forwards and backwards search replacement, plus new s search feature
Plug 'justinmk/vim-sneak'
" Underline matched words in the current buffer
Plug 'itchyny/vim-cursorword'
" Tab autocompletion
Plug 'ervandew/supertab'
" Peek into the contents of copy-paste-record buffers i<C-r>, n", n@ to peek
Plug 'junegunn/vim-peekaboo'
" Error and warning underlining 
Plug 'w0rp/ale'
call plug#end()

" Sneak
let g:sneak#label = 1
let g:sneak#s_next = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
" ALE
let g:ale_linters = {'c': ['gcc'],'cpp': ['gcc'],'cs': ['mcsc'],}
let g:ale_c_gcc_options = '-I include -Wall'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '-'
let g:ale_list_window_size = 5
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        						     VIM UI         					       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable autoread when file is changed externally (after 1s of 
" normal mode inactivity)
set autoread
set updatetime=1000
au CursorHold * checktime

" Enable relative and normal line numbering
set relativenumber
set ruler
set number

" Disable the creation of swp files
set noswapfile

" Enable select all using mouse
set mouse=a

" Show commands in bottom bar
set showcmd

" Set to auto read when a file is changed from outside
set autoread

" Show search and replace results in split tab
set inccommand=split

" Enable filetype plugins, filetype filtering, and filetype based indentaion
filetype plugin indent on

" Enable syntax highlight
syntax on

" Set scripts to be executable from the shell
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif

" Turn on Wild Menu
set wildmenu

" Use many level of undo
set undolevels=100

" Turn beeping off
set visualbell
set noerrorbells

" Height of the command bar
set cmdheight=1

" Move to the beginning of line with Shift-B
nnoremap B ^
vnoremap B ^
" Move to the end of a line with Shift-E
nnoremap E $
vnoremap E $
" Delete line from the right of the cursor till the end
nnoremap dE d$
vnoremap dE d$
" Delete line from the left of the cursor till the beginning
nnoremap dB d^
vnoremap dB d^

" Bracket auto-completition
"inoremap '      ''<Left>
"inoremap '<CR>  '<CR>'<Esc>O
inoremap ''     '
"
"inoremap "      ""<Left>
"inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "

"inoremap (      ()<Left>
"inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ))     )
"inoremap ()     ()
"
"inoremap [      []<Left>
"inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap ]]     ]
"inoremap []     []

"inoremap {      {}<Left>
autocmd FileType jav,java inoremap <leader> {<CR>  {<CR>}<Esc>O
autocmd FileType c,h,cpp,hpp,cs inoremap <leader> {<CR>  <Esc>o{<CR>}<Esc>O
inoremap {{     {
inoremap }}     }
"inoremap {}     {}<Left>

" Delete surrounding parentheses
nnoremap <leader>x) zdi(va(p`z
nnoremap <leader>x] mzdi[va[p`z
nnoremap <leader>x} mzdi{va{p`z
nnoremap <leader>x( mzdi(va(p`z
nnoremap <leader>x[ mzdi[va[p`z
nnoremap <leader>x{ mzdi{va{p`z

" Unbind arrow keys in normal mode
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

" map f search repetitions forward and backward
nnoremap <leader>n ;
nnoremap <leader>, ,

" map ; to : in normal mode
nnoremap ; :

" VIM key leader is set space
let mapleader=" "

" Show matching brackets when text indicator is over them
set showmatch

" A buffer becomes hidden when it is not used
set hid

" Centeres lines to the middle of window
set scrolloff=5

" Toggle/untoggle paste mode
set pastetoggle=<F2>

" Set coloscheme to ~/.config/nvim/colors/noctu or ~/.vim/colors/noctu
colorscheme noctu

" Highlight search results (using /something)
set hlsearch

" Incremental search (search during typing)
set incsearch

" Sets tab to 4 spaces"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

" Map source ~/.vimrc to ,vimrc (load .vimrc)
" map <leader>vimrc :source ~/.vimrc<CR>

" highlight the 81th char in the row
" call matchadd('ColorColumn', '\%81v.', 100)
" highlight ColorColumn ctermbg=234 "Excluded due to bug
set colorcolumn=80

" Enable folding (hide lines)
set foldenable
set foldlevelstart=10
" Max nested folding is 5
set foldnestmax=5
" Fold based on indentation
set foldmethod=marker

" Turn off comment completition upon new line from a commented line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set line comments to ,// in normal mode
autocmd FileType c,h,cpp,hpp,cs,jav,java map <silent><leader>// myBi//<Esc>`yll
autocmd FileType vim map <buffer><silent><leader>// myBi" <Esc><Del>`yll
autocmd FileType sh map <buffer><silent><leader>// myBi#<Esc><Del>`yll
" Set line uncomments to ,.. in normal mode
autocmd FileType c,h,cpp,hpp,cs,jav,java map <silent><leader>.. myBxx`yhh
autocmd FileType vim map <buffer><silent><leader>.. myBx`yhh
autocmd FileType sh map <buffer><silent><leader>.. myBx`yhh

" Map tab and s-tab to indent and deindent, resp
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Map visual block from C-v to Q 
nnoremap Q <C-v>

" Create vimbuffer file
silent !touch -a ~/.vimbuffer
" Copy between vims copy to buffer
vnoremap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" Paste from buffer
inoremap <C-v> :r ~/.vimbuffer<CR>

" Ctrl-d forward delete word (opposed to ctrl-w)
inoremap <C-d> <Esc>lwcaw
" Name tmux window to the open file's name
autocmd BufEnter * let &titlestring = '' . expand("%:t")
autocmd VimLeave * call system("tmux rename-window bash")
set title

" Set window split delimeters
set fillchars+=vert:\|
set fillchars+=stlnc:-
set fillchars+=stl:-

" Echoes the current function being edited to the status line
function! WhatFunctionAreWeIn()
    let strList = ["while", "foreach", "ifelse", "if else", "for", "if", "else", "try", "catch", "case", "switch"]
    let foundcontrol = 1
    let position = ""
    let pos=getpos(".")          " This saves the cursor position
    let view=winsaveview()       " This saves the window view
    while (foundcontrol)
        let foundcontrol = 0
        normal [{
        call search('\S','bW')
        let tempchar = getline(".")[col(".") - 1]
        if (match(tempchar, ")") >=0 )
            normal %
            call search('\S','bW')
        endif
        let tempstring = getline(".")
        for item in strList
            if( match(tempstring,item) >= 0 )
                let position = item . " - " . position
                let foundcontrol = 1
                break
            endif
        endfor
        if(foundcontrol == 0)
            call cursor(pos)
            call winrestview(view)
            return tempstring.position
        endif
    endwhile
    call cursor(pos)
    call winrestview(view)
    return tempstring.position
endfunction
autocmd FileType c,h,cpp,hpp,cs,java,jav map <buffer> \func :let name = WhatFunctionAreWeIn()<CR> :echo name<CR>

" Search for word under cursor and replace with given text for files in arglist.
" <leader>r rWord (:Replace rWord), to replace all with confirmation
" :Replace! rWord, to replace all without confirmation
function! Replace(bang, replace)
    let flag = 'ge'
    if !a:bang
        let flag .= 'c'
    endif
    let search = '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag
endfunction
command! -nargs=1 -bang Replace :call Replace(<bang>0, <q-args>)
nnoremap <Leader>R :call Replace(0, input('Replace '.expand('<cword>').' with: '))<CR>
vnoremap <Leader>R :call Replace(0, input('Replace '.expand('<cword>').' with: '))<CR>

nnoremap <leader>r :%s/\<<C-r><C-w>\>//gcI\|norm``<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Map ctrl-x to close vim tabs
nnoremap <C-x> :tabclose<CR>

" Map ctrl-t to new tab
nnoremap <C-t> :tabnew .<CR>

" Map shift-j to prev tab (like vimium)
nnoremap <S-j> :tabprevious<CR>
" Map shift-k to prev tab (like vimium)
nnoremap <S-k> :tabnext<CR>

" Map Shift-t to restore 1 recently closed tab (assuming no split)
let g:reopenbuf = expand('%:p')
function! ReopenLastTabLeave()
    let g:lastbuf = expand('%:p')
    let g:lasttabcount = tabpagenr('$')
endfunction
function! ReopenLastTabEnter()
    if tabpagenr('$') < g:lasttabcount
        let g:reopenbuf = g:lastbuf
    endif
endfunction
function! ReopenLastTab()
    tabnew
    execute 'buffer' . g:reopenbuf
endfunction
augroup ReopenLastTab
    autocmd!
    autocmd TabLeave * call ReopenLastTabLeave()
    autocmd TabEnter * call ReopenLastTabEnter()
augroup END
nnoremap <S-t> :call ReopenLastTab()<CR>

" Save the current vim session to a file, using ,save
nnoremap <leader>save :mksession! 

" Map ov: edit vimrc, sv: source vimrc
nmap <silent> <leader>ov :e `=resolve(expand($MYVIMRC))`<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Open disassembly
nnoremap <leader>dis :vnew \|:r w/disassembly<CR> \|:vertical resize 86<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        						     LATEX           					       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For some reason this is set even in other filetypes (when .tex are also open)
" Auto-close $ mathmode
autocmd FileType tex,bib inoremap <buffer> $      $$<Left>
autocmd FileType tex,bib inoremap <buffer> $$     $

" Put \begin{} \end{} tags tags around the current word
autocmd FileType tex,bib map <buffer> <C-B>      YpkI\begin{{<ESC>A}}<ESC>jI\end{{<ESC>A}}<Esc>ko
autocmd FileType tex,bib map! <buffer> <C-B> <ESC>YpkI\begin{{<ESC>A}}<ESC>jI\end{{<ESC>A}}<Esc>ko

" Disable indentaion when using latex
autocmd FileType tex,bib setl noai nocin nosi inde=

" Turn on spellcheck in Latex documents
autocmd FileType tex,bib setlocal spell!
" Create and add personal dictionary. Use zg on the word to add it to the dict.
silent !touch -a ~/.config/nvim/en.utf-8.add
set spellfile=~/.config/nvim/en.utf-8.add
" Set default spell check language
set spelllang=en
" Set textwidth to 80 char for automatic formatting. Highlight and gq
autocmd FileType tex,bib set textwidth=80
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        						    USEFUL CMDS        					       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" zG ignores mispell once, z= suggests possible corrections

" rdaw: Delete a word (stays in norm)
" diw: Delete inner word
" dw: Delete word right to the cursor

" caw: Change a word (goes to ins)
" ciw: Chage inner word
" cw: Changes word right to the cursor

" di{, di(, di[: delete inner text inside a {}, () or [] bracket, and remain norm.
" ci{, ci(, ci[: delete inner text inside.. and go to insert mode.

" ,save filename.vim: saves the current vim session to a file
" :so filename.vim: loads a saved vim

" gg=G: corrects the indentations in the whole file
" vipgq": format paragraph
" qq<makro>q to record macro, @q to replay
highlight clear ALEErrorSign
highlight clear ALEWarningSign
