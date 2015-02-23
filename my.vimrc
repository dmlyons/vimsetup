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
" autoclose scratch window
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"au Filetype go nnoremap <leader>G :exe "GoDef" <CR>
au FileType go nmap <Leader>s <Plug>(go-implements)
au Filetype go nnoremap <leader>g :split <CR>:exe "GoDef"<CR>
let g:go_auto_type_info = 1

" neocomplete
NeoBundle 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1 

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
NeoBundle "tagbar-phpctags"
let g:tagbar_phpctags_memory_limit = '512M'

" Ruby stuff
NeoBundle "vim-ruby/vim-ruby"

" matchit
NeoBundle "matchit.zip"

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
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
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
set softtabstop=4
set shiftwidth=4
set expandtab
" tabstop is 2 for ruby
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
" tabstop for python
autocmd Filetype python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4


" move the backup and swap directories
set backupdir=~/.vim/backup,.,/tmp
set directory=~/.vim/backup,.,/tmp

" always show the status line
set laststatus=2

" highlight the current column and line of the cursor
set cursorcolumn
set cursorline

" colorscheme
colorscheme koehler
