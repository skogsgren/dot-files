highlight default link DiaryDate StatusLine
highlight default link EmailNote Keyword
highlight default link MsgNote Keyword
highlight default link PhoneNote Keyword

syntax match DiaryDate "\v\d{4}-\d{2}-\d{2}"
syntax match EmailNote "@email"
syntax match MsgNote "@msg"
syntax match PhoneNote "@call"

set tw=99999
set fo=cq
set wm=0
set linebreak
set autoindent
nnoremap j gj
vnoremap j gj
onoremap j gj
nnoremap k gk
vnoremap k gk
onoremap k gk
nnoremap 0 g0
nnoremap $ g$
cabbr q qa
cabbr wq wqa
