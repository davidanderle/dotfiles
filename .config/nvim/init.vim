""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        						     NVIM UI        					       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" Set undo directory so that after exiting files, some steps can be redone
if has("persistent_undo")
    silent !mkdir -p ~/.undodir
    set undodir=~/.undodir/
    set undofile
endif

"Disable 'upper' status bar in nvim.
set laststatus=0
set diffopt+=vertical

" Plugin manager plugin for nvim: https://github.com/junegunn/vim-plug
" Automatically install manager and the plugins if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
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
" Name split tabs
Plug 'kcsongor/vim-tabbar'
" Replace
Plug 'dkprice/vim-easygrep'
" LaTeX
Plug 'lervag/vimtex'
" Debugging
Plug 'vim-scripts/Conque-GDB'
" Improved search to delete highlightings after jumps
Plug 'haya14busa/incsearch.vim'
" Indent line for easier backet matching
Plug 'Yggdroot/indentLine'
" Search highlighting
"Plug 'timakro/vim-searchant'
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
let g:SuperTabNoCompleteAfter = [')', ']', '>', '}', '\s', ',', ':', ';', '/', 
                               \ '=', '-', '+', '&', '|', '^', '$']
let g:SuperTabCrMapping = 1
" ALE
let g:ale_linters = {'c': ['gcc'],'cpp': ['gcc'],'cs': ['mcs'], 
                    \'Make': ['checkmake'], 'vim': ['vint'],
                    \'Bash': ['shellcheck']}
let g:ale_linters_explicit = 1
let g:ale_c_gcc_options = '-I "include" -I "fx/fw_lib/1_3_3/inc" -Wall'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '-'
let g:ale_list_window_size = 5
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
" Tabbar
set tabline=%!tabbar#tabline()
nnoremap <leader>n :call tabbar#rename_current_tab()<cr>
" Easygrep
let g:EasyGrepMode = 2
let g:EasyGrepCommand = 1
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepInvertWholeWord = 1
" Vimtex
let g:vimtex_compiler_enabled = 0
" Conque-GDB
let g:ConqueGdb_GdbExe = 'arm-none-eabi-gdb'
let g:ConqueGdb_Leader = ','
" Insearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" IndentLine
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0
nnoremap <leader>itog :IndentLinesToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        						     VIM UI         					       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable autoread when file is changed externally (after 1s normal m inactivity)
set autoread
set updatetime=1000
au CursorHold * checktime

" Encoding
set encoding=utf-8

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

" Always open the splits on the right side
set splitright

" Ignore the cases when searching, except when including upper cases
set ignorecase
set smartcase

" Turn on Wild Menu
set wildmenu

" Use many level of undo
set undolevels=100

" Turn beeping off
set visualbell
set noerrorbells

" Height of the command bar
set cmdheight=1

" Show matching brackets when text indicator is over them
set showmatch

" A buffer becomes hidden when it is not used
set hid

" Centers lines to the middle of window
set scrolloff=5

" Toggle/untoggle paste mode
set pastetoggle=<F2>

" Highlight search results (using /something)
set hlsearch

" Incremental search (search during typing)
set incsearch

" Visualize tabs and newlines
set list
set listchars=tab:▸\ ,nbsp:.,trail:·

" Always show tabline
set showtabline=2

" Show trailing whitespace and spaces for tabs
"map <leader>L /\s\+$<CR>

" Sets tab to 4 spaces"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Highlight the 80 char column
set colorcolumn=80

" Enable folding (hide lines)
set foldenable
set foldlevelstart=10
" Max nested folding is 5
set foldnestmax=5
" Fold based on indentation
set foldmethod=syntax

" Enable filetype plugins, filetype filtering, and filetype based indentaion
filetype plugin indent on

" Enable syntax highlight
syntax on

" Set scripts to be executable from the shell
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif

" VIM key leader is set space
let mapleader=" "

" Set coloscheme to ~/.config/nvim/colors/noctu or ~/.vim/colors/noctu
colorscheme noctu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        						    MAPPINGS         					       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to the beginning of line with Shift-B
"nnoremap B ^
"vnoremap B ^
" Move to the end of a line with Shift-E
nnoremap E $
vnoremap E $
" Delete line from the right of the cursor till the end
nnoremap dE d$
vnoremap dE d$
" Delete line from the left of the cursor till the beginning
"nnoremap dB d^
"vnoremap dB d^

" Bracket auto-completition
inoremap ''     '

inoremap ""     "

inoremap ((     (
inoremap ))     )
inoremap ()     ()

inoremap [[     [
inoremap ]]     ]
inoremap []     []

autocmd FileType jav,java inoremap <leader> {<CR>  {<CR>}<Esc>O
autocmd FileType c,h,cpp,hpp,cs inoremap <leader> {<CR>  <Esc>o{<CR>}<Esc>O
inoremap {{     {
inoremap }}     }

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
" Map Ctrl-space to substitute a non-word regex character. Useful for multi-line
"searches and for words separated by an unknown type and unknown number of chars
cmap <c-space> \_W\+

" map ; to : in normal mode
nnoremap ; :

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

" Turn off comment completition upon new line from a commented line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set line comments to ,// in normal mode
autocmd FileType c,h,cpp,hpp,cs,jav,java map <silent><leader>// my<C-^>i//<Esc>`yll
autocmd FileType vim map <buffer><silent><leader>// myBi" <Esc><Del>`yll
autocmd FileType sh map <buffer><silent><leader>// myBi#<Esc><Del>`yll
" Set line uncomments to ,.. in normal mode
autocmd FileType c,h,cpp,hpp,cs,jav,java map <silent><leader>.. myBxx`yhh
autocmd FileType vim map <buffer><silent><leader>.. myBx`yhh
autocmd FileType sh map <buffer><silent><leader>.. myBx`yhh

" Map tab and s-tab to indent and deindent, resp
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
inoremap <C-d> <Esc>lcaw
" Name tmux window to the open file's name
autocmd BufEnter * let &titlestring = '' . expand("%:t")
autocmd VimLeave * call system("tmux rename-window bash")
set title

" Set window split delimeters
set fillchars+=vert:\|
set fillchars+=stlnc:-
set fillchars+=stl:-

" Search for word under cursor and replace with given text <leader>r rWord 
nnoremap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI\|norm``<Left><Left><Left>
							\ <Left><Left><Left><Left><Left><Left><Left><Left>

" Map space-x to close vim tabs
nnoremap <leader>w :tabclose<CR>

" Map space-t to new tab
nnoremap <leader>t :tabnew .<CR>

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

" TODO: set winfixwidth
" Save the current vim session to a file, using ,save
nnoremap <leader>save :set winfixwidth \| :mksession! workspace.vim<CR>

" Peak function definition
nnoremap <leader>peek <C-w><C-]>

" Map space-m to compile after save
"autocmd FileType c,cpp,h,hpp nnoremap <leader>m :wa! \| make

" Map ov: open vimrc, sv: source vimrc
nmap <silent> <leader>ov :e `=resolve(expand($MYVIMRC))`<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Open memory map
nnoremap <leader>map :vnew \| :setlocal buftype=nofile \| 
                   \ :setlocal bufhidden=hide \| :r bin/memory.map<CR> \| 
                   \ :vertical resize 86<CR>
" Open disassembly
nnoremap <leader>dis :call Disassembly()<CR>
" Create disassembly file if non-existant
function! Disassembly()
    if !filereadable("w/disassembly")
        make disassembly
    endif
    vnew | setlocal buftype=nofile | setlocal bufhidden=hide | r w/disassembly | 
         \ vertical resize 87
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        						     LATEX           					       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't jump to the errors after calling :make. Also, save the file befor make
autocmd FileType tex,bib nnoremap <leader>m :wa! \| :make!

" For some reason this is set even in other filetypes (when .tex are also open)
" Auto-close $ mathmode
autocmd FileType tex,bib inoremap <buffer> $      $$<Left>
autocmd FileType tex,bib inoremap <buffer> $$     $
"
"" Put \begin{} \end{} tags tags around the current word
autocmd FileType tex,bib map <buffer> <C-B> YpkI\begin{{<ESC>A}}<ESC>jI\end{{<ESC>A}}<Esc>ko
autocmd FileType tex,bib map! <buffer> <C-B> <ESC>YpkI\begin{{<ESC>A}}<ESC>jI\end{{<ESC>A}}<Esc>ko

" Disable indentation when using latex
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
