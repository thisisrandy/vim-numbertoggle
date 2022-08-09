" vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
" Maintainer:        <https://jeffkreeftmeijer.com>
" Version:           2.1.2

augroup numbertoggle
  autocmd!
  autocmd BufEnter,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,InsertEnter,WinLeave * if &nu                  | set nornu | endif
augroup END
