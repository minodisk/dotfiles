filetype off

if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

syntax enable
filetype on
filetype plugin indent on

" ファイル {{{
set hidden

silent !mkdir ~/.vim > /dev/null 2>&1
silent !mkdir ~/.vim/swap > /dev/null 2>&1
silent !mkdir ~/.vim/backup > /dev/null 2>&1
silent !mkdir ~/.vim/undo > /dev/null 2>&1

set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set undofile
" set nofixeol
set autoread
" }}}

" 不可視文字を表示 {{{
set list listchars=tab:▸\ ,trail:.,eol:¬
" }}}

" UI {{{
set title
set number
set laststatus=2
" }}}

" エディタ表示 {{{
set showmatch
set cursorline
" }}}

" インデント {{{
set autoindent
set smarttab
set smartindent
set expandtab shiftwidth=2 tabstop=2
set textwidth=0                       " 勝手に改行しない
" }}}

" 削除
set backspace=indent,eol,start
" }}}

" コマンドライン {{{
set wildmenu
set showcmd
" }}}

" 検索 {{{
set hlsearch
set incsearch
set smartcase
" }}}

" スペルチェック {{{
set spelllang+=cjk
set spell
hi clear SpellBad
hi SpellBad cterm=underline
" }}}

" クリップボード {{{
set clipboard+=unnamed
" }}}

" Diff {{{
set diffopt+=vertical
" }}}

" 文字コード {{{
set encoding=utf-8
" }}}

" EOL {{{
let g:PreserveNoEOL = 1
" }}}

" ファイルタイプ {{{
autocmd BufNewFile,BufRead,BufReadPre *.coffee set filetype=coffee
autocmd BufNewFile,BufRead,BufReadPre *.es6 set filetype=javascript
autocmd BufNewFile,BufRead,BufReadPre *.yaml.* set filetype=yaml
autocmd BufNewFile,BufRead,BufReadPre *.md.* set filetype=markdown
autocmd BufNewFile,BufRead,BufReadPre nginx/*.conf set filetype=nginx
autocmd BufNewFile,BufRead,BufReadPre apache/*.conf set filetype=apache
autocmd BufNewFile,BufRead,BufReadPre *.tmpl set filetype=gotexttmpl

" }}}

" autoformat {{{
let g:formatdef_css = '"stylefmt"'
let g:formatters_css = ['css']
" autocmd BufWrite *.ts,*.tsx :Autoformat
" autocmd BufWrite *.css :Autoformat
" }}}

" その他 {{{
set whichwrap=b,s,h,l,<,>,[,]
set visualbell
set nrformats=                " 10進数でインクリメント
set keywordprg=:help          " Kでヘルプを引く
set helplang=ja,en            " 日本語ヘルプを優先
set noswapfile
" }}}

let g:jscomplete_use = ['dom', 'moz']

" ファイル監視 http://vim-jp.org/vim-users-jp/2011/03/12/Hack-206.html {{{
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END
" }}}

" カラースキーム {{{
set t_Co=256
set background=dark
" autocmd ColorScheme * highlight Normal ctermbg=none
" autocmd ColorScheme * highlight LineNr ctermbg=236 guibg=#32302f
" autocmd ColorScheme * highlight VertSplit ctermbg=none
" autocmd ColorScheme * highlight CursorLine ctermbg=none
" autocmd ColorScheme * highlight CursorLineNr ctermbg=none
" autocmd ColorScheme * highlight IndentGuidesOdd ctermbg=none
" autocmd ColorScheme * highlight IndentGuidesEven ctermbg=none
colorscheme gruvbox
" }}}

" Change cursor shape between insert and normal mode in iTerm2.app {{{
" http://hamberg.no/erlend/posts/2014-03-09-change-vim-cursor-in-iterm.html
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" }}}

" grep検索の実行後にQuickFix Listを表示する {{{
autocmd QuickFixCmdPost *grep* cwindow
" }}}

" 行末スペースの削除 {{{
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" 最後のカーソル位置を復元する {{{
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
" }}}

" クリップボードからの貼り付け時に自動インデントを無効にする {{{
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
" }}}

""" キーマップ {{{

" インデントを下げる {{{
inoremap <S-TAB>  <ESC><<i
" }}}

" 誤操作すると困るキーを無効化 {{{
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" }}}

nnoremap <Tab> :lnext<CR>
nnoremap <S-Tab> :lprev<CR>

" very magic で検索する {{{
nnoremap / /\v
" *で検索した時にカーソルが次候補へ移動しないようにする
nmap * *N
" }}}

" [VTB:4-6] ヤンクした文字列とカーソル位置の単語を置換する {{{
nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" }}}

" [VTB:4-16] 検索結果ハイライトをESCキーの連打でリセットする {{{
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
" }}}

" 言語別インデント設定 {{{
autocmd FileType php setlocal noexpandtab
" }}}
" 拡張子別インデント設定 {{{
autocmd BufNewFile,BufRead *.d.ts setlocal tabstop=4 shiftwidth=4
" }}}

imap <C-Tab> <C-x><C-o>

""" }}}
""" プラグインのオプションとキーマップ {{{

" neomru {{{
" 最近開いたファイルの上限を増やす
let g:neomru#file_mru_limit=10000
" 最近開いたディレクトリの上限を増やす
let g:neomru#directory_mru_limit=10000
" }}}

" unite {{{
" 入力モードで開始する
let g:unite_enable_start_insert=1
" 大文字小文字を区別しない
let g:unite_enable_smart_case=1
" yank履歴
let g:unite_source_history_yank_enable=1
" キーマップ
nnoremap [unite]  <Nop>
nmap     ,u       [unite]
" ファイル処理
nnoremap <silent> [unite]f :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file file/new<CR>
" grep検索
nnoremap <silent> [unite]g :<C-u>Unite grep -buffer-name=search-buffer<CR>
" yank履歴
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" アウトライン
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
" 再表示
nnoremap <silent> [unite]r :<C-u>UniteResume<CR>
" grep検索結果再表示
nnoremap <silent> [unite]rg :<C-u>UniteResume search-buffer<CR>
" ウィンドウを分割して開く
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
autocmd FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
autocmd FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" agでgrep検索
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt=''
endif
" }}}

" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
" キーマップ
nnoremap <silent> ,f :<C-u>VimFilerBufferDir -split -simple -winwidth=40 -no-quit -toggle<CR>
autocmd FileType vimfiler nunmap <buffer> <C-l>
" autocmd FileType vimfiler nmap <C-l> <C-w>l
autocmd FileType vimfiler nmap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
" }}}


"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
" Shell like behavior(not recommended).
" set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'
" let g:neocomplete#omni_patterns.go = '\h\w*\.\?'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" neosnippet {{{
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>" "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory = '~/.vimsnippets'
" }}}

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

" indent-guides {{{
" 自動起動
let g:indent_guides_enable_on_vim_startup = 1
" }}}
" let g:indentLine_color_term = 243
" let g:indentLine_char = '┆'

" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map={
      \   'mode': 'active'
      \ }
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_go_checkers = ['go']
" let g:syntastic_css_stylelint_exec = 'stylelint-config-standard'
autocmd bufwritepost *.js silent !standard-format -w %
set autoread
" }}}

" caw.vim {{{
nmap ,/ <Plug>(caw:hatpos:toggle)
vmap ,/ <Plug>(caw:hatpos:toggle)
" }}}

" vim-smartchr {{{
inoremap <expr> , smartchr#loop(', ', ',')
" }}}

" EasyMotion {{{
" デフォルトのキーマップを設定しない
let g:EasyMotion_do_mapping = 0
" キーワード検索で小文字で入力しても大文字にマッチする
let g:EasyMotion_smartcase = 1
" JKMotion 時に同カラムで移動する
let g:EasyMotion_startofline = 0
" ジャンプ先を大文字で表示し、小文字の入力でもジャンプする
let g:EasyMotion_keys = 'JKHFLDYSUAIROEPWBQNCMXTZGV'
let g:EasyMotion_use_upper = 1
" Enter/Space 入力で最初のマッチにジャンプ
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" キーマップ
" 2-key Find Motion
map <Space><Space> <Plug>(easymotion-s2)
" Line Motion
map <Space>j <Plug>(easymotion-bd-jk)
map <Space>k <Plug>(easymotion-bd-jk)
" map l <Plug>(easymotion-bd-jk)
" Search Motion
" set nohlsearch
map  <Space>/ <Plug>(easymotion-sn)
omap <Space>/ <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" }}}

" tsuquyomi
autocmd FileType typescript nmap ,n <Plug>(TsuquyomiRenameSymbolC)
autocmd FileType typescript nmap ,d <Plug>(TsuquyomiDefinition)
autocmd FileType typescript nmap ,b <Plug>(TsuquyomiGoBack)
autocmd FileType typescript nmap ,r <Plug>(TsuquyomiReference)
" autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript setlocal completeopt+=longest
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
let g:tsuquyomi_disable_quickfix = 1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" let g:go_metalinter_command = "gometalinter --linter='vet:go tool vet -composite=false -printfuncs=Infof,Debugf,Warningf,Errorf {pathes}:PATH:LINE:MESSAGE'"
autocmd FileType go nmap ,r <Plug>(go-run)
autocmd FileType go nmap ,b <Plug>(go-build)
autocmd FileType go nmap ,t <Plug>(go-test)
autocmd FileType go nmap ,v <Plug>(go-coverage)
" autocmd FileType go :highlight goErr gui=underline guifg=#8ec07c "83a598
" autocmd FileType go :match goErr /\<err\>/
" }}}

" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts=2
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
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
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '|', 'right': '|' }
  \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '🔒' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
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

call system('type ibus')
if v:shell_error == 0
  inoremap <silent> <Esc> <Esc>:<C-u>call system('ibus engine "xkb:us::eng"')<CR>
endif
