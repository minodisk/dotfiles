set background=dark

set guifont=Ricty\ Regular:h14
set linespace=1

" set ambiwidth=single
set guioptions-=rlT
set guioptions=ac
" set guioptions-=m

" MacVimでIMEが勝手に切り替わってしまう問題に対応する
set imdisable
" if exists('&imdisableactivate')
"   set noimdisableactivate
" endif
" Insert mode: lmap off, IME ON
set iminsert=2
" Serch mode: lmap off, IME ON
set imsearch=2
" Normal mode: IME off
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

autocmd VimEnter,ColorScheme * highlight Normal           guibg='#1d2021'
autocmd VimEnter,ColorScheme * highlight LineNr           guibg='#282828'
autocmd VimEnter,Colorscheme * highlight IndentGuidesOdd  guibg='#32302f'
autocmd VimEnter,Colorscheme * highlight IndentGuidesEven guibg='#282828'
autocmd VimEnter,Colorscheme * highlight CursorLine       guibg='#3c3836'
autocmd VimEnter,Colorscheme * highlight CursorLineNr     guibg='#3c3836'

" let g:syntastic_enable_signs = 1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_style_warning_symbol = '⚠'

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" nnoremap <C-H> <Nop>
" nnoremap <C-J> <Nop>
" nnoremap <C-K> <Nop>
" nnoremap <C-L> <Nop>

" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = '⎇'
" " let g:airline_symbols.readonly = '🔒'
" let g:airline_symbols.linenr = ''

" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = '☰'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'
