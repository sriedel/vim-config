runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set showmatch "show matching parens
set ts=8 sw=2 sts=2 expandtab "tabbing options
set listchars=tab:▸\ ,eol:¬ "make nonprintable charactars visible
set showbreak=… "make line wraps visible
set ai "auto indent
set ar "auto reload changed files
set nocompatible "enable vim specific extensions
" set foldcolumn=4 "show folds in the first 4 columns 
set colorcolumn=80
highlight ColorColumn guibg=#444444 guifg=NONE

set tags+=gems.tags

" cut down on fs io
set dir=/dev/shm " where to put swap files
set updatetime=0 " how often to update swap files
set updatecount=0 "how many versions of the swapfile to keep

set shortmess=atI

" printer setup
set printoptions=paper:A4 "Set :hardcopy page size to A4

" grep
set grepprg=ack-grep\ -a\ --nocolor\ --with-filename\ --noheading\ --nobreak

set exrc
set secure

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
vmap <special> <F2> :TagbarToggle<CR>
vmap <special> <F5> :Tab /=<CR>
vmap <special> <F6> :Tab /[A-Za-z0-9]+:<CR>
vmap <special> <F8> :Tab /=><CR>
cmap <special> <F11> :DiffReview git diff --minimal --ignore-all-space master..<CR>
imap #sr (sr<Space><C-R>=strftime("%Y-%m-%d")<Space><CR>)
nmap <F2> :TagbarToggle<CR>

" Plugin specifics
" Ruby
let ruby_operators=1
let g:ruby_indent_block_style='do'
" SQL
let lite_sql_query=1
" Syntastic
" set statusline+=%{SyntasticStatuslineFlag()}
" let g:syntastic_mode_map = { 'mode': 'active',
"                            \ 'active_filetypes': ['ruby', 'js', 'yml', 'yaml'],
"                            \ 'passive_filetypes': [] }
"
" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_ruby_enabled_makers = [ 'mri' ]

" Gutentags
let g:gutentags_cache_dir = '~/.tags_cache'

" fold text between context and specify
function! ShowRSpecContext()
  let spec_idx = search('\(it\|specify\)\s\+".\+"', 'Wbn', '^')
  let ctx_idx  = search('\(describe\|context\)\s\+".\+"', 'Wbn', '^')
  if spec_idx && ctx_idx
    exec (ctx_idx+1).','.(spec_idx-1).'fold'
  endif
endfunction
 
" fold text between all contexts and specify lines
function! ShowRSpecAnnotation()
  call cursor('$', 0)
  try
    foldo!
    catch
  endtry
  let cur_line = line('$')
  while cur_line > 0
    let prev_spec = search('\(context\|specify\|describe\|it\)\s\+".\+"', 'Wb', '^')
    if ! prev_spec
      break
    endif
    exec (prev_spec).','.cur_line.'fold'
    let cur_line=prev_spec-1
  endwhile
endfunction
command! Sx :call ShowRSpecContext()
command! Sa :call ShowRSpecAnnotation()

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
