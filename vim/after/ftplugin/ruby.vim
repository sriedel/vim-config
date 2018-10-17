setlocal balloonexpr=
" set up the ale linter
let b:ale_linters = { 'ruby': [ 'ruby', 'rubocop' ] }
syn match rubyLonelyOperator "&\."
highlight rubyLonelyOperator ctermfg=Magenta
