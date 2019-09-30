""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   MAPPINGS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM key leader is set space (must be set first)
let mapleader=" "
" Delete surrounding parentheses
nnoremap <leader>x) zdi(va(p`z
nnoremap <leader>x] mzdi[va[p`z
nnoremap <leader>x} mzdi{va{p`z
nnoremap <leader>x( mzdi(va(p`z
nnoremap <leader>x[ mzdi[va[p`z
nnoremap <leader>x{ mzdi{va{p`z
" Turn of comment line insertion on enter in a comment
set formatoptions-=ro
" map ; to : in normal mode
nnoremap ; :
" Map visual block from C-v to Q
nnoremap Q <C-v>
" Unbind arrow keys in normal mode
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>
" Pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<CR>
" Map Ctrl-space to substitute a non-word regex character. Useful for multi-line
"searches and for words separated by an unknown type and number whitespaces
cmap <c-space> \_W\+
" Map tab and s-tab to indent and unindent, resp
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Create vimbuffer file if doesn't exist
silent !touch -a ~/.vimbuffer
" Copy between vims copy to buffer
vnoremap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" Paste from buffer
inoremap <C-v> :r ~/.vimbuffer<CR>
" Paste from system clip board
noremap <silent><RightMouse> me:r !paste.exe<CR>0D`eP`e
" Ctrl-d forward delete word (opposed to ctrl-w)
inoremap <C-d> <Esc>lde
" Name tmux window to the open file's name
autocmd BufEnter * let &titlestring = '' . expand("%:t")
autocmd VimLeave * call system("tmux rename-window bash")
" Search for word under cursor and replace with given text <leader>r rWord
nnoremap <leader>r :Replace <C-r><C-w> 
" Map space-w to close current vim tab
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
nnoremap <C-S-t> :call ReopenLastTab()<CR>
" Save the current vim session to a file, using ,save
nnoremap <leader>save :set winfixwidth \| :mksession! workspace.vim<CR>
" Peak function definition
nnoremap <leader>peek <C-w><C-]>
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
"                                Char rendering                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax match [Group] [regex]{ms=int,me=int} conceal cchar=[single char]
au! FileType * syntax match Operators "<=" conceal cchar=≤
au! FileType * syntax match Operators ">=" conceal cchar=≥
au! FileType * syntax match Operators "==" conceal cchar=≡
au! FileType * syntax match Operators "->" conceal cchar=→
au! FileType * syntax match Operators "<-" conceal cchar=←
au! FileType * syntax match Operators "=>" conceal cchar=⇒
au! FileType * syntax match Operators "<=" conceal cchar=⇐
au! FileType * syntax match Operators "::" conceal cchar=∷
au! FileType * syntax match Operators "!=" conceal cchar=≠

" Allow conceal in normal, insert, and visual modes
set conceallevel=1
set concealcursor=niv

" Allow highlighting on the above operators
hi link Operators Operator
hi! link Conceal Operator
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   PLUGINS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager plugin for nvim: https://github.com/junegunn/vim-plug
" Automatically install manager and the plugins if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugs')
" Fuzzy search files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git manager
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Automatic comment-string recognition
Plug 'tpope/vim-commentary'
" Bracket autocompletion
Plug 'jiangmiao/auto-pairs'
" Forwards and backwards search replacement
Plug 'justinmk/vim-sneak'
" Underline matched words in the current buffer
Plug 'itchyny/vim-cursorword'
" Text autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Peek into the contents of copy-paste-record buffers i<C-r>, n", n@ to peek
Plug 'junegunn/vim-peekaboo'
" Error and warning marking from quickfix
Plug 'mh21/errormarker.vim'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Name split tabs
Plug 'kcsongor/vim-tabbar'
" Replace
Plug 'dkprice/vim-easygrep'
" LaTeX
Plug 'lervag/vimtex'
" Debugging
Plug 'vim-scripts/Conque-GDB'
" Improved search to delete highlighting after jumps
Plug 'haya14busa/incsearch.vim'
" Indent line for easier bracket matching
Plug 'Yggdroot/indentLine'
" Rust language file and syntax support
Plug 'rust-lang/rust.vim'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    VIM UI                                    "
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
" Create and add personal dictionary. zg->Add to dict, z= to choose suggestion
silent !touch -a ~/.config/nvim/en.utf-8.add
set spellfile=~/.config/nvim/en.utf-8.add
" Set default spell check language
set spelllang=en
" Set textwidth to 80 char for automatic formatting. Highlight and gq
set textwidth=80
" Update the terminal window's name based on the current vim buffer
set title
set titleold=
" Set window split delimiters
set fillchars+=vert:\|
set fillchars+=stlnc:-
set fillchars+=stl:-
" Enable autoread when file is changed externally (after 1s normal m inactivity)
set autoread
set updatetime=500
au CursorHold * checktime
" Encoding
set encoding=utf-8
" Enable relative and normal line numbering
set number
set relativenumber
" Disable the creation of swp files
set noswapfile
" Enable select all using mouse
set mouse=a
" Always show sign column
set signcolumn=yes
" Show commands in bottom bar
set showcmd
" Enable ruler status line and show totalLine/currentLine, column, page%
set ruler
set rulerformat=%2v:%l/%L\ %3p%%
"Disable 'upper' status bar in nvim.
set laststatus=0
set diffopt+=vertical
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
" Set ctags file
set tags+="../tags"
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
set scrolloff=2
" Toggle paste mode
set pastetoggle=<F2>
" Highlight search results
set hlsearch
" Incremental search (search during typing)
set incsearch
" Visualize tabs and newlines
set list
set listchars=tab:▸\ ,nbsp:.,trail:·
" Always show tabline on top
set showtabline=2
" Sets tab to 4 spaces"
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
" Set coloscheme to ~/.config/nvim/colors/noctu.vim
colorscheme noctu
" For type, #define, and enum highlighting
autocmd BufRead,BufNewFile *.[ch] call HighlightTypes()
function! HighlightTypes()
  let fname = expand('<afile>:p:h') . '/../highlight.vim'
  if filereadable(fname)
    exe 'so ' . fname
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                PLUGIN CONFIGS                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
noremap <leader>f :FZF<cr>
" Sneak
let g:sneak#label = 1
let g:sneak#s_next = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T
map <leader>, <Plug>Sneak_,
map <leader>. <Plug>Sneak_;
" Tabbar
set tabline=%!tabbar#tabline()
" Easygrep
let g:EasyGrepMode = 2
let g:EasyGrepCommand = 1
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepInvertWholeWord = 1
map <silent><leader>gw <plug>EgMapGrepCurrentWord_v
" Vimtex
let g:vimtex_compiler_enabled = 0
" Conque-GDB
let g:ConqueGdb_GdbExe = 'arm-none-eabi-gdb'
let g:ConqueGdb_Leader = ','
" Insearch
let g:incsearch#auto_nohlsearch = 1
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
" IndentLine
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0
nnoremap <leader>itog :IndentLinesToggle<CR>
"Rust"
let g:syntastic_rust_checkers = []
let g:rust_fold = 1
" CoC
" Map tab and shift-tab to circulate in matchestod
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Enter triggers completion without a carriage return
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)
" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Unicode chars unsupported in WSL (yet)
"let g:rust_conceal = 1
"let g:rust_conceal_mod_path = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    LATEX                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType tex,bib call SetLatexOptions()
function! SetLatexOptions()
    " Don't jump to errors after calling :make. Also, save the file before make
    nnoremap <leader>m :wa! \| :make!"
    " For some reason this is set even in other filetypes (when .tex are also open)
    " Auto-close $ mathmode
    inoremap <buffer> $      $$<Left>
    inoremap <buffer> $$     $
    " Put \begin{} \end{} tags tags around the current word
    map <buffer> <C-B> YpkI\begin{{<ESC>A}}<ESC>jI\end{{<ESC>A}}<Esc>ko
    map! <buffer> <C-B> <ESC>YpkI\begin{{<ESC>A}}<ESC>jI\end{{<ESC>A}}<Esc>ko
    " Disable indentation when using latex
    setl noai nocin nosi inde=
    " Turn on spellcheck in Latex documents
    setlocal spell!
endfunction

