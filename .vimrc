filetype off

""" プラグイン {{{

if !1 | finish | endif
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" vim-localrc {{{
NeoBundle 'thinca/vim-localrc'  " ローカルなvimrc
" }}}

" unite {{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
" }}}

" vimfiler {{{
NeoBundle 'Shougo/vimfiler'
" }}}

" vimproc {{{
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build': {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \   }
  \ }
" }}}

" vimshell {{{
NeoBundle 'Shougo/vimshell'
" }}}

" neocomplcache {{{
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" }}}

" プラグインの為のライブラリ {{{
NeoBundle 'mattn/webapi-vim'    " HTTPライブラリ
NeoBundle 'tpope/vim-repeat'    " プラグイン機能の繰り返し
" NeoBundle 'vim-scripts/YankRing.vim'  " 複数のテキストデータをコピーして一度に持ち運ぶ
" }}}

" 補完 {{{
NeoBundle 'kana/vim-smartinput' " 対応する括弧やクオートを補完
NeoBundle 'kana/vim-smartchr'   " 入力からの補完
NeoBundle 'tpope/vim-surround'  " 選択範囲を括弧やクオートで囲む
NeoBundle 'tyru/caw.vim'        " コメントアウト
NeoBundle 'ujihisa/neco-look'   " 英単語
" NeoBundle 'tpope/vim-surround'  " 選択範囲を括弧やクオートで囲む
" }}}

" 移動 {{{
NeoBundle 'Lokaltog/vim-easymotion' " EasyMotion
" NeoBundle 'macros/matchit.vim'      " %コマンドによるジャンプ機能拡張
" NeoBundle 'showmarks'               " マークを表示する
" }}}

" テキストオブジェクト {{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-lastpat'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'rhysd/vim-textobj-anyblock'
" }}}

" オペレータ {{{
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-operator-surround'
" }}}

" 変換 {{{
" NeoBundle 'tyru/eskk.vim'       " 日本語入力
NeoBundle 'tpope/vim-abolish'   " 命名規則
" }}}

" 整形 {{{
NeoBundle 'Align'                         " 特定文字ベースの文書整形
NeoBundle 'PreserveNoEOL'                 " EOL設定
NeoBundle 'editorconfig/editorconfig-vim' " エディタ設定共有
" }}}

" help {{{
" NeoBundle 'vim-jp/vimdoc-ja'
" NeoBundle 'thinca/vim-ft-help_fold'
" }}}

" カラーリング {{{
NeoBundle 'morhetz/gruvbox'
" highlight Normal ctermfg=250                " vim-indent-guides の MacOSX iTerm2.app 対策
NeoBundle 'nathanaelkane/vim-indent-guides' " インデント
NeoBundle 'vim-scripts/AnsiEsc.vim'         " ログファイル
" NeoBundle 'bronson/vim-trailing-whitespace' " 行末の半角スペース
" }}}

" シンタックスハイライト {{{
NeoBundle 'othree/html5.vim'                " HTML5
NeoBundle 'digitaltoad/vim-jade'            " Jade
NeoBundle 'cakebaker/scss-syntax.vim'       " Sass
NeoBundle 'wavded/vim-stylus'               " Stylus
" NeoBundle 'KohPoll/vim-less'
NeoBundle 'kchmck/vim-coffee-script'        " CoffeeScript
NeoBundle 'endel/actionscript.vim'          " ActionScript
" }}}

" ステータスライン {{{
NeoBundle 'itchyny/lightline.vim'
" }}}

" Git {{{
NeoBundle 'tpope/vim-fugitive'  " Git
" }}}

" コードチェック {{{
" Syntastic
NeoBundle 'scrooloose/syntastic'
" NeoBundle 'marijnh/tern_for_vim', {
"   \ 'build': {
"   \     'others': 'npm install'
"   \   }
"   \ }
" }}}

" Go
NeoBundle 'google/vim-ft-go'
NeoBundle 'vim-jp/vim-go-extra'
" NeoBundleLazy 'Blackrush/vim-gocode', {
"       \ 'autoload': {
"       \   'filetypes': ['go']
"       \ }
"       \}
" NeoBundle 'dgryski/vim-godef'
" }}}

" APIドキュメントを参照する {{{
NeoBundle 'thinca/vim-ref'
" }}}

" Webサービス連携 {{{
" Gist
NeoBundle 'mattn/gist-vim'
" Qiita
" NeoBundle 'mattn/qiita-vim'
NeoBundle 'minodisk/qiita-vim'
" }}}

" 外部ツール起動 {{{
NeoBundle 'JarrodCTaylor/vim-js2coffee' " coffee2js
NeoBundle 'rizzatti/dash.vim'           " Dash
" }}}

NeoBundle 'autodate.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck


""" }}}
""" オプション {{{

" ファイル {{{
set noswapfile
set nobackup
set hidden
set undodir=~/.vim/undo
set undofile
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
" set guifont=SourceCodePro-Light:h12
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
set spelllang=en,cjk
set spell
" }}}

" クリップボード {{{
set clipboard+=unnamed
" }}}

" Diff {{{
set diffopt+=vertical
" }}}

" その他 {{{
set whichwrap=b,s,h,l,<,>,[,]
set visualbell
set nrformats=                " 10進数でインクリメント
set keywordprg=:help          " Kでヘルプを引く
set helplang=ja,en            " 日本語ヘルプを優先
" }}}

" 文字コード {{{
set encoding=utf-8
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" set fileformats=unix,dos,mac
" }}}

" EOL {{{
" let g:PreserveNoEOL = 1
" }}}

" Go {{{
" フォーマット時にimportを整理
let g:gofmt_command = 'goimports'
" 保存時にフォーマットする
autocmd BufWritePre *.go Fmt
" タブでインデント、プレビュー補完
autocmd BufNewFile,BufRead *.go set noexpandtab completeopt=menu,preview
" }}}

" カラースキーム {{{
syntax enable
set background=dark
if !has("gui_running")
  let g:gruvbox_italic=0
endif
colorscheme gruvbox
highlight LineNr ctermfg=243
highlight CursorLineNr ctermfg=214
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
" function! RTrim()
"   let s:cursor = getpos('.')
"   %s/\s\+$//e
"   call setpos('.', s:cursor)
" endfunction
" " 保存時に実行
" autocmd BufWritePre * call RTrim()
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

" インサートモードでの移動 {{{
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-0> 0
inoremap <C-6> ^
inoremap <C-4> $
" }}}

" ウィンドウのフォーカス移動 {{{
nnoremap ,h <C-w>h
nnoremap ,j <C-w>j
nnoremap ,k <C-w>k
nnoremap ,l <C-w>l
nnoremap ,n <C-w>w    " 次
" }}}

" ウィンドウを移動 {{{
nnoremap ,H <C-w>H
nnoremap ,J <C-w>J
nnoremap ,K <C-w>K
nnoremap ,L <C-w>L
nnoremap ,N <C-w>r    " 回転
" }}}

" ノーマルモードでEnterで改行入力 {{{
noremap <CR> o<ESC>
" }}}

" インデントを下げる {{{
inoremap <S-TAB>  <ESC><<i
" }}}

" 使いづらいキーを使いやすいキーに割り当てる {{{
" http://deris.haten/blog.jp/entry/2013/05/02/192415
nnoremap ; :
nnoremap : ;
" 表示上の行移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" 誤操作すると困るキーを無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" }}}

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

" [VTB:4-7] コマンド履歴のキーマップを置き換える {{{
" コマンド履歴
nnoremap <F5> <Esc>q:
" 検索履歴
nnoremap <F6> <Esc>q/
" デフォルトのキーマップを無効化
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>
" }}}

" [VTB:4-16] 検索結果ハイライトをESCキーの連打でリセットする {{{
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

""" }}}
""" プラグインのオプションとキーマップ {{{

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
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" agでgrep検索
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt=''
endif
" }}}

" vimfiler {{{
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
" キーマップ
" 現在開いているバッファをIDE風に開く
nnoremap <silent> ,f :<C-u>VimFilerBufferDir -split -simple -winwidth=50 -no-quit -toggle<CR>
"現在開いているバッファのディレクトリを開く
" nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
" nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" function! s:git_root_dir()
"   if(system('git rev-parse --is-inside-work-tree') == "true\n")
"     return ':VimFiler -split -simple -winwidth=35 -no-quit ' . system('git rev-parse --show-cdup') . '\<CR>'
"   else
"     return ':VimFilerBufferDir -split -simple -winwidth=35 -no-quit\n'
"   endif
" endfunction
" nnoremap <expr><Space>f <SID>git_root_dir()
" }}}

" neocomplcache {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.go = '\h\w*\.\?'
" キーマップ
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
" let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
let g:neocomplcache_enable_insert_char_pre = 1
" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" }}}

" neosnippet {{{
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" キーマップ
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
" }}}

" liteline.vim {{{
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode',
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
  \ }
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\ue0a2" : ''
endfunction
function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 " ._ : ''
  endif
  return ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction
function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" }}}

" eskk.vim {{{
" " 辞書のパス
" let g:eskk#dictionary = {
" \ 'path': "$HOME/.skk/SKK-JISYO.USER",
" \ 'sorted': 0,
" \ 'encoding': 'utf-8',
" \}
" let g:eskk#large_dictionary = {
" \ 'path': '$HOME/.skk/SKK-JISYO.L',
" \ 'sorted': 1,
" \ 'encoding': 'euc-jp',
" \}
" " キーマップ
" autocmd VimEnter * imap <C-j> <Plug>(eskk:toggle)
" autocmd VimEnter * cmap <C-j> <Plug>(eskk:toggle)
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

" " YankRing.vim {{{
" " 履歴ファイルの保存先
" let g:yankring_history_dir = expand('$HOME')
" let g:yankring_history_file = '.vim_yankring_history'
" " 履歴リストの表示
" let g:yankring_max_history = 10
" let g:yankring_window_height = 13
" " キーマップ
" nnoremap <silent> <C-l> :YRShow<CR>
" " }}}

" indent-guides {{{
" 自動起動
let g:indent_guides_enable_on_vim_startup = 1
" 明かるくする
let g:indent_guides_color_change_percent = 12
" }}}

" syntastic {{{
" let g:syntastic_coffee_checkers = ['coffeelint']
" let g:syntastic_enable_signs = 1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" }}}

" caw.vim {{{
nmap     ,c  <Plug>(caw:i:toggle)
vmap     ,c  <Plug>(caw:i:toggle)
" }}}

" vim-smartchr {{{
" inoremap <expr> = smartchr#loop(' = ', ' == ', ' === ', '=')
" inoremap <expr> | smartchr#loop(' | ', ' || ', '|')
" inoremap <expr> & smartchr#loop(' & ', ' && ', '&')
" inoremap <expr> : smartchr#loop(': ', ':')
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

" showmarks {{{
" let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" }}}

""" }}}

filetype on
