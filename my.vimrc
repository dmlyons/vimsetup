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
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"au Filetype go nnoremap <leader>G :exe "GoDef" <CR>
au FileType go nmap <Leader>s <Plug>(go-implements)
au Filetype go nnoremap <leader>gd :split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>gD :exe "GoDef"<CR>
au Filetype go nnoremap <leader>gb :exe "GoBuild"<CR>
au Filetype go nnoremap <leader>gc :exe "GoCoverage"<CR>
au Filetype go nnoremap <leader>gt :exe "GoTest"<CR>
au Filetype go nnoremap <leader>gi :exe "GoImplements"<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" deoplete
NeoBundle 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1

" neocomplete
"NeoBundle 'Shougo/neocomplete.vim'
"let g:neocomplete#enable_at_startup = 1 
"let g:neocomplete#enable_smart_case = 1

" Git integration, autodelete hidden fugitive buffers
"NeoBundle 'tpope/vim-fugitive'
"autocmd BufReadPost fugitive://* set bufhidden=delete
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" surround
" NeoBundle "tpope/vim-surround"

" php syntax highlighting
"NeoBundle 'StanAngeloff/php.vim'
"au BufRead,BufNewFile *.inc setfiletype php

" php fixer
" NeoBundle "stephpy/vim-php-cs-fixer"
" let g:php_cs_fixer_level = "psr2"

" better php ctags support?
" NeoBundle "tagbar-phpctags"
" let g:tagbar_phpctags_memory_limit = '512M'
" autocmd FileType tagbar setlocal nocursorline nocursorcolumn

" Ruby stuff
"NeoBundle "vim-ruby/vim-ruby"
"autocmd FileType ruby compiler ruby

" matchit
" NeoBundle "matchit.zip"

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
let g:tagbar_type_php  = {
  \ 'ctagstype' : 'php',
  \ 'kinds'     : [
      \ 'i:interfaces',
      \ 'c:classes',
      \ 'd:constant definitions',
      \ 'f:functions',
      \ 'j:javascript functions:1'
  \ ]
\ }


" file sidebar
NeoBundle 'scrooloose/nerdtree'
nnoremap <leader>f :NERDTreeToggle<CR>

" syntax checker
NeoBundle 'scrooloose/syntastic'
let g:syntastic_php_phpcs_args = "--standard=PSR2"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 0


" airline
NeoBundle 'bling/vim-airline'

" ag
"" NeoBundle 'rking/ag.vim'

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

" colorscheme
colorscheme koehler

" highlight the current column and line of the cursor
set cursorcolumn
set cursorline

" https://github.com/Homebrew/homebrew/issues/19942
set regexpengine=1

" persistant undo
set undofile
set undodir=~/.vim/undo

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
"  if exists("+lines")
"    set lines=50
"  endif
"  if exists("+columns")
"    set columns=100
"  endif
endif

set mouse=a
syntax enable
set clipboard=unnamed
set smartcase
" make backspace sane
set backspace=indent,eol,start

" check to see if the file has been updated more often
au CursorHold * checktime

" increase timeout on install for YCM
let g:neobundle#install_process_timeout = 1500

" autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
