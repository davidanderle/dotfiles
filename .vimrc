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
map <leader>vimrc :source ~/.vimrc<CR>

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

map <leader>: mx@='Bi//<lt><esc>j'`xll

nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"highlight the 81th char in the row
highlight ColorColumn ctermbg=234
"call matchadd('ColorColumn', '\%81v.', 100)
set colorcolumn=80

nnoremap q <C-v>

set clipboard=unnamed

"copy between vims copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-v> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

vnoremap ty "+y
vnoremap tY "+Y
vnoremap tp "+p
vnoremap tP "+P

" Name tmux window to the open file's name
autocmd BufEnter * let &titlestring = '' . expand("%:t")
autocmd VimLeave * call system("tmux rename-window bash")
set title
