filetype plugin on
filetype indent on
set ruler
set number
set ai
set si
set smarttab
set textwidth=140
set wrap
set exrc
set secure
set expandtab
set shiftwidth=4
set softtabstop=4
syntax on
set viminfo='10,\"100,:20,%,n~/.viminfo
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm
$"|endif|endif
set pastetoggle=<F10>
map <C-p> :w<CR>:!perl %<CR>
map <C-P> :w<CR>:!python3 %<CR>
map <C-C> :w<CR>:!gcc % -g -o %<&& ./%<<CR>
map <C-X> :w<CR>:!g++ % -Wall -Werror=all -Wextra -pedantic -g -o %<&& ./%<<CR>

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.pl 0r ~/.vim/templates/pltmpl
  augroup END
endif
colo elflord
" C++-specific stuff
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
let &path.="src/include,/usr/include/AL,"
set makeprg=make\ -C\ .\ -j4
nnoremap <F4> :make!<cr>
" let g:clang_library_path='/usr/lib64/libclang.so.7'
