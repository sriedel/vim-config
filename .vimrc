call pathogen#infect()
call pathogen#helptags()

set showmatch "show matching parens
set ts=8 sw=2 sts=2 expandtab "tabbing options
set listchars=tab:▸\ ,eol:¬ "make nonprintable charactars visible
set showbreak=… "make line wraps visible
set ai "auto indent
set ar "auto reload changed files
set nocompatible "enable vim specific extensions
set foldcolumn=4 "show folds in the first 4 columns 

" cut down on fs io
set dir=/dev/shm " where to put swap files
set updatetime=0 " how often to update swap files
set updatecount=0 "how many versions of the swapfile to keep

" make gvim bearable
set gcr=a:blinkwait0 " disable cursor blinking
set gfn=Terminus\ 6  " Set Font for gvim
set guioptions-=T " Disable the toolbar and menu in GUI mode
set guioptions-=m " Disable the toolbar and menu in GUI mode
set shortmess=atI

" printer setup
set printoptions=paper:A4 "Set :hardcopy page size to A4

" grep
set grepprg=ack-grep\ -a\ --nocolor\ --with-filename\ --noheading\ --nobreak

" syntax highlighting
syntax on
colorscheme vividchalk
highlight NonText guifg=#ff0000
highlight RedundantSpaces guibg=#00ffff ctermfg=214 ctermbg=160 cterm=bold
match RedundantSpaces / \+\ze\t/

"filetype specific stuff
filetype on        "Enable Filetype plugins
filetype plugin on
autocmd FileType js setlocal foldmethod=syntax " allow syntax folding for js

" mappings and abbreviations
cabbr <expr> %% expand('%:p:h')
vmap <special> <F5> :Tab /=<CR>
vmap <special> <F6> :Tab /[A-Za-z0-9]+:<CR>
vmap <special> <F8> :Tab /=><CR>
imap #sr (sr<Space><C-R>=strftime("%Y-%m-%d")<Space><CR>)

" Plugin specifics
" Ruby
let ruby_operators=1
" SQL
let lite_sql_query=1
" Syntastic
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'js'],
                           \ 'passive_filetypes': [] }
