filetype off

if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/dein.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'cohama/lexima.vim'
Plug 'kana/vim-smartchr'
Plug 'tyru/caw.vim'
Plug 'Lokaltog/vim-easymotion'
" Plug 'christoomey/vim-tmux-navigator'
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
" Plug 'w0rp/ale'
Plug 'neomake/neomake'
Plug 'minodisk/nvim-finder', { 'do': ':FinderInstallBinary' }
Plug 'fatih/vim-go', { 'for': ['go', 'gohtmltmpl', 'gotexttmpl'] }
" Plug 'Quramy/tsuquyomi', { 'for': ['typescript'] }
Plug 'mhartington/nvim-typescript', { 'for': ['typescript'] }
" Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
Plug 'ekalinin/Dockerfile.vim'
Plug 'markcornick/vim-terraform', { 'for': ['terraform'] }
Plug 'vim-scripts/nginx.vim', { 'for': ['nginx'] }
Plug 'cespare/vim-toml', { 'for': ['toml'] }
Plug 'vim-scripts/AnsiEsc.vim', { 'for': ['log'] }
" Plug 'keith/tmux.vim', { 'for': ['tmux'] }
Plug 'othree/yajs.vim', { 'for': ['javascript'] }
Plug 'othree/html5.vim', { 'for': ['html'] }
Plug 'tmhedberg/matchit'
Plug 'hail2u/vim-css3-syntax'
" Plug 'fleischie/vim-styled-components', { 'for': ['javascript', 'typescript'] }
Plug 'flowtype/vim-flow', { 'for': ['javascript'] }
call plug#end()

let g:plug_timeout = 180

let s:vim_dir = expand('~/.config/nvim')
" let s:dein_dir = s:vim_dir . '/dein'
" let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" if &runtimepath !~# '/dein.vim'
"   if !isdirectory(s:dein_repo_dir)
"     execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
"   endif
"   execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
" endif
" let dein#types#git#clone_depth = 1
" if dein#load_state(s:dein_dir)
"   call dein#begin(s:dein_dir)
"   let s:toml      = s:vim_dir . '/dein.toml'
"   let s:lazy_toml = s:vim_dir . '/dein_lazy.toml'
"   call dein#load_toml(s:toml,      {'lazy': 0})
"   call dein#load_toml(s:lazy_toml, {'lazy': 1})
"   call dein#end()
"   call dein#save_state()
" endif
" if dein#check_install()
"   call dein#install()
" endif

syntax enable
filetype on
filetype plugin indent on

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
set list listchars=tab:▸\ ,nbsp:.,trail:.,eol:¬
set title
set number
set laststatus=2
set showmatch
set cursorline
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
set clipboard+=unnamedplus
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
set t_Co=256

scriptencoding utf-8

colorscheme gruvbox

function! AttachScheme()
  highlight clear SpellBad
  highlight SpellBad                  cterm=underline
  highlight Normal                    ctermbg=none
  highlight SignColumn                ctermbg=none
  highlight LineNr                    ctermbg=234
  highlight CursorLineNr              ctermbg=234
  highlight IndentGuidesOdd           ctermbg=236
  highlight IndentGuidesEven          ctermbg=237
  highlight CursorLine                ctermbg=238
  highlight Cursor                    ctermbg=239
  highlight ALEErrorSign              ctermbg=none ctermfg=167
  highlight ALEWarningSign            ctermbg=none ctermfg=214
endfunction

augroup additional_colorscheme
  autocmd!
  autocmd VimEnter,Colorscheme * call AttachScheme()
augroup END

augroup file_type
  autocmd!
  autocmd BufNewFile,BufRead,BufReadPre *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead,BufReadPre *.es6 set filetype=javascript
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
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Cursor shape
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
if has('nvim')
  nmap <BS> <C-W>h

  tnoremap <silent> <ESC> <C-\><C-n>
  tnoremap <silent> <C-h> <C-\><C-n><C-w>h
  tnoremap <silent> <C-j> <C-\><C-n><C-w>j
  tnoremap <silent> <C-k> <C-\><C-n><C-w>k
  tnoremap <silent> <C-l> <C-\><C-n><C-w>l
  augroup term_mode
    autocmd!
    autocmd BufWinEnter,WinEnter term://* startinsert
  augroup END

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

" Python3
let g:python3_host_prog = '/usr/bin/python3'

" PreserveNoEOL
let g:PreserveNoEOL = 1

" autodate
let g:autodate_format="%Y/%m/%d %H:%M:%S"

" autoformat
let g:formatdef_css = '"stylefmt"'
let g:formatters_css = ['css']

let g:jscomplete_use = ['dom', 'moz']

" Watch file
" http://vim-jp.org/vim-users-jp/2011/03/12/Hack-206.html
augroup check_time
  autocmd!
  autocmd WinEnter * checktime
augroup END

" " Restore cursor position
" function! s:restore_cursor()
"   if line("'\"") <= line("$")
"     normal! g`"
"     return 1
"   endif
" endfunction
" augroup restore_cursor
"   autocmd!
"   autocmd BufWinEnter * call s:restore_cursor()
" augroup END

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
nnoremap / /\v
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
let g:deoplete#input_patterns = {}
let g:deoplete#input_patterns.typescript = '\w*'
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.go = '[^. *\t]\.\w*'
let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'
" let g:deoplete#omni_patterns.typescript = '[^. *\t]\.\w*'
" let g:deoplete#omni_patterns.typescript = '\w\+'
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
" let g:deoplete#sources#tss#javascript_support = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" vim-flow
let g:flow#autoclose = 1
let g:flow#enable = 0

" nvim-finder
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

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" format
function! FormatStandard()
  silent !standard --fix %
  " edit!
  " syntax on
  " call AttachScheme()
endfunction
" augroup standard
"   autocmd!
"   autocmd BufWritePost *.js call FormatStandard()
" augroup END

" ale {{{
" let g:ale_sign_error = '▶'
" let g:ale_sign_warning = '▶'
" let g:ale_sign_info = '？'
" let g:ale_sign_style_error = '▷'
" let g:ale_sign_style_warning = '▷'
" let g:ale_echo_msg_format = '%linter% %severity%: %s'
" let g:ale_javascript_standard_options = '--parser babel-eslint --plugin flowtype'
" let g:ale_linters = {
" \ 'css': ['stylelint'],
" \ 'javascript': ['flow', 'standard'],
" \ 'typescript': ['tsserver', 'tslint', 'typecheck'],
" \ 'go': ['gofmt -e', 'go vet', 'golint', 'gometalinter', 'go build', 'gosimple', 'staticcheck'],
" \}
" nmap <silent> <C-n> <Plug>(ale_previous_wrap)
" nmap <silent> <C-N> <Plug>(ale_next_wrap)
" augroup ale
"   autocmd!
"   autocmd User ALELint call lightline#update()
" augroup END
" function! ALEError()
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   return printf(
"   \   '%d',
"   \   all_errors
"   \)
" endfunction
" function! ALEWarning()
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return printf(
"   \   '%d',
"   \   all_non_errors
"   \)
" endfunction
" }}}

" {{{
augroup neomake_hooks
  autocmd!
  autocmd BufWritePost * Neomake
  autocmd User NeomakeJobFinished call lightline#update()
augroup END

function! NeomakeErrors()
  let l:counts = neomake#statusline#LoclistCounts()
  return printf(
  \   '%d',
  \   l:counts.E
  \)
endfunction
function! NeomakeWarnings()
  let l:counts = neomake#statusline#LoclistCounts()
  return printf(
  \   '%d',
  \   l:counts.W
  \)
endfunction
" }}}

" syntastic {{{
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_mode_map={
"     \ 'mode': 'active',
"   \ }
"     " \ 'passive_filetypes': ['go']
" let g:go_list_type = "quickfix"
"
" let g:syntastic_error_symbol = "▶"
" let g:syntastic_style_error_symbol = "▶"
" let g:syntastic_warning_symbol = "▷"
" let g:syntastic_style_warning_symbol = "▷"
"
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
" let g:syntastic_css_checkers = ['stylelint']
" let g:syntastic_go_checkers = ['go']
" " let g:syntastic_javascript_checkers = ['flow']
" let g:syntastic_css_stylelint_exec = 'stylelint-config-standard'
" }}}

" caw.vim
nmap ,/ <Plug>(caw:hatpos:toggle)
vmap ,/ <Plug>(caw:hatpos:toggle)

" vim-smartchr
inoremap <expr> , smartchr#loop(', ', ',')

" " EasyMotion
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

" tsuquyomi
" augroup tsuquyomi
"   autocmd!
"   autocmd FileType typescript nmap <buffer> ,n <Plug>(TsuquyomiRenameSymbolC)
"   autocmd FileType typescript nmap <buffer> ,d <Plug>(TsuquyomiDefinition)
"   autocmd FileType typescript nmap <buffer> ,b <Plug>(TsuquyomiGoBack)
"   autocmd FileType typescript nmap <buffer> ,r <Plug>(TsuquyomiReference)
"   autocmd Filetype typescript :TsuquyomiStartServer
" augroup END
" let g:tsuquyomi_disable_quickfix = 1
" let g:tsuquyomi_save_onrename = 0

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
  \ 'component_expand': {
  \   'error': 'NeomakeErrors',
  \   'warning': 'NeomakeWarnings',
  \ },
  \ 'component_type': {
  \   'error': 'error',
  \   'warning': 'warning',
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

nmap <silent> <C-Up> :call <SID>LocationPrevious()<CR>
nmap <silent> <C-Down> :call <SID>LocationNext()<cr>
function! <SID>LocationPrevious()
        try
                lprev!
        catch /:E776:/ " No location list
        catch /:E553:/ " End/Start of location list
                call <SID>LocationLast()
        catch /:E926:/ " Location list changed
                ll!
        endtry
endfunction
function! <SID>LocationNext()
        try
                lnext!
        catch /:E776:/ " No location list
        catch /:E553:/ " End/Start of location list
                call <SID>LocationFirst()
        catch /:E926:/ " Location list changed
                call <SID>LocationNext()
        endtry
endfunction
function! <SID>LocationFirst()
        try
                lfirst!
        catch /:E926:/ " Location list changed
                call <SID>LocationFirst()
        endtry
endfunction
function! <SID>LocationLast()
        try
                llast!
        catch /:E926:/ " Location list changed
                call <SID>LocationLast()
        endtry
endfunction
