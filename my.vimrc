" install: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add or remove your Plugins here:

Plugin 'tpope/vim-fugitive'

" golang
Plugin 'fatih/vim-go'
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
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_def_reuse_buffer = 1
let g:go_gocode_autobuild = 1
let g:go_gocode_propose_builtins = 1 " add builtins to the autocomplete
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

if has('nvim')
    " deoplete
    Plugin 'Shougo/deoplete.nvim'
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#go = 'vim-go'
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
    "let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
    let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
    set completeopt+=noinsert

    " deoplete-go
    Plugin 'zchee/deoplete-go'

    " Disable auto selection
    set completeopt+=noselect
    let g:python3_host_prog  = "/usr/local/bin/python3"

    " php
    Plugin 'StanAngeloff/php.vim'

    " neomake
"    Plugin 'benekastah/neomake'
"    autocmd! BufWritePost * Neomake!
"    let g:neomake_open_list =2 
"    let g:neomake_list_height = 4
else
    " syntax checker
    Plugin 'scrooloose/syntastic'
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
    let g:syntastic_go_checkers = ['golint', 'govet', 'gotype', 'errcheck']
    "let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
endif

" Snippets
" Plugin 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Comments
Plugin 'scrooloose/nerdcommenter'

" Tabular
Plugin 'godlygeek/tabular'

" surround
" Plugin "tpope/vim-surround"

" php syntax highlighting
"Plugin 'StanAngeloff/php.vim'
"au BufRead,BufNewFile *.inc setfiletype php

" php fixer
" Plugin "stephpy/vim-php-cs-fixer"
" let g:php_cs_fixer_level = "psr2"

" better php ctags support?
" Plugin "tagbar-phpctags"
" let g:tagbar_phpctags_memory_limit = '512M'
" autocmd FileType tagbar setlocal nocursorline nocursorcolumn

" Ruby stuff
"Plugin "vim-ruby/vim-ruby"
"autocmd FileType ruby compiler ruby

" matchit
" Plugin "matchit.zip"

" try majutsushi/tagbar
Plugin 'majutsushi/tagbar'
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
Plugin 'scrooloose/nerdtree'
nnoremap <leader>f :NERDTreeToggle<CR>

" airline
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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
" tabstop is 2 for yaml
autocmd Filetype yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
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

if has('nvim')
    " https://github.com/Homebrew/homebrew/issues/19942
    set regexpengine=1

    " persistant undo
    set undofile
    set undodir=~/.vim/undo
endif

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

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

