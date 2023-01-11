" lightly edited from the original available here:
" https://github.com/jcs/dotfiles/blob/master/.vim/colors/jcs.vim

set background=light

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "jcs"

hi Comment		cterm=NONE		ctermfg=242
hi Constant		cterm=underline		ctermfg=NONE
hi CursorLineNr		cterm=bold		ctermfg=248
hi DiffAdd		cterm=bold		ctermfg=NONE
hi DiffChange		cterm=bold		ctermfg=NONE
hi DiffDelete		cterm=bold		ctermfg=NONE
hi DiffText		cterm=reverse		ctermfg=NONE
hi Directory		cterm=bold		ctermfg=NONE
hi Error		cterm=NONE		ctermfg=NONE	ctermbg=224
hi ErrorMsg		cterm=NONE		ctermfg=NONE	ctermbg=224
hi FoldColumn		cterm=standout		ctermfg=NONE
hi Folded		cterm=standout		ctermfg=NONE
hi Identifier		cterm=underline		ctermfg=NONE
hi Ignore		cterm=bold		ctermfg=NONE
hi IncSearch		cterm=reverse		ctermfg=NONE
hi MatchParen		cterm=standout		ctermfg=NONE	ctermbg=grey
hi ModeMsg		cterm=bold		ctermfg=NONE
hi MoreMsg		cterm=bold		ctermfg=NONE
hi NonText		cterm=bold		ctermfg=NONE
hi PreProc		cterm=underline		ctermfg=NONE
hi Pmenu		cterm=NONE		ctermfg=NONE	ctermbg=253
hi PmenuSel		cterm=bold		ctermfg=NONE	ctermbg=253
hi Question		cterm=standout		ctermfg=NONE
hi Search		cterm=reverse		ctermfg=NONE
hi SignColumn		cterm=NONE		ctermfg=NONE	ctermbg=NONE
hi SpellBad		cterm=NONE		ctermfg=NONE	ctermbg=224
hi SpellLocal		cterm=NONE		ctermfg=NONE	ctermbg=223
hi Special		cterm=bold		ctermfg=NONE
hi SpecialKey		cterm=bold		ctermfg=NONE
hi Statement		cterm=bold		ctermfg=NONE
hi StatusLine		cterm=bold,reverse	ctermfg=NONE
hi StatusLineNC		cterm=reverse		ctermfg=NONE
hi TabLine		cterm=reverse		ctermfg=NONE	ctermbg=NONE
hi Title		cterm=bold		ctermfg=NONE
hi Todo			cterm=bold,standout	ctermfg=185	ctermbg=0
hi Type			cterm=bold		ctermfg=NONE
hi Underlined		cterm=underline		ctermfg=NONE
hi VertSplit		cterm=reverse		ctermfg=NONE
hi Visual		cterm=reverse		ctermfg=NONE	ctermbg=NONE
hi VisualNOS		cterm=bold,underline	ctermfg=NONE
hi WarningMsg		cterm=bold		ctermfg=NONE    ctermbg=NONE
hi WildMenu		cterm=standout		ctermfg=NONE

hi ColorColumn		cterm=NONE		ctermfg=NONE	ctermbg=grey

" enhancement: give vim that minimal newspaper vibe
hi htmlItalic    cterm=underline        ctermfg=NONE    ctermbg=NONE
hi texItalStyle  cterm=underline        ctermfg=NONE    ctermbg=NONE
hi VimwikiItalic cterm=underline        ctermfg=NONE    ctermbg=NONE
hi Identifier    cterm=NONE             ctermfg=NONE    ctermbg=NONE
hi texStyleItal  cterm=NONE             ctermfg=NONE    ctermbg=NONE

" enhancement: makes sense for them to have the same color as comments
hi LineNr       cterm=NONE              ctermfg=242     ctermbg=NONE

" fix: makes quickwindow readable for flake8
hi QuickFixLine cterm=bold              ctermfg=NONE    ctermbg=NONE
