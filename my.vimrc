"Installation

"Download plug.vim and put it in the "autoload" directory.

"Unix VIM

"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

set nocompatible              " be iMproved, required
filetype off                  " required
set modelines=0


call plug#begin('~/.vim/plugged')

" Add or remove your Plugs here:

Plug 'tpope/vim-fugitive'

" Terraform formatting (HCL)
Plug 'fatih/vim-hclfmt'

" ruby
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'

" golang
Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"
" autoclose scratch window
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"au Filetype go nnoremap <leader>G :exe "GoDef" <CR>
"autocmd BufWritePost *.go :GoBuild
au FileType go nmap <Leader>s <Plug>(go-implements)
au Filetype go nnoremap <leader>gd :split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>gD :exe "GoDef"<CR>
au Filetype go nnoremap gb :exe "GoBuild"<CR>
au Filetype go nnoremap <leader>gc :exe "GoCoverage"<CR>
au Filetype go nnoremap <leader>gt :exe "GoTest"<CR>
au Filetype go nnoremap <leader>gi :exe "GoImplements"<CR>
" highlight identical variables:
" let g:go_auto_sameids = 1
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
let g:go_metalinter_autosave = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_deadline = "15s"
let g:go_list_type = "quickfix"
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

" Protobuf syntax
Plug 'uarun/vim-protobuf'

" PHP
Plug 'shawncplus/phpcomplete.vim'
Plug 'vim-php/tagbar-phpctags.vim'
" php fixer
Plug 'stephpy/vim-php-cs-fixer'
"let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_rules = "@PSR2"                " wich rules or ruleset ?
"autocmd BufWritePost *.php :call PhpCsFixerFixFile()

if has('nvim')
    " vim delve
    Plug 'sebdah/vim-delve'

    " deoplete
    function! BuildNeovim(info)
        !pip3 install --upgrade neovim jedi psutil setproctitle
        :UpdateRemotePlugins
    endfunction
    Plug 'roxma/nvim-completion-manager', { 'do': function('BuildNeovim') }
"    Plug 'Shougo/deoplete.nvim', { 'do': function('BuildNeovim') }
"    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"    let g:deoplete#enable_at_startup = 1
"    let g:deoplete#sources#go = 'vim-go'
"    let g:deoplete#enable_smart_case = 1
"    let g:deoplete#omni_patterns = {}
"    let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
"    let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"    let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
"    set completeopt+=noinsert

    Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

    " deoplete-go
    Plug 'zchee/deoplete-go', { 'do': 'make'}

    " Disable auto selection
    set completeopt+=noselect
    let g:python3_host_prog  = "/usr/local/bin/python3"

    " php
    Plug 'StanAngeloff/php.vim'
else
    Plug 'Valloric/YouCompleteMe'
endif

"ale linting
Plug 'w0rp/ale'
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
" keep sign column
let g:ale_sign_column_always = 1
let g:ale_linters = {'go': ['gofmt -e', 'golint', 'go vet', 'gotype', 'go build']}

" airline
Plug 'bling/vim-airline'

" Comments
Plug 'scrooloose/nerdcommenter'

" Tabular
Plug 'godlygeek/tabular'

" surround
" Plug "tpope/vim-surround"

" Ruby stuff
"Plug "vim-ruby/vim-ruby"
"autocmd FileType ruby compiler ruby

" matchit
" Plug "matchit.zip"

" try majutsushi/tagbar
Plug 'majutsushi/tagbar'
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
Plug 'scrooloose/nerdtree'
nnoremap <leader>f :NERDTreeToggle<CR>

" Javascript
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" I like line numbers
set number

" Highlite search
set hlsearch

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
colorscheme torte

" highlight the current column and line of the cursor
"set cursorcolumn
"set cursorline

if has('nvim')
    " https://github.com/Homebrew/homebrew/issues/19942
    set regexpengine=1

    " persistant undo
    set undofile
    set undodir=~/.vim/undo
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

