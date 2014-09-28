filetype off

"---------------------------------------------------------------------------
" プラグイン

if !1 | finish | endif
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

""" unite {
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

""" vimfiler
NeoBundle 'Shougo/vimfiler'

""" vimproc
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build': {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \   }
  \ }

""" vimshell
NeoBundle 'Shougo/vimshell'

""" neocomplcache
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

""" 補完
NeoBundle 'kana/vim-smartinput' " 対応する括弧やクオートを補完
NeoBundle 'kana/vim-smartchr'   " 入力からの補完
NeoBundle 'tpope/vim-surround'  " 選択範囲を括弧やクオートで囲む
NeoBundle 'tyru/caw.vim'        " コメントアウト
NeoBundle 'ujihisa/neco-look'   " 英単語

""" 変換
NeoBundle 'tpope/vim-abolish'   " 命名規則

""" カラーリング
" インデント
NeoBundle 'nathanaelkane/vim-indent-guides'
" ログファイル
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペース
" NeoBundle 'bronson/vim-trailing-whitespace'

""" シンタックスハイライト
" Jade
NeoBundle 'digitaltoad/vim-jade'
" Sass
NeoBundle 'cakebaker/scss-syntax.vim'
" Stylus
NeoBundle 'wavded/vim-stylus'
" LESS
" NeoBundle 'KohPoll/vim-less'
" CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'

""" ステータスライン
NeoBundle 'itchyny/lightline.vim'

""" その他
" Git
NeoBundle 'tpope/vim-fugitive'
" Gist
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

""" コードチェック
" Syntastic
NeoBundle 'scrooloose/syntastic'
" tern {
" NeoBundle 'marijnh/tern_for_vim', {
"   \ 'build': {
"   \     'others': 'npm install'
"   \   }
"   \ }
" }
" 言語サポート
" coffee2js
NeoBundle 'JarrodCTaylor/vim-js2coffee'

""" 外部ツール起動
" Dash
NeoBundle 'rizzatti/dash.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"---------------------------------------------------------------------------
" オプション

""" ファイル
set noswapfile
set hidden

""" 不可視文字を表示
set list listchars=tab:▸\ ,trail:.,eol:¬

""" UI
set title
set number
set laststatus=2

""" エディタ表示
set guifont=SourceCodePro-Light:h12
set showmatch
set cursorline

""" インデント
set expandtab
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set smarttab

""" コマンドライン
set wildmenu
set showcmd

""" 検索
set hlsearch
set incsearch
set smartcase

""" その他
set whichwrap=b,s,h,l,<,>,[,]
set visualbell
set nrformats=                " 10進数でインクリメント

" シンタックスハイライトする
syntax on

""" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

""" 行末スペースの削除
function! RTrim()
  let s:cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', s:cursor)
endfunction
" 保存時に実行
autocmd BufWritePre * call RTrim()

""" 最後のカーソル位置を復元する
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

""" プロジェクトローカルな設定を使う
" http://vim-users.jp/2009/12/hack112/
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
  autocmd BufReadPre .vimprojects set ft=vim
augroup END
function! s:vimrc_local(loc)
  let files = findfile('.vimprojects', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

""" 全角スペースを赤くハイライトする
augroup highlightIdegraphicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=167 guibg=#cc6666
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

""" カラースキーム
" let g:hybrid_use_Xresources = 1
" let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
highlight LineNr ctermfg=243 ctermbg=236 guifg=#707880 guibg=#303030
highlight CursorLineNr ctermfg=221 ctermbg=221 guibg=#303030

"---------------------------------------------------------------------------
" プラグイン設定

""" unite
" 入力モードで開始する
let g:unite_enable_start_insert=1

""" vimfiler
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

""" neocomplcache
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

""" neosnippet
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

""" vim-indent-guides自動起動
let g:indent_guides_enable_on_vim_startup = 1

""" syntastic
let g:syntastic_coffee_checkers = ['coffeelint']

"" liteline.vim
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
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
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  \ }
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
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
    return strlen(_) ? '⭠ '._ : ''
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

"---------------------------------------------------------------------------
" キーマップ

""" unite
" 全部入りで開く
nnoremap <silent> <Space>u :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file file/new<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

""" vimfiler
" 現在開いているバッファをIDE風に開く
nnoremap <silent> <Space>f :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
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

""" neocomplcache
" Plugin key-mappings.
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
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1
" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" neosnippet
" Plugin key-mappings.
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

" caw.vim
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" vim-smartchr
inoremap <expr> = smartchr#loop(' = ', ' == ', ' === ', '=')
" inoremap <expr> | smartchr#loop(' | ', ' || ', '|')
" inoremap <expr> & smartchr#loop(' & ', ' && ', '&')
" inoremap <expr> + smartchr#loop(' + ', '+')
" inoremap <expr> - smartchr#loop(' - ', '-')
" inoremap <expr> * smartchr#loop(' * ', '*')
" inoremap <expr> / smartchr#loop(' / ', '/')
inoremap <expr> : smartchr#loop(': ', ':')
inoremap <expr> , smartchr#loop(', ', ',')

" http://deris.hatenablog.jp/entry/2013/05/02/192415
" 使いづらいキーを使いやすいキーに割り当てる
nnoremap ; :
nnoremap : ;
" 表示上の行移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" 誤操作すると困るキーを無効化する
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" 検索でvery magicを使う
" http://deris.hatenablog.jp/entry/2013/05/15/024932
nnoremap / /\v

" ウィンドウ移動
nnoremap <Space>h <C-w>h
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
nnoremap <Space>w <C-w>w
nnoremap <Space>H <C-w>H
nnoremap <Space>J <C-w>J
nnoremap <Space>K <C-w>K
nnoremap <Space>L <C-w>L
nnoremap <Space>r <C-w>r

" ノーマルモードでEnterで改行入力
noremap <CR> o<ESC>

" インサートモードでShift-Tabでインデントを下げる
inoremap <S-TAB> <ESC><<i


"---------------------------------------------------------------------------

filetype on
