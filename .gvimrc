set guifont=SourceCodePro-Regular:h12
colorscheme hybrid
highlight LineNr guifg=#707880 guibg=#404040
highlight CursorLineNr guibg=#303030

""" 全角スペースを赤くハイライトする
augroup highlightIdegraphicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=167
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
