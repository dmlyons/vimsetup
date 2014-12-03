" https://github.com/Shougo/neobundle.vim
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

NeoBundle 'fatih/vim-go'
let g:go_fmt_command = "goimports"
au Filetype go nnoremap <leader>G :exe "GoDef" <CR>
au Filetype go nnoremap <leader>g :tab split <CR>:exe "GoDef"<CR>

" php syntax
NeoBundle 'StanAngeloff/php.vim'

" php fixer
NeoBundle "stephpy/vim-php-cs-fixer"
let g:php_cs_fixer_level = "psr2"
"autocmd FileType php autocmd BufWritePre <buffer> Fmt

" tag sidebar
"NeoBundle 'taglist.vim'
"nnoremap <leader>t :TlistToggle<CR>

" try majutsushi/tagbar
NeoBundle "majutsushi/tagbar"
nnoremap <leader>t :TagbarToggle<CR>

" file sidebar
NeoBundle 'scrooloose/nerdtree'
nnoremap <leader>n :NERDTreeToggle<CR>

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
