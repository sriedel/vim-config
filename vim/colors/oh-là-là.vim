"
" Oh-là-là Vim Color Scheme (alternative name: Oh-la-vache)
" =========================================================
"
" Dark color scheme with black background.
" Colors used in the GUI version: Coral, Chocolate, DarkGoldenRod, LimeGreen,
" RoyalBlue, SlateGray, Khaki, and even DeepPink.
"
" author: Alexey Muranov <muranov@math.univ-toulouse.fr>
"
set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "oh-là-là"

" Default Colors
highlight Normal       guifg=Khaki3 guibg=Black
highlight Normal       ctermfg=Grey ctermbg=Black
highlight NonText      guifg=SlateGrey guibg=Gray20 gui=NONE
highlight NonText      ctermfg=DarkGrey ctermbg=DarkGray
highlight Cursor       guibg=Yellow guifg=Black
highlight Cursor       ctermbg=Yellow ctermfg=Black
highlight lCursor      guibg=Yellow guifg=Black
highlight lCursor      ctermbg=Yellow ctermfg=Black

" Search
highlight Search       guifg=NONE guibg=White gui=underline
highlight Search       ctermfg=NONE ctermbg=White cterm=NONE
" NOTE: reverse video is used by default
highlight IncSearch    guifg=Yellow guibg=Black gui=reverse
highlight IncSearch    ctermfg=Yellow ctermbg=Black cterm=reverse

" Window Elements
highlight StatusLine   guifg=Black guibg=Green gui=bold
highlight StatusLine   ctermfg=Black ctermbg=Green cterm=bold
highlight StatusLineNC guifg=SlateGray guibg=DarkGreen
highlight StatusLineNC ctermfg=Gray ctermbg=DarkGreen
highlight VertSplit    guifg=Gray guibg=Gray
highlight Folded       guifg=White guibg=Magenta
highlight Folded       ctermfg=White ctermbg=Magenta
highlight Visual       guibg=Black guifg=LightGreen gui=reverse
highlight Visual       ctermbg=Black ctermfg=LightGreen cterm=reverse

" Specials
highlight Todo         guifg=DarkRed guibg=Green gui=bold
highlight Todo         ctermfg=DarkRed ctermbg=Green cterm=bold
highlight Title        guifg=White gui=bold
highlight Title        ctermfg=White cterm=bold

" Syntax
highlight Constant     guifg=DarkGoldenRod
highlight Constant     ctermfg=Brown
highlight Number       guifg=Chocolate
highlight Number       ctermfg=Brown
highlight Statement    guifg=Orange gui=bold
highlight Statement    ctermfg=Yellow cterm=bold
highlight Identifier   ctermfg=Green
highlight Identifier   guifg=LimeGreen
highlight PreProc      guifg=DeepPink gui=bold
highlight PreProc      ctermfg=Magenta cterm=bold
highlight Comment      guifg=BlueViolet gui=italic
highlight Comment      ctermfg=DarkBlue cterm=NONE
highlight Type         guifg=RoyalBlue1 gui=bold
highlight Type         ctermfg=LightBlue cterm=bold
highlight Special      guifg=Coral gui=NONE
highlight Special      ctermfg=Red cterm=NONE
highlight Error        guifg=White guibg=Red
highlight Error        ctermfg=White ctermbg=Red

" Diff
highlight DiffAdd      guifg=fg guibg=Blue gui=NONE
highlight DiffAdd      ctermfg=fg ctermbg=Blue cterm=NONE
highlight DiffChange   guifg=fg guibg=DarkGray gui=NONE
highlight DiffChange   ctermfg=fg ctermbg=DarkGray cterm=NONE
highlight DiffDelete   guibg=bg guibg=NONE gui=NONE
highlight DiffDelete   ctermfg=fg ctermbg=NONE cterm=NONE
highlight DiffText     guifg=fg guibg=Yellow gui=NONE
highlight DiffText     ctermfg=fg ctermbg=Yellow cterm=NONE

" Additional
highlight ColorColumn  guibg=Gray10
highlight ColorColumn  ctermbg=DarkGray
highlight LineNr       guifg=SlateGray
highlight LineNr       ctermfg=DarkGrey
" Use the same color as for cursor:
highlight CursorLineNr guifg=Yellow gui=bold
highlight CursorLineNr ctermfg=Yellow cterm=bold
highlight CursorLine   guibg=Grey5 gui=NONE
highlight CursorLine   ctermbg=NONE cterm=NONE
highlight CursorColumn guibg=Grey5 gui=NONE
highlight CursorColumn ctermbg=NONE cterm=NONE

" Status line and the ruler
" highlight User1 ctermbg=DarkGray guibg=Gray25
