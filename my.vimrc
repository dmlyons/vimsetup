" follow install directions at: https://github.com/Shougo/neobundle.vim
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" Add or remove your Bundles here:

" golang
NeoBundle 'fatih/vim-go'
let g:go_fmt_command = "goimports"
au Filetype go nnoremap <leader>G :exe "GoDef" <CR>
au Filetype go nnoremap <leader>g :tab split <CR>:exe "GoDef"<CR>

" Git integration, autodelete hidden fugitive buffers
NeoBundle 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" surround
NeoBundle "tpope/vim-surround"

" php syntax highlighting
NeoBundle 'StanAngeloff/php.vim'

" php fixer
NeoBundle "stephpy/vim-php-cs-fixer"
let g:php_cs_fixer_level = "psr2"

" better php ctags support?
"NeoBundle "vim-php/tagbar-phpctags.vim"
NeoBundle "tagbar-phpctags"
"let g:tagbar_phpctags_bin='$HOME/.vim/bundle/tagbar-phpctags/bin'
let g:tagbar_phpctags_memory_limit = '512M'

" try majutsushi/tagbar
NeoBundle "majutsushi/tagbar"
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" file sidebar
NeoBundle 'scrooloose/nerdtree'
nnoremap <leader>f :NERDTreeToggle<CR>

" syntax checker
NeoBundle 'scrooloose/syntastic'
let g:syntastic_php_phpcs_args = "--standard=PSR2"

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" I like line numbers
set number

" Highlite search
set hlsearch

" slightly bigger font
set guifont=Menlo\ Regular:h14

" Use spaces for tabs
set tabstop=4
set shiftwidth=4
set expandtab

" move the backup and swap directories
set backupdir=~/.vim/backup,.,/tmp
set directory=~/.vim/backup,.,/tmp

" always show the status line
set laststatus=2

" highlight the current column and line of the cursor
set cursorcolumn
set cursorline
