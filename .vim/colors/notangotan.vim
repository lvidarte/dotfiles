" ============================================================================
" File:        notangotan.vim
" Version:     0.2
" Description: 256 vim color scheme -- (don't work in gvim) --
" Maintainer:  Leonardo Vidarte <lvidarte[at]gmail>
" Last Change: Nov 11, 2014
" ============================================================================

set background=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "notangotan"

" Default Colors
"hi Normal           cterm=NONE      ctermfg=7       ctermbg=232
hi Normal           cterm=NONE      ctermfg=7
hi NonText          cterm=NONE      ctermfg=236
hi LineNR           cterm=NONE      ctermfg=245     ctermbg=233
"hi Cursor       guibg=#d3d7cf
"hi lCursor      guibg=#d3d7cf

"" Search
hi Search           cterm=NONE                      ctermbg=226
hi IncSearch        cterm=NONE      ctermfg=0       ctermbg=82
hi Question         cterm=NONE      ctermfg=220
hi Pmenu            cterm=NONE      ctermfg=39      ctermbg=234
hi PmenuSel         cterm=NONE      ctermfg=7       ctermbg=33
hi PmenuSbar        cterm=NONE                      ctermbg=233
hi PmenuThumb       cterm=NONE                      ctermbg=33

"" Window Elements
hi StatusLine       cterm=NONE      ctermfg=253     ctermbg=234
hi StatusLineNC     cterm=NONE      ctermfg=240     ctermbg=234
hi VertSplit        cterm=NONE      ctermfg=245     ctermbg=233
hi Folded           cterm=NONE      ctermfg=244     ctermbg=235
hi Visual           cterm=reverse   ctermfg=230     ctermbg=238
hi TabLine          cterm=NONE      ctermfg=243     ctermbg=234
hi TabSel           cterm=bold      ctermfg=7       ctermbg=232
hi TabLineFill      cterm=reverse   ctermfg=234     ctermbg=236
hi ColorColumn      cterm=NONE      ctermfg=253     ctermbg=232

"" Specials
hi Directory        cterm=NONE      ctermfg=39
hi Title            cterm=NONE      ctermfg=220
hi WarningMsg       cterm=NONE      ctermfg=243
hi MatchParen       cterm=NONE      ctermfg=238     ctermbg=230
"hi Todo         ctermfg=white ctermbg=green
"hi Title        ctermfg=white cterm=bold

"" Syntax
hi Constant         cterm=NONE      ctermfg=70
hi String           cterm=NONE      ctermfg=137
hi Number           cterm=NONE      ctermfg=208
hi Statement        cterm=NONE      ctermfg=220
hi Identifier       cterm=NONE      ctermfg=39
hi Function         cterm=bold      ctermfg=33
hi Delimiter        cterm=NONE      ctermfg=245
hi PreProc          cterm=NONE      ctermfg=208
hi Comment          cterm=NONE      ctermfg=244
hi Type             cterm=bold      ctermfg=70
hi Special          cterm=NONE      ctermfg=82
hi SpecialKey       cterm=NONE      ctermfg=236
hi Structure        cterm=NONE      ctermfg=82
hi Error            cterm=NONE      ctermfg=white       ctermbg=DarkRed
hi SpellBad         cterm=NONE      ctermfg=white       ctermbg=DarkRed
hi StorageClass     cterm=NONE      ctermfg=39
hi Tag              cterm=NONE      ctermfg=246
hi Repeat           cterm=NONE      ctermfg=40 "57"
hi Exception        cterm=NONE      ctermfg=201
hi Underlined       cterm=underline ctermfg=39

"" Diff
"hi DiffAdd      guifg=fg guibg=#3465a4 gui=none
"hi DiffAdd      ctermfg=gray ctermbg=blue cterm=none
"hi DiffChange   guifg=fg guibg=#555753 gui=none
"hi DiffChange   ctermfg=gray ctermbg=darkgray cterm=none
"hi DiffDelete   guibg=bg
"hi DiffDelete   ctermfg=gray ctermbg=none cterm=none
"hi DiffText     guifg=fg guibg=#c4a000 gui=none
"hi DiffText     ctermfg=gray ctermbg=yellow cterm=none

" CSS
hi link cssIdentifier   Identifier
hi link cssBraces       Delimiter
hi link cssCommonAttr   Constant

" HTML
hi link htmlTag         Tag
hi link htmlEndTag      Tag

" Python
hi link pythonString    String
hi link pythonDot       String
hi link pythonOperator  Number
hi pythonDecorator      cterm=NONE  ctermfg=26
hi pythonBuiltin        cterm=NONE  ctermfg=129
hi pythonEscape         cterm=NONE  ctermfg=196
hi pythonConditional    cterm=NONE  ctermfg=202
hi pythonSync           cterm=NONE  ctermfg=195
hi pythonSpaceError     cterm=NONE  ctermfg=205

" Django
hi link djangoArgument  String
hi link djangoComBlock  Comment
hi link djangoComment   Comment
hi link djangoError     Error
hi link djangoTagBlock  PreProc
hi link djangoVarBlock  Identifier
hi link djangoStatement Number
hi link djangoFilter    Exception

" NERDTree
hi NERDTreeDir          cterm=NONE  ctermfg=39

" Buffer explorer
hi link bufExplorerMapping      Number
hi link bufExplorerTitle        Number
hi link bufExplorerToggleSplit  Number
hi link bufExplorerSplit        Number

" GitGutter
hi SignColumn                  ctermbg=Black
hi GitGutterAddDefault         cterm=NONE  ctermfg=2
hi GitGutterChangeDefault      cterm=NONE  ctermfg=3
hi GitGutterDeleteDefault      cterm=NONE  ctermfg=1
hi GitGutterAddInvisible       cterm=NONE  ctermfg=26
hi GitGutterChangeInvisible    cterm=NONE  ctermfg=26
hi GitGutterDeleteInvisible    cterm=NONE  ctermfg=26

" vim: set expandtab :
