" Scheme setup {{{
set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="noctu"

"}}}
" Vim UI {{{
hi ColorColumn                       ctermbg=234
hi Cursor              ctermfg=8     ctermbg=0
hi CursorLine                        ctermbg=NONE  cterm=NONE
hi CursorLineNr        ctermfg=39    ctermbg=NONE  cterm=NONE
hi Folded              ctermfg=39    ctermbg=NONE
hi IncSearch           ctermfg=0     ctermbg=13    cterm=NONE
hi LineNr              ctermfg=8     ctermbg=NONE
hi MatchParen          ctermfg=8     ctermbg=NONE  cterm=underline
hi NonText             ctermfg=8
hi Pmenu               ctermfg=8     ctermbg=234
hi PmenuSBar                         ctermbg=8
hi PmenuSel            ctermfg=15    ctermbg=39
hi PmenuThumb          ctermbg=8
hi Search              ctermfg=0     ctermbg=39
hi SpellBad            ctermfg=9     ctermbg=NONE  cterm=underline
hi SpellCap            ctermfg=10    ctermbg=NONE  cterm=underline
hi SpellLocal          ctermfg=13    ctermbg=NONE  cterm=underline
hi SpellRare           ctermfg=11    ctermbg=NONE  cterm=underline
hi StatusLine          ctermfg=8     ctermbg=0     cterm=bold
hi StatusLineNC        ctermfg=8     ctermbg=0     cterm=NONE
hi TabLine             ctermfg=8     ctermbg=0     cterm=NONE
hi TabLineSel          ctermfg=39    ctermbg=0
hi VertSplit           ctermfg=8     ctermbg=0     cterm=NONE
hi Visual              ctermfg=0     ctermbg=39
hi Directory           ctermfg=39
hi Title               ctermfg=3     cterm=bold
hi ErrorMsg            ctermfg=197   ctermbg=234
hi DiffAdd             ctermfg=0     ctermbg=2
hi DiffChange          ctermfg=0     ctermbg=3
hi DiffDelete          ctermfg=0     ctermbg=1
hi DiffText            ctermfg=0     ctermbg=11    cterm=bold
hi ModeMsg             ctermfg=39    ctermbg=NONE
hi MsgArea             ctermfg=39    ctermbg=NONE
hi MoreMsg             ctermfg=39    ctermbg=NONE
hi! link SignColumn    LineNr
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link Question      MoreMsg
hi! link TabLineFill   StatusLineNC
hi! link SpecialKey    NonText

hi Delimiter       ctermfg=8
hi Comment         ctermfg=8
hi Underlined      ctermfg=4   cterm=underline
hi Type            ctermfg=44  cterm=bold
hi StorageClass    ctermfg=6
hi Typedef         ctermfg=6
hi Structure       ctermfg=6
hi PreProc         ctermfg=15
hi String          ctermfg=39  cterm=bold
hi Keyword         ctermfg=2
hi Todo            ctermfg=15  ctermbg=NONE     cterm=bold,underline
hi Function        ctermfg=15  cterm=bold
hi Identifier      ctermfg=15  cterm=bold
hi Statement       ctermfg=215 cterm=bold
hi Constant        ctermfg=198 cterm=bold
hi Number          ctermfg=206
hi Boolean         ctermfg=13  cterm=bold
hi Special         ctermfg=15 cterm=bold
hi Ignore          ctermfg=3
hi! link Error     ErrorMsg

"}}}
" Markdown {{{
hi! link markdownHeadingRule        NonText
hi! link markdownHeadingDelimiter   markdownHeadingRule
hi! link markdownLinkDelimiter      Delimiter
hi! link markdownURLDelimiter       Delimiter
hi! link markdownCodeDelimiter      NonText
hi! link markdownLinkTextDelimiter  markdownLinkDelimiter
hi! link markdownUrl                markdownLinkText
hi! link markdownAutomaticLink      markdownLinkText
hi! link markdownCodeBlock          String
hi markdownCode                     cterm=bold
hi markdownBold                     cterm=bold
hi markdownItalic                   cterm=underline

"}}}
" Git {{{
hi gitCommitBranch               ctermfg=3
hi gitCommitSelectedType         ctermfg=10
hi gitCommitSelectedFile         ctermfg=2
hi gitCommitUnmergedType         ctermfg=9
hi gitCommitUnmergedFile         ctermfg=1
hi! link gitCommitFile           Directory
hi! link gitCommitUntrackedFile  gitCommitUnmergedFile
hi! link gitCommitDiscardedType  gitCommitUnmergedType
hi! link gitCommitDiscardedFile  gitCommitUnmergedFile

"}}}
" Vimwiki {{{
hi! link VimwikiHeaderChar  markdownHeadingDelimiter
hi! link VimwikiList        markdownListMarker
hi! link VimwikiCode        markdownCode
hi! link VimwikiCodeChar    markdownCodeDelimiter

"}}}
" Help {{{
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined
"}}}

" vim: fdm=marker:sw=2:sts=2:et
