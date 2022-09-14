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
" ln -s ~/src/vimsetup/coc-settings.json ~/.config/nvim/coc-settings.json

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

" copilot
":Plug 'github/copilot.vim'

" airline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
" remove the  part
let g:airline_section_b=''
" remove separators for empty sections
"let g:airline_skip_empty_sections = 1

" tabular
Plug 'godlygeek/tabular'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git stuff
Plug 'tpope/vim-fugitive', {'tag': '*'}

Plug 'APZelos/blamer.nvim'
let g:blamer_enabled = 1
let g:blamer_date_format = '%m/%d/%y'
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = '  '

nnoremap <leader>b :BlamerToggle<CR>
Plug 'airblade/vim-gitgutter'
nnoremap <leader>gg :GitGutterToggle<CR>

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = ['coc-html', 'coc-tsserver', 'coc-yaml', 'coc-json', 'coc-snippets']
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
command! EditSnips CocCommand snippets.editSnippets
nmap <silent> <leader>c :call clearmatches()<CR>:call nvim_buf_clear_namespace(bufnr('%'), -1, 0, -1)<CR>
nmap <silent> <leader>e <Plug>(coc-diagnostic-next)
nmap <silent> <leader>E <Plug>(coc-diagnostic-next-error)

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_snippet_next = '<tab>'


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"autocmd BufWritePost *.go :GoBuild
au FileType go nmap <leader>s <Plug>(go-implements)
au Filetype go nnoremap <leader>gd :split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>gD :exe "GoDef"<CR>
au Filetype go nnoremap gb :exe "GoBuild"<CR>
au Filetype go nnoremap <leader>gc :exe "GoCoverage"<CR>
au Filetype go nnoremap <leader>gt :exe "GoTest"<CR>
au Filetype go nnoremap <leader>gi :exe "GoImplements"<CR>

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" " let g:go_metalinter_deadline = "20s"
" 
" let g:go_diagnostics_enabled = 0
" let g:go_metalinter_enabled = []
" 
" " Jump between errors on quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
" close the quickfix list
nnoremap <leader>a :cclose<CR>
nnoremap <leader>i :exe "GoSameIds"<CR>

" vim polyglot (should be loaded after vim-go)
Plug 'sheerun/vim-polyglot'

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
" tabstop is 2 for markdown
autocmd Filetype markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
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

set mouse=a
" colorscheme and Highlite
syntax enable
set termguicolors

colorscheme molokai
highlight Normal guibg=black guifg=white


" highlight the current column and line of the cursor
"set cursorcolumn
"set cursorline

" persistant undo
set undofile
set undodir=~/.vim/undo

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

" wsl2 fix for clipboard
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" fix cursor on vim ?FIXME WHY IS THIS HERE?
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" moving text around:
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv
