if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-rsi'
    Plug 'tpope/vim-fugitive'
    Plug 'mileszs/ack.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'jstemmer/gotags', { 'for': 'go' }
    Plug 'jpalardy/vim-slime', { 'for': ['scheme', 'lua', 'ocaml', 'sql', 'python', 'perl'] }
    Plug 'majutsushi/tagbar'
    Plug 'nanotech/jellybeans.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'dense-analysis/ale'
    Plug 'rust-lang/rust.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mogelbrod/vim-jsonpath', { 'for': 'json' }
    " Plug 'python-mode/python-mode', { 'for': 'python' }
call plug#end()

noremap l o
noremap o l
noremap L O
noremap O L
noremap j n
noremap n j
noremap J N
noremap N J
noremap k e
noremap e k
noremap K E
noremap E K
noremap h y
noremap y h
noremap H Y
noremap Y H

noremap <silent> gk ge
noremap <silent> gK gE
noremap <silent> ge gk
noremap <silent> gn gj
noremap <silent> gN gJ
noremap <silent> gj gn
noremap <silent> gJ gN

nnoremap <silent> <F5> :!%:p<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <silent> <C-s> :w<CR>

" Windows
nnoremap <silent> <C-w>o <C-w>l
nnoremap <silent> <C-w>y <C-w>h
nnoremap <silent> <C-w>n <C-w>j
nnoremap <silent> <C-w>e <C-w>k
nnoremap <silent> <C-w>O <C-w>L
nnoremap <silent> <C-w>Y <C-w>H
nnoremap <silent> <C-w>N <C-w>J
nnoremap <silent> <C-w>E <C-w>K

" Filter search history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Netrw
nmap <BS> -
let g:netrw_winsize = 25
" let g:netrw_liststyle = 3
" let g:netrw_banner = 0
" let g:netrw_browse_split = 4
" let g:netrw_list_hide = &wildignore

nnoremap <silent> <F12> :set paste!<CR>

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
" set autoindent
" set preserveindent
" set copyindent

" set lazyredraw
if has("autocmd")
  filetype plugin indent on
endif

set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=2
set history=100
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set nomodeline

silent !mkdir ~/.vim/undo > /dev/null 2>&1
silent !mkdir ~/.vim/backup > /dev/null 2>&1
silent !mkdir ~/.vim/swp > /dev/null 2>&1

nnoremap <silent> <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_ctags_bin = 'ctags-universal'

nnoremap <C-f> :Ack<SPACE>
let g:ackhighlight = 1

nnoremap <C-p> :FZF<CR>

let s:vimwiki_path = '~/Documents/wiki/'

nnoremap <silent> <Leader>wv :!ghostwriter 2>/dev/null "%" &<CR>
let wiki = {}
let wiki.path = s:vimwiki_path
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.nested_syntaxes = {
    \ 'c': 'c',
    \ 'go': 'go',
    \ 'json': 'json',
    \ 'lua': 'lua',
    \ 'make': 'make',
    \ 'ocaml': 'ocaml',
    \ 'perl': 'perl',
    \ 'proto': 'proto',
    \ 'python': 'python',
    \ 'scheme': 'scheme',
    \ 'sh': 'sh',
    \ 'sql': 'sql',
\}

let g:vimwiki_list = [wiki]
let g:vimwiki_ext2syntax = {'.md': 'markdown' }

set path=$PWD/**

set t_Co=256
syntax on
color jellybeans

let g:slime_target='tmux'
let g:slime_bracketed_paste=1 " иначе python ломается

if executable('rg')
    let g:ackprg = 'rg --smart-case --vimgrep'
endif

autocmd Filetype go nmap <buffer> <Leader>ge <Plug>(go-if-err)
autocmd Filetype go nmap <buffer> <Leader>gi <Plug>(go-info)
autocmd Filetype go nmap <buffer> <Leader>gI <Plug>(go-imports)
autocmd Filetype go nmap <buffer> <Leader>gm <Plug>(go-implements)
autocmd Filetype go nmap <buffer> <Leader>gt <Plug>(go-def-type)
autocmd Filetype go nmap <buffer> <Leader>gr <Plug>(go-referrers)
autocmd Filetype go nmap <buffer> E <Plug>(go-doc)

let g:go_fmt_autosave = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_auto_type_info = 0
" let g:go_info_mode = 'guru'
let g:go_decls_mode = 'ctrlp.vim'
let g:go_doc_popup_window = 1
" let g:go_doc_balloon = 1
let g:go_def_mode = 'gopls'
let g:go_imports_autosave = 0

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

let g:vim_json_conceal = 0

" rust
let g:rustfmt_autosave = 1
let g:ale_close_preview_on_insert = 1
let g:ale_completion_enabled = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_linters = {
\  'rust': ['analyzer'],
\  'perl': ['perlnavigator'],
\ }
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0


" TODO:
" `:ALEReset`       - `<Plug>(ale_reset)`
" `:ALEResetBuffer` - `<Plug>(ale_reset_buffer)`


" let g:ale_fixers = { 'rust': ['rustfmt'] }

nnoremap <Leader> <Space> <Plug>(ale_reset_buffer)

function! CloseAlePopup() abort
    let l:mode = mode()
    let l:restore_visual = l:mode is# 'v' || l:mode is# 'V' || l:mode is# "\<C-V>"

    if !exists('w:preview')
        return
    endif

    call setbufvar(w:preview['buffer'], '&modified', 0)

    if win_id2win(w:preview['id']) > 0
        execute win_id2win(w:preview['id']).'wincmd c'
    endif

    unlet w:preview

    if l:restore_visual
        normal! gv
    endif
endfunction

" autocmd Filetype rust set completeopt=menu,menuone,preview,noselect,noinsert
autocmd Filetype rust nnoremap <silent> <buffer> <C-]> <Plug>(ale_go_to_definition)
autocmd Filetype rust nnoremap <silent> <buffer> E <Plug>(ale_hover)
autocmd Filetype rust nnoremap <buffer> <silent> <Esc> :call CloseAlePopup()<CR>

autocmd Filetype perl nnoremap <silent> <buffer> <C-]> <Plug>(ale_go_to_definition)
autocmd Filetype perl nnoremap <silent> <buffer> E <Plug>(ale_hover)
autocmd Filetype perl nnoremap <buffer> <silent> <Esc> :call CloseAlePopup()<CR>

" let g:ale_perl_perlnavigator_config = {
" \   'perlnavigator': {
" \       'enableWarnings': 1,
" \       'includePaths': [ $HOME . '/MyPerlStuff/lib', '/tmp/tmp.7qSgUo34e' ],
" \       'perlEnvAdd': 1,
" \       'perlEnv': {
" \           'PERL_DL_NONLAZY': 1,
" \       },
" \       'perlPath': substitute(g:ale_perl_perl_executable, '/perl$', '', ''),
" \       'perlcriticEnabled': 1,
" \       'perlcriticProfile': '$workspaceFolder/.perlcriticrc',
" \       'perltidyProfile': '$workspaceFolder/.perltidyrc',
" \       'perlcriticSeverity': 2,
" \   },
" \ }

let g:ale_perl_perlnavigator_config = {
\   'perlnavigator': {
\       'enableWarnings': 1,
\       'includePaths': [ $HOME . '/Work/crazypanda/poker/server'],
\       'perlcriticEnabled': 0,
\   },
\}


set matchpairs+=<:>

" if exists(':tnoremap')
"     tnoremap <Esc> <C-\><C-n>
" endif

" highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\t/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\t/
" autocmd BufWinLeave * call clearmatches()

" for vim-commentary
autocmd Filetype ocaml setlocal commentstring=\(*%s*\)
autocmd Filetype sql   setlocal commentstring=--\ %s
autocmd Filetype proto setlocal commentstring=//\ %s

" for vim-slime
nmap <C-c> <Plug>SlimeMotionSend

if exists('&cryptmethod')
    set cryptmethod=blowfish2
endif

augroup WrapLineInVimwiki
    autocmd!
    autocmd FileType vimwiki setlocal nowrap
augroup END

autocmd BufNewFile,BufRead *.sls set filetype=scheme


if &term ==# 'xterm-256color' || &term ==# 'screen-256color' || &term ==# 'xterm-termite'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif
