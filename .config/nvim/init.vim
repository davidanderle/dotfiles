"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							  VIM UI					      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable autoread when file is changed externally (after 1s of 
" normal mode inactivity)
set autoread
set updatetime=1000
au CursorHold * checktime

"Enable relative and normal line numbering
set relativenumber
set ruler
set number

"Disable the creation of swp files
set noswapfile

"Enable select all using mouse
set mouse=a

"Show commands in bottom bar
set showcmd

"Set to auto read when a file is changed from outside
set autoread

"Enable filetype plugins
filetype plugin on
filetype indent on

"Turn on Wild Menu
set wildmenu

"Use many level of undo
set undolevels=100

"Turn beeping off
set visualbell
set noerrorbells

"Height of the command bar
set cmdheight=1

"Bracket auto-completition
inoremap '      ''<Left>
inoremap '<CR>  '<CR>'<Esc>O
inoremap ''     '
 
inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ))     )
inoremap ()     ()
 
inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap ]]     ]
inoremap []     []
 
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap }}     }
inoremap {}     {}<Left>

"Unbind arrow keys in normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"map ; to : in normal mode (saves key strikes)
nnoremap ; :

"VIM key leader is set ','
let mapleader=","

"Move to the beginning of line with Shift-B
nnoremap B ^
nnoremap $ <nop>
vnoremap B ^
vnoremap $ <nop>
"Move to the end of a line with Shift-E
nnoremap E $
nnoremap ^ <nop>
vnoremap E $
vnoremap ^ <nop>
"Delete line from the right of the cursor till the end
nnoremap dE d$
nnoremap d$ <nop>
vnoremap dE d$
vnoremap d$ <nop>
"Delete line from the left of the cursor till the beginning
nnoremap dB d^
nnoremap d^ <nop>
vnoremap dB d^
vnoremap d^ <nop>

"rdaw: Delete a word (stays in norm)
"diw: Delete inner word
"dw: Delete word right to the cursor
"
"caw: Change a word (goes to ins)
"ciw: Chage inner word
"cw: Changes word right to the cursor

"Show matching brackets when text indicator is over them
set showmatch

"A buffer becomes hidden when it is not used
set hid

"Centeres lines to the middle of window
set scrolloff=5

"Toggle/untoggle paste mode
set pastetoggle=<F2>

colorscheme noctu

"Highlight search results (using /something)
set hlsearch

"Turn off search highlighting when not used pressing Ctrl-l
nnoremap <silent><C-l> :nohlsearch<CR>

"Incremental search (search during typing)
set incsearch

"Sets tab to 4 spaces"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

"Map source ~/.vimrc to ,vimrc (load .vimrc)
"map <leader>vimrc :source ~/.vimrc<CR>

"highlight the 81th char in the row
"call matchadd('ColorColumn', '\%81v.', 100)
highlight ColorColumn ctermbg=234
set colorcolumn=80

"Enable folding (hide lines)
set foldenable
set foldlevelstart=10
"Max nested folding is 5
set foldnestmax=5
"Map Ctrl-f to opening/closing folds
nnoremap <C-f> za
nnoremap <C-f> <nop>
"Fold based on indentation
set foldmethod=indent

"Turn off comment completition upon new line from a commented line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"Set line comments to ,// in normal mode
map <silent><leader>// mxBi//<esc>`xll
"Set line uncomments to ,.. in normal mode
map <silent><leader>.. mxBxx`xhh

nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap q <C-v>

"copy between vims copy to buffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

" Name tmux window to the open file's name
autocmd BufEnter * let &titlestring = '' . expand("%:t")
autocmd VimLeave * call system("tmux rename-window bash")
set title

" Set window split delimeters
set fillchars+=vert:\|
set fillchars+=stlnc:-
set fillchars+=stl:-

"Echoes the current function being edited to the status line
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
map \func :let name = WhatFunctionAreWeIn()<CR> :echo name<CR>

" Search for word under cursor and replace with given text for files in arglist.
"<leader>r rWord (:Replace rWord), to replace all with confirmation
":Replace! rWord, to replace all without confirmation
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
nnoremap <Leader>r :call Replace(0, input('Replace '.expand('<cword>').' with: '))<CR>

" Map ctrl-w to close vim tabs
map <C-w> :tabclose<CR>

" Map ctrl-t to new tab
map <C-t> :tabnew .<CR>

" Map shift-j to prev tab (like vimium)
map <S-j> :tabprevious<CR>
" Map shift-k to prev tab (like vimium)
map <S-k> :tabnext<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"						     NVIM UI					      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map ,vimrc to nvimrc load
map <leader>vimrc :source ~/.config/nvim/init.vim<CR>

"Disable 'upper' status bar in nvim
set laststatus=0
