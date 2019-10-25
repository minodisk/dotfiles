filetype off

if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'osyo-manga/vim-textobj-from_regexp'
Plug 'thinca/vim-textobj-between'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'lucapette/vim-textobj-underscore'

" Operators
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'

" Cursor Supports
Plug 'Lokaltog/vim-easymotion'
Plug 'tmhedberg/matchit'

" Input Supports
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-go', {'do': 'make' }
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
Plug 'cohama/lexima.vim'
Plug 'kana/vim-smartchr'
Plug 'tyru/caw.vim'

" Replace Supports
Plug 'tpope/vim-abolish'
Plug 'kana/vim-submode'

" Visual
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'

" File Operations
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'

" Lint / Warn / Error
Plug 'w0rp/ale'

" Language Client
" Plug 'autozimu/LanguageClient-neovim', {
"  \ 'branch': 'next',
"  \ 'do': 'bash install.sh',
"  \ }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp', {
      \ 'do': 'go get golang.org/x/tools/cmd/gopls'
      \ }

" Completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/asyncomplete-neosnippet.vim'

" Languages
Plug 'fatih/vim-go', {
      \ 'for': ['go', 'gohtmltmpl', 'gotexttmpl'],
      \ }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }

Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'othree/yajs.vim', { 'for': ['javascript'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript'] }

" Plug 'heavenshell/vim-flood'
" Plug 'flowtype/vim-flow', { 'for': ['javascript'] }
" Plug 'wokalski/autocomplete-flow', { 'for': ['javascript'] }
Plug 'minodisk/autocomplete-flow', { 'for': ['javascript'] }
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {
"    \ 'do': './install.sh'
"    \ }
Plug 'ryanolsonx/vim-lsp-typescript', { 'for': ['typescript', 'typescript.tsx'] }
" Plug 'godlygeek/tabular', { 'for': ['markdown'] }
" Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
Plug 'markcornick/vim-terraform', { 'for': ['terraform'] }
Plug 'vim-scripts/nginx.vim', { 'for': ['nginx'] }
Plug 'cespare/vim-toml', { 'for': ['toml'] }
Plug 'vim-scripts/AnsiEsc.vim', { 'for': ['log'] }
Plug 'othree/html5.vim', { 'for': ['html'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css'] }
Plug 'digitaltoad/vim-pug'
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
Plug 'clojure-vim/async-clj-omni', { 'for': ['clojure'] }
Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }
" Plug 'villainy/deoplete-dart', { 'for': ['dart'] }
Plug 'thosakwe/vim-flutter'

" Formatters
Plug 'vim-scripts/Align'
Plug 'vim-scripts/PreserveNoEOL'
Plug 'prettier/vim-prettier', {
     \ 'do': 'npm i -g prettier',
     \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown']
     \ }

" External Tools
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fireplace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'haya14busa/vim-gtrans', {
      \ 'do': 'go get github.com/haya14busa/gtrans'
      \ }

call plug#end()

let g:plug_timeout = 180

syntax enable
filetype on
filetype plugin indent on

let s:vim_dir = expand('~/.config/nvim')
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
" set spelllang+=cjk
" set spell
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

highlight Normal ctermbg=none
highlight NonText ctermbg=none

augroup file_type
  autocmd!
  autocmd BufNewFile,BufRead,BufReadPre *.js.flow set filetype=javascript
  autocmd BufNewFile,BufRead,BufReadPre *.tsx setlocal filetype=typescript.tsx
  autocmd BufNewFile,BufRead,BufReadPre *.coffee set filetype=coffee
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

augroup quick_fix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

augroup delete_spaces
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END

augroup prettier
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.js.flow,*.ts,*.tsx,*.css,*.module.css,*.less,*.scss Prettier
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
  autocmd TermOpen * setlocal scrollback=10000
  autocmd TermOpen * setlocal nonumber
  autocmd TermOpen * startinsert
  " autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
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

" Language Client
" let g:LanguageClient_serverCommands = {
" \ 'dart': ['dart_language_server'],
" \ }
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Language Server
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif
if executable('dart_language_server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'dart_language_server',
        \ 'cmd': {server_info->['dart_language_server']},
        \ 'whitelist': ['dart'],
        \ })
endif
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

" acyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = "cargo fmt --"

" markdown
" let g:vim_markdown_folding_disabled = 1

" PreserveNoEOL
let g:PreserveNoEOL = 1

" autodate
let g:autodate_format="%Y/%m/%d %H:%M:%S"

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
omap <silent> <C-n> :lne<CR>
nmap <silent> <C-N> :lp<CR>

""" denite.nvim
call denite#custom#source('file/rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
     \ [ '*~', '*.o', '*.exe', '*.bak',
     \ '.DS_Store', '*.pyc', '*.sw[po]', '*.class',
     \ '.hg/', '.git/', '.bzr/', '.svn/',
     \ 'node_modules/', 'bower_components/', 'tmp/', 'log/', 'vendor/ruby',
     \ '.idea/', 'dist/',
     \ 'tags', 'tags-*'])
nmap ,, [denite]
nnoremap <silent> [denite]f :<C-u>Denite file/rec<CR>
nnoremap <silent> [denite]g :<C-u>Denite -auto_preview grep<CR>
nnoremap <silent> [denite]l :<C-u>Denite line<CR>
nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

" neomru
let g:neomru#file_mru_limit=10000
let g:neomru#directory_mru_limit=10000

""" deoplete.nvim
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#dart#dart_sdk_path = "/Users/minodisk/Library/dart-sdk"
" inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ deoplete#manual_complete()
" function! s:check_back_space() abort "{{{
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}

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

""" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
      \   'ctermfgs': [167, 142, 214, 109, 175, 108, 208],
      \   'operators': '_,_',
      \   'parentheses': [
      \     'start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold',
      \   ],
      \   'separately': {
      \     '*': {},
      \     'tex': {
      \       'parentheses': [
      \         'start=/(/ end=/)/', 'start=/\[/ end=/\]/',
      \       ],
      \     },
      \    'lisp': {
      \      'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \     },
      \     'vim': {
      \       'parentheses': [
      \         'start=/(/ end=/)/', 'start=/\[/ end=/\]/',
      \         'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody',
      \         'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody',
      \       ],
      \     },
      \     'html': {
      \       'parentheses': [
      \         'start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold',
      \       ],
      \     },
      \     'javascript': {
      \       'parentheses': [
      \         'start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold',
      \         'start=/{/ end=/}/ fold',
      \       ],
      \     },
      \     'css': 0,
      \   },
      \ }

""" prettier
" set all options as default: http://json.schemastore.org/prettierrc
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'all'
" let g:prettier#config#parser = 'flow'
" cli-override|file-override|prefer-file
" let g:prettier#config#config_precedence = 'prefer-file'
" always|never|preserve
" let g:prettier#config#prose_wrap = 'preserve'

" tsuquyomi
let g:tsuquyomi_disable_quickfix = 1

" vim-operator-surround
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

" submode
call submode#enter_with('bufmove', 'n', '', '<C-w>l', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<C-w>h', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<C-w>k', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<C-w>j', '<C-w>-')
call submode#map('bufmove', 'n', '', 'l', '<C-w>>')
call submode#map('bufmove', 'n', '', 'h', '<C-w><')
call submode#map('bufmove', 'n', '', 'k', '<C-w>+')
call submode#map('bufmove', 'n', '', 'j', '<C-w>-')

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['terminal']

" caw.vim
nmap ,/ <Plug>(caw:hatpos:toggle)
vmap ,/ <Plug>(caw:hatpos:toggle)

" vim-smartchr
inoremap <expr> , smartchr#loop(', ', ',')

" nvim-typescript
augroup typescript_shorthands
  autocmd!
  autocmd FileType typescript nmap <buffer> ,d :TSDefPreview<CR>
  autocmd FileType typescript nmap <buffer> ,n :TSRename<CR>
  autocmd FileType typescript nmap <buffer> ,r :TSRefs<CR>
  autocmd FileType typescript nmap <buffer> ,t :TSType<CR>
augroup END

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
augroup vimgo
  autocmd!
  autocmd FileType go nmap ,b :<Plug>(go-build)<CR>
  autocmd FileType go nmap ,d :<Plug>(go-def)<CR>
  autocmd FileType go nmap ,n :<Plug>(go-rename)<CR>
  autocmd FileType go nmap ,r :<Plug>(go-run)<CR>
  autocmd FileType go nmap ,t :<Plug>(go-test)<CR>
  autocmd FileType go nmap ,v :<Plug>(go-coverage)<CR>
augroup END

" ale
let g:ale_linters = {
     \ 'css': ['stylelint'],
     \ 'javascript': ['eslint'],
     \ 'typescript': ['eslint'],
     "\ 'go': ['gofmt -e', 'go vet', 'golint', 'gometalinter', 'go build', 'gosimple', 'staticcheck'],
     \ }
" " ⊗
" " ⊘
" " ❎
" " ⦸
" " ⯑
" " �
" " ⚠
" " ⛒
" " ⨂
" " ⮾
" " ⮿
" " 🚫
" " 🛇
" " 🛈
" " ⓘ
" " let g:ale_sign_error = '⨂'
" " let g:ale_sign_warning = '⚠'
" " let g:ale_sign_info = 'ⓘ'
" " let g:ale_sign_style_error = 'SE'
" " let g:ale_sign_style_warning = 'SW'
" " let g:ale_echo_msg_error_str = g:ale_sign_error
" " let g:ale_echo_msg_warning_str = g:ale_sign_warning
" " let g:ale_echo_msg_info_str = g:ale_sign_info
nmap <silent> <C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-N> <Plug>(ale_next_wrap)

" lightline
let s:base03  = ['#1d2021', 234]
let s:base023 = ['#282828', 235]
let s:base02  = ['#32302f', 236]
let s:base01  = ['#3c3836', 237]
let s:base00  = ['#504945', 239]
let s:base0   = ['#665c54', 241]
let s:base1   = ['#7c6f64', 243]
let s:base2   = ['#928374', 245]
let s:base3   = ['#a89984', 246]
let s:red     = ['#fb4934', 167]
let s:green   = ['#b8bb26', 142]
let s:yellow  = ['#fabd2f', 214]
let s:blue    = ['#83a598', 109]
let s:purple  = ['#d3869b', 175]
let s:aqua    = ['#8ec07c', 108]
let s:orange  = ['#fe8019', 208]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.insert.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:purple ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base03 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]
let s:p.normal.info = [ [ s:base023, s:blue ] ]
let s:p.normal.ok = [ [ s:base023, s:green ] ]
let g:lightline#colorscheme#gruvbox#palette = lightline#colorscheme#flatten(s:p)
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'fugitive' ],
  \     [ 'filename' ],
  \   ],
  \   'right': [
  \     [ 'ok', 'info', 'warnings', 'errors' ],
  \     [ 'lineinfo', 'percent' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ],
  \   ],
  \ },
  \ 'inactive': {
  \   'left': [
  \     [ 'fugitive' ],
  \     [ 'filename' ],
  \   ],
  \   'right': [
  \     [ 'lineinfo', 'percent' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ],
  \   ],
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'component': {
  \   'lineinfo': '%3l:%-2v',
  \   'percent': '%3p%%',
  \ },
  \ 'component_function': {
  \   'mode': 'LightlineMode',
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename',
  \   'fileformat': 'LightlineFileformat',
  \   'fileencoding': 'LightlineFileencoding',
  \   'filetype': 'LightlineFiletype',
  \ },
  \ 'component_expand': {
  \   'errors': 'LightlineErrors',
  \   'warnings': 'LightlineWarnings',
  \   'infos': 'LightlineInfos',
  \   'ok': 'LightlineOK',
  \ },
  \ 'component_type': {
  \   'errors': 'error',
  \   'warnings': 'warning',
  \   'ifnos': 'info',
  \   'ok': 'ok',
  \ } }
function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⎇  '.branch : ''
  endif
  return ''
endfunction
function! LightlineFilename()
  return  ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (winwidth(0) > 100 ? '' != expand('%') ? expand('%') : '' : '' != expand('%:t') ? expand('%:t') : '') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '🔒' : ''
endfunction
function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineFileformat()
  return winwidth(0) > 200 ? &fileformat : ''
endfunction
function! LightlineFileencoding()
  return winwidth(0) > 200 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
function! LightlineFiletype()
  return winwidth(0) > 200 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
function! LightlineErrors()
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:c = l:counts.error + l:counts.style_error
  return l:c == 0 ? '' : printf('%s %d', g:ale_sign_error, c)
endfunction
function! LightlineWarnings()
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:c = l:counts.warning + l:counts.style_warning
  return l:c == 0 ? '' : printf('%s %d', g:ale_sign_warning, c)
endfunction
function! LightlineInfos()
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:c = l:counts.info
  return l:c == 0 ? '' : printf('%s %d', g:ale_sign_info, c)
endfunction
function! LightlineOK()
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '✓ ' : ''
endfunction
augroup LightLineOnALE
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

" tmuxline
let g:tmuxline_theme = 'lightline'
let g:tmuxline_preset = {
      \ 'a'    : '#S',
      \ 'win'  : ['#I', '#W'],
      \ 'cwin' : ['#I', '#W', '#F'],
      \ 'x'    : [
      \   '⚡ #{battery_percentage}',
      \ ],
      \ 'y'    : [
      \   '#{wifi_ssid}',
      \ ],
      \ 'z'    : [ '%Y-%m-%d(%a) %H:%M ' ],
      \ 'options' : {'status-justify':'left'} }

" Utils
function! Hankaku()
  :silent! %s/０/0/g
  :silent! %s/１/1/g
  :silent! %s/２/2/g
  :silent! %s/３/3/g
  :silent! %s/４/4/g
  :silent! %s/５/5/g
  :silent! %s/６/6/g
  :silent! %s/７/7/g
  :silent! %s/８/8/g
  :silent! %s/９/9/g
endfunction
command Hankaku :call Hankaku()<CR>

function! CSS2Props()
  :silent! %s/\v([a-z-]+)\s*:\s+([a-zA-Z0-9%#.\(\) -]+);/\1: '\2',/g
  :silent! %s/\v([a-z]+)-([a-z])([a-z]+:)/\1\U\2\e\3/g
  :silent! %s/\v'var\(--color-([a-zA-Z]+)\)'/colors.\1/g
  :silent! %s/\v'(.*)var\(--color-([a-zA-Z]+)\)'/`\1${colors.\2}`/g
endfunction
command CSS2Props :call CSS2Props()<CR>

function! Delete()
  :silent! call delete(expand('%'))
  :silent! q!
endfunction
command Delete :call Delete()<CR>
