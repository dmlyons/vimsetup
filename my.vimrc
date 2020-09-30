"Installation

"Download plug.vim and put it in the "autoload" directory.

"UNIX VIM:
" ln -s ~/src/vimsetup/my.vimrc ~/.vimrc
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"NEOVIM:
"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" this file belongs in ~/.config/nvim/init.vim
" ln -s ~/src/vimsetup/my.vimrc ~/.config/nvim/init.vim

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

set nocompatible              " be iMproved, required
filetype off                  " required
set modelines=0
set hidden

" EX mode can blow me
nnoremap Q <nop>

call plug#begin('~/.vim/plugged')

let g:session_autosave = 'no'

" Add or remove your Plugs here:
"
" vim polyglot
Plug 'sheerun/vim-polyglot'

" If installed using Homebrew
Plug 'junegunn/fzf'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
nnoremap <leader>b :BlamerToggle<CR>
Plug 'airblade/vim-gitgutter'
nnoremap <leader>gg :GitGutterToggle<CR>

" airline
Plug 'vim-airline/vim-airline'
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" file sidebar
Plug 'scrooloose/nerdtree'
nnoremap <leader>f :NERDTreeFind<CR>wincmd p<CR>
nnoremap <leader>F :NERDTreeClose<CR>
" close nerdtree if it is the last thing open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd vimenter * NERDTreeFind | wincmd p

" git cool stuff in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

" session stuff
let g:sessions_dir = '~/.vim/sessions'
exec 'nnoremap <leader>ss :mks! ' . g:sessions_dir . '/Session.vim<CR>'
exec 'nnoremap <leader>sr :source ' . g:sessions_dir . '/Session.vim<CR>'

" spelling
nnoremap <leader>sp :setlocal spell!<CR>

" maybe get 'hit enter to continue' to go away
set cmdheight=2

" I like line numbers
set number

" Highlite search
set hlsearch

set wrap

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" Use spaces for tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" tabstop is 2 for proto
autocmd Filetype proto setlocal tabstop=2 softtabstop=2 shiftwidth=2
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

" persistant undo
set undofile
set undodir=~/.vim/undo

set mouse=a
syntax enable
set termguicolors

set clipboard=unnamedplus
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
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" split a bit more naturally
" set splitbelow
set splitright
