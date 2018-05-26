" General Settings
set nocompatible
" set term=screen-256color
execute pathogen#infect()
syntax on filetype plugin indent on
set ignorecase
set number
set ai
set backspace=indent,eol,start
set colorcolumn=120
" Highlight searches
set hlsearch
" No intro message
set shortmess=atI
" Blink cursor instead of stupid bell
set vb
" Allow mouse support for those rare cases
set mouse=a

" Show the command as it's typed
set showcmd
set hidden
set termguicolors     " enable true colors support
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" vim airline
set laststatus=2
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Keymapping settings
let mapleader = ","

map <C-e> :NERDTreeToggle<CR>
nnoremap <leader>w :w<CR>
:imap <c-w> <Esc>:w<CR>
map <leader>r :NERDTreeFind<cr>

" Enable clipboard sharing
set clipboard=unnamed

" Indents
set expandtab
autocmd Filetype graphql,coffee,xml,htmldjango,less,javascript,css,scss,html,jsx,ruby,eruby,yaml,sh,json setlocal ts=2 sw=2 sts=0
autocmd Filetype go setlocal ts=4 sw=4 sts=4
autocmd Filetype proto setlocal ts=4 sw=4 sts=0

" CtrlP Settings
" set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
" \ --ignore .git
" \ --ignore .svn
" \ --ignore .hg
" \ --ignore .swp
" \ --ignore .DS_Store
" \ --ignore "**/*.pyc"
" \ --ignore "TEST-*.xml"
" \ --ignore "node_modules"
" \ -g ""'

" Ruby on Rails
noremap <C-b> :R<CR>

" Nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}


" Asyncrun
:noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>
augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

" Use Tab to switch buffer
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Copy current file to clipboard
nmap <Leader>% :let<Space>@*=@%<CR>

" splits
set splitbelow
set splitright
set diffopt+=vertical
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

tnoremap <Esc> <C-\><C-n>

" close windows/delete buffers
nnoremap <C-q> :q<cr>

set rtp+=/usr/local/opt/fzf

" fzf
nnoremap <C-P> :Files<cr>
nnoremap <C-B> :Buffers<cr>
let g:fzf_history_dir = '~/.local/share/fzf-history'

" shortcut for :on
nmap <Leader>q :on<CR>

" vim-gutter
set updatetime=100

" golden-ratio
let g:golden_ratio_wrap_ignored = 1

" deoplete options
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
