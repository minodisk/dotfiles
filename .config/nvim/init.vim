filetype off

if &compatible
  set nocompatible
endif

let s:vim_dir = expand('~/.config/nvim')

let s:dein_dir = s:vim_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml      = s:vim_dir . '/dein.toml'
  let s:lazy_toml = s:vim_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#add('minodisk/nvim-finder')
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

syntax enable
filetype on
filetype plugin indent on

" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
if has('nvim')
  nmap <BS> <C-W>h
endif

" ファイル {{{
set hidden

let s:swap_dir   = s:vim_dir . '/swap'
let s:backup_dir = s:vim_dir . '/backup'
let s:undo_dir   = s:vim_dir . '/undo'
execute 'silent !mkdir ' . s:swap_dir   . ' > /dev/null 2>&1'
execute 'silent !mkdir ' . s:backup_dir . ' > /dev/null 2>&1'
execute 'silent !mkdir ' . s:undo_dir   . ' > /dev/null 2>&1'
execute 'set directory=' . s:swap_dir
execute 'set backupdir=' . s:backup_dir
execute 'set undodir=' . s:undo_dir

set undofile
" set nofixeol
set autoread
" }}}

" 不可視文字を表示 {{{
set list listchars=tab:▸\ ,nbsp:.,trail:.,eol:¬
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
" set clipboard+=unnamed
set clipboard+=unnamedplus
" }}}

" Diff {{{
set diffopt+=vertical
" }}}

" 文字コード {{{
set encoding=utf-8
scriptencoding utf-8
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

" autodate {{{
let g:autodate_format="%Y/%m/%d %H:%M:%S"
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

" autocmd VimEnter,ColorScheme * highlight Normal           ctermbg='#1d2021'
autocmd VimEnter,ColorScheme * highlight Normal           ctermbg=none
autocmd VimEnter,ColorScheme * highlight SignColumn       ctermbg=none
autocmd VimEnter,ColorScheme * highlight LineNr           ctermbg=234
autocmd VimEnter,Colorscheme * highlight CursorLineNr     ctermbg=234
autocmd VimEnter,Colorscheme * highlight IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * highlight IndentGuidesEven ctermbg=237
autocmd VimEnter,Colorscheme * highlight CursorLine       ctermbg=238
autocmd VimEnter,Colorscheme * highlight Cursor           ctermbg=239
colorscheme gruvbox
" }}}

set completeopt=menuone
" set completeopt=menu,preview

" Setup cursor shape
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
elseif empty('$TMUX')
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

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
inoremap <S-TAB> <ESC><<i
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

""" denite.nvim
nmap ,, [denite]
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
nnoremap <silent> [denite]g :<C-u>Denite -auto_preview grep<CR>
nnoremap <silent> [denite]l :<C-u>Denite line<CR>
nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>

""" deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.go = '[^. *\t]\.\w*'
" let g:deoplete#sources#tss#javascript_support = 1
autocmd Filetype typescript :TSStart
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" " neomru {{{
" 最近開いたファイルの上限を増やす
let g:neomru#file_mru_limit=10000
" 最近開いたディレクトリの上限を増やす
let g:neomru#directory_mru_limit=10000
" " }}}

" " vimデフォルトのエクスプローラをvimfilerで置き換える
" " let g:vimfiler_as_default_explorer = 1
" " セーフモードを無効にした状態で起動する
" let g:vimfiler_safe_mode_by_default = 0
" " キーマップ
" nnoremap <silent> ,f :<C-u>VimFilerBufferDir -split -simple -winwidth=30 -no-quit -toggle<CR>
" autocmd FileType vimfiler nunmap <buffer> <C-l>
" autocmd FileType vimfiler nmap <C-l> <C-w>l
" " autocmd FileType vimfiler nmap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)

" nvim-finder
let g:finder_indent=' '
nnoremap <silent> ,f :<C-u>Finder<CR>

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

" syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map={
    \ 'mode': 'active',
  \ }
    " \ 'passive_filetypes': ['go']
let g:go_list_type = "quickfix"

highlight SyntasticErrorSign ctermfg=167
let g:syntastic_error_symbol = "▶"
highlight SyntasticStyleErrorSign ctermfg=214
let g:syntastic_style_error_symbol = "▶"
highlight SyntasticWarningSign ctermfg=88
let g:syntastic_warning_symbol = "▷"
highlight SyntasticStyleWarningSign ctermfg=136
let g:syntastic_style_warning_symbol = "▷"

let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_go_checkers = ['go']
let g:syntastic_javascript_checkers = ['flow']
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_css_stylelint_exec = 'stylelint-config-standard'
autocmd bufwritepost *.js silent !standard-format -w %
set autoread
" }}}

" vim-flow {{{
let g:flow#autoclose = 1
" }}}

" caw.vim {{{
nmap ,/ <Plug>(caw:hatpos:toggle)
vmap ,/ <Plug>(caw:hatpos:toggle)
" }}}

" vim-smartchr {{{
inoremap <expr> , smartchr#loop(', ', ',')
" }}}

" " EasyMotion {{{
" " デフォルトのキーマップを設定しない
" let g:EasyMotion_do_mapping = 0
" " キーワード検索で小文字で入力しても大文字にマッチする
" let g:EasyMotion_smartcase = 1
" " JKMotion 時に同カラムで移動する
" let g:EasyMotion_startofline = 0
" " ジャンプ先を大文字で表示し、小文字の入力でもジャンプする
" let g:EasyMotion_keys = 'JKHFLDYSUAIROEPWBQNCMXTZGV'
" let g:EasyMotion_use_upper = 1
" " Enter/Space 入力で最初のマッチにジャンプ
" let g:EasyMotion_enter_jump_first = 1
" let g:EasyMotion_space_jump_first = 1
" " キーマップ
" " 2-key Find Motion
" map <Space><Space> <Plug>(easymotion-s2)
" " Line Motion
" map <Space>j <Plug>(easymotion-bd-jk)
" map <Space>k <Plug>(easymotion-bd-jk)
" " map l <Plug>(easymotion-bd-jk)
" " Search Motion
" " set nohlsearch
" map  <Space>/ <Plug>(easymotion-sn)
" omap <Space>/ <Plug>(easymotion-tn)
" " map  n <Plug>(easymotion-next)
" " map  N <Plug>(easymotion-prev)
" " }}}

" tsuquyomi
autocmd FileType typescript nmap ,n <Plug>(TsuquyomiRenameSymbolC)
autocmd FileType typescript nmap ,d <Plug>(TsuquyomiDefinition)
autocmd FileType typescript nmap ,b <Plug>(TsuquyomiGoBack)
autocmd FileType typescript nmap ,r <Plug>(TsuquyomiReference)
let g:tsuquyomi_disable_quickfix = 1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" let g:go_metalinter_command = "gometalinter --linter='vet:go tool vet -composite=false -printfuncs=Infof,Debugf,Warningf,Errorf {pathes}:PATH:LINE:MESSAGE'"
autocmd FileType go nmap ,b <Plug>(go-build)
autocmd FileType go nmap ,v <Plug>(go-coverage)
autocmd FileType go nmap ,d <Plug>(go-def)
autocmd FileType go nmap ,n <Plug>(go-rename)
autocmd FileType go nmap ,r <Plug>(go-run)
autocmd FileType go nmap ,t <Plug>(go-test)

" }}}

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
  \ }
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

function! InactivateInputMethod()
  call system('fcitx-remote -c')
endfunction
autocmd InsertLeave * call InactivateInputMethod()
