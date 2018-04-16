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
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" golang

Plug 'neomake/neomake'
autocmd BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }



Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
set completeopt=longest,menuone " auto complete setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

Plug 'zchee/deoplete-go', { 'do': 'make' }


Plug 'sebdah/vim-delve'


"autocmd BufWritePost *.go :GoBuild
au FileType go nmap <Leader>s <Plug>(go-implements)
au Filetype go nnoremap <leader>gd :split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>gD :exe "GoDef"<CR>
au Filetype go nnoremap gb :exe "GoBuild"<CR>
au Filetype go nnoremap <leader>gc :exe "GoCoverage"<CR>
au Filetype go nnoremap <leader>gt :exe "GoTest"<CR>
au Filetype go nnoremap <leader>gi :exe "GoImplements"<CR>

" airline
Plug 'vim-airline/vim-airline'

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

" Tagbar and proto
Plug 'tenfyzhong/tagbar-proto.vim'

" file sidebar
Plug 'scrooloose/nerdtree'
nnoremap <leader>f :NERDTreeFind<CR>wincmd p<CR>
nnoremap <leader>F :NERDTreeClose<CR>
" close nerdtree if it is the last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTreeFind | wincmd p

" git cool stuff in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'



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
set termguicolors

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

