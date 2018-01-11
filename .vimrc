filetype off

if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/vim/plugged')
Plug 'Shougo/dein.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'cohama/lexima.vim'
Plug 'kana/vim-smartchr'
Plug 'tyru/caw.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'osyo-manga/vim-textobj-from_regexp'
Plug 'thinca/vim-textobj-between'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'lucapette/vim-textobj-underscore'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
Plug 'vim-scripts/Align'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/PreserveNoEOL'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'kana/vim-submode'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'for': ['go', 'gohtmltmpl', 'gotexttmpl'] }
" Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'othree/yajs.vim', { 'for': ['javascript'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript'] }
Plug 'Quramy/tsuquyomi', { 'for': ['typescript'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript'] }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
Plug 'ekalinin/Dockerfile.vim'
Plug 'markcornick/vim-terraform', { 'for': ['terraform'] }
Plug 'vim-scripts/nginx.vim', { 'for': ['nginx'] }
Plug 'cespare/vim-toml', { 'for': ['toml'] }
Plug 'vim-scripts/AnsiEsc.vim', { 'for': ['log'] }
Plug 'othree/html5.vim', { 'for': ['html'] }
Plug 'tmhedberg/matchit'
Plug 'hail2u/vim-css3-syntax', { 'for': ['css'] }
" Plug 'flowtype/vim-flow', { 'for': ['javascript'] }
Plug 'wokalski/autocomplete-flow', { 'for': ['javascript'] }
Plug 'haya14busa/vim-gtrans', {
  \ 'do': 'go get github.com/haya14busa/gtrans' }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }

Plug 'christoomey/vim-tmux-navigator'
call plug#end()

let g:plug_timeout = 180

syntax enable
filetype on
filetype plugin indent on

let s:vim_dir = expand('~/.config/vim')
let s:swap_dir   = s:vim_dir . '/swap'
let s:backup_dir = s:vim_dir . '/backup'
let s:undo_dir   = s:vim_dir . '/undo'
execute 'silent !mkdir ' . s:swap_dir   . ' > /dev/null 2>&1'
execute 'silent !mkdir ' . s:backup_dir . ' > /dev/null 2>&1'
execute 'silent !mkdir ' . s:undo_dir   . ' > /dev/null 2>&1'
execute 'set directory=' . s:swap_dir
execute 'set backupdir=' . s:backup_dir
execute 'set undodir=' . s:undo_dir

set hidden
set undofile
" set nofixeol
set autoread
set list listchars=tab:▸\ ,nbsp:.,trail:.,eol:¬
set title
set number
set laststatus=2
set showmatch
" set cursorline
set autoindent
set smarttab
set smartindent
set expandtab shiftwidth=2 tabstop=2
set textwidth=0
set backspace=indent,eol,start
set wildmenu
set showcmd
set hlsearch
set incsearch
set smartcase
set spelllang+=cjk
set spell
set clipboard=unnamed,unnamedplus
set diffopt+=vertical
set encoding=utf-8
set whichwrap=b,s,h,l,<,>,[,]
set visualbell
set nrformats=
set keywordprg=:help
set helplang=ja,en
set noswapfile
set background=dark
set completeopt=menuone
set noerrorbells visualbell t_vb=
set t_Co=256

scriptencoding utf-8

colorscheme gruvbox

augroup file_type
  autocmd!
  autocmd BufNewFile,BufRead,BufReadPre *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead,BufReadPre *.yaml.* set filetype=yaml
  autocmd BufNewFile,BufRead,BufReadPre *.md.* set filetype=markdown
  autocmd BufNewFile,BufRead,BufReadPre *.conf set filetype=nginx
  autocmd BufNewFile,BufRead,BufReadPre apache/*.conf set filetype=apache
  autocmd BufNewFile,BufRead,BufReadPre *.tmpl set filetype=gotexttmpl
augroup END

augroup indent_setting
  autocmd!
  autocmd FileType php setlocal noexpandtab
  autocmd FileType html setlocal expandtab
  autocmd BufNewFile,BufRead *.d.ts setlocal tabstop=4 shiftwidth=4
  autocmd FileType python setlocal tabstop=2 shiftwidth=2
augroup END

" Show QuickFix list after grep
augroup quick_fix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END
" Delete spaces at the end of line
augroup delete_spaces
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END
augroup prettier
  autocmd!
  let g:prettier#autoformat = 0
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
augroup END

" Move window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-l> <C-\><C-n><C-w>l

" Terminal mode
tnoremap <silent> <Esc><Esc> <C-\><C-n>
tnoremap <silent> <C-[> <C-\><C-n>
augroup term_mode
  autocmd!
"   autocmd TermOpen * setlocal scrollback=10000
"   autocmd TermOpen * setlocal nonumber
"   autocmd TermOpen * startinsert
  autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
  " autocmd FileType terminal setlocal nonumber nospell list listchars=
augroup END
function! OpenTerm()
  bo vertical split Terminal
  vertical resize 80
  set wfw
  call term_start("zsh", {"curwin": 1})
  setlocal filetype=terminal
  " setlocal nonumber
  " setlocal nospell
  " setlocal list listchars=
endfunction
nnoremap ,,t :<C-u>call OpenTerm()<CR>

" Python3
" let g:python3_host_prog = '/usr/bin/python3'

" vim-javascript
let g:javascript_plugin_flow = 1

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = "cargo fmt --"

" PreserveNoEOL
let g:PreserveNoEOL = 1

" autodate
let g:autodate_format="%Y/%m/%d %H:%M:%S"

" autoformat
let g:formatdef_css = '"stylefmt"'
let g:formatters_css = ['css']

" Watch file
" http://vim-jp.org/vim-users-jp/2011/03/12/Hack-206.html
augroup check_time
  autocmd!
  autocmd WinEnter * checktime
augroup END

" Restore cursor position
function! s:restore_cursor()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup restore_cursor
  autocmd!
  autocmd BufWinEnter * call s:restore_cursor()
augroup END

" Disable auto indent in pasting
" http://ttssh2.sourceforge.jp/manual/ja/usage/tips/vim.html
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"
  function! XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction
  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

" Indent
inoremap <S-TAB> <ESC><<i
" Prevent misoperation
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" Tab
nnoremap <Tab> :lnext<CR>
nnoremap <S-Tab> :lprev<CR>
" Search with very magic
" nnoremap / /\v
" Don't move cursor when *
nmap * *N
" Replace focused word to yanked text
nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" Reset highlight of searching result
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
imap <C-Tab> <C-x><C-o>
" Jump cursor to next/prev location list
nmap <silent> <C-n> :lne<CR>
nmap <silent> <C-N> :lp<CR>

""" denite.nvim
nmap ,, [denite]
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
nnoremap <silent> [denite]g :<C-u>Denite -auto_preview grep<CR>
nnoremap <silent> [denite]l :<C-u>Denite line<CR>
nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
" neomru
let g:neomru#file_mru_limit=10000
let g:neomru#directory_mru_limit=10000

""" deoplete.nvim
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_debug = 1
" let g:deoplete#enable_profile = 1
let g:deoplete#input_patterns = {}
" let g:deoplete#input_patterns.typescript = '\w*'
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.go = '[^. *\t]\.\w*'
" let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'
let g:deoplete#omni_patterns.typescript = '[^. *\t]\.\w*'
" let g:deoplete#omni_patterns.typescript = '\w\+'
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
" let g:deoplete#sources#tss#javascript_support = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

""" neosnippet
let g:neosnippet#enable_completed_snippet = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

""" prettier
" set all options as default: http://json.schemastore.org/prettierrc
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'none'
" let g:prettier#config#parser = 'flow'
" cli-override|file-override|prefer-file
" let g:prettier#config#config_precedence = 'prefer-file'
" always|never|preserve
" let g:prettier#config#prose_wrap = 'preserve'

" tsuquyomi
let g:tsuquyomi_disable_quickfix = 1

" vim-operator-surround {{{
nmap <silent>sa <Plug>(operator-surround-append)
nmap <silent>sd <Plug>(operator-surround-delete)
nmap <silent>sr <Plug>(operator-surround-replace)
" with vim-textobj-multiblock
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
" with vim-textobj-anyblock
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
" with vim-textobj-between
nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)
" }}}

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['terminal']

" ale {{{
let g:ale_echo_msg_format = '%linter% %severity%: %s'
let g:ale_linters = {
\ 'css': ['stylelint'],
\ 'javascript': ['flow'],
\ 'typescript': ['tsserver', 'tslint', 'typecheck'],
\ 'go': ['gofmt -e', 'go vet', 'golint', 'gometalinter', 'go build', 'gosimple', 'staticcheck'],
\}
nmap <silent> <C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-N> <Plug>(ale_next_wrap)
augroup ale
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END
function! ALEErrors()
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return printf(
  \   '%d',
  \   all_errors
  \)
endfunction
function! ALEWarnings()
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return printf(
  \   '%d',
  \   all_non_errors
  \)
endfunction
" }}}

" caw.vim
nmap ,/ <Plug>(caw:hatpos:toggle)
vmap ,/ <Plug>(caw:hatpos:toggle)

" vim-smartchr
inoremap <expr> , smartchr#loop(', ', ',')

" nvim-typescript {{{
augroup typescript_shorthands
  autocmd!
  autocmd FileType typescript nmap <buffer> ,d :TSDefPreview<CR>
  autocmd FileType typescript nmap <buffer> ,n :TSRename<CR>
  autocmd FileType typescript nmap <buffer> ,r :TSRefs<CR>
  autocmd FileType typescript nmap <buffer> ,t :TSType<CR>
augroup END
" }}}

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
augroup vimgo
  autocmd!
  autocmd FileType go nmap ,b :<Plug>(go-build)<CR>
  autocmd FileType go nmap ,d :<Plug>(go-def)<CR>
  autocmd FileType go nmap ,n :<Plug>(go-rename)<CR>
  autocmd FileType go nmap ,r :<Plug>(go-run)<CR>
  autocmd FileType go nmap ,t :<Plug>(go-test)<CR>
  autocmd FileType go nmap ,v :<Plug>(go-coverage)<CR>
augroup END

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'fugitive', 'filename', 'modified' ],
  \   ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ],
  \     [ 'warning', 'error' ],
  \   ],
  \ },
  \ 'component_function': {
  \   'modified': 'LightLineModified',
  \   'readonly': 'LightLineReadonly',
  \   'fugitive': 'LightLineFugitive',
  \   'filename': 'LightLineFilename',
  \   'fileformat': 'LightLineFileformat',
  \   'filetype': 'LightLineFiletype',
  \   'fileencoding': 'LightLineFileencoding',
  \   'mode': 'LightLineMode',
  \ },
  \ 'component_type': {
  \   'error': 'error',
  \   'warning': 'warning',
  \ },
  \ 'component_expand': {
  \   'error': 'ALEErrors',
  \   'warning': 'ALEWarnings',
  \ },
  \ }
  " \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  " \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '🔒' : ''
endfunction
function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⎇  '.branch : ''
  endif
  return ''
endfunction
function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! s:inactive_input_method()
  call system('fcitx-remote -c')
endfunction
augroup inactive_input_method
  autocmd!
  autocmd InsertLeave * call s:inactive_input_method()
augroup END
