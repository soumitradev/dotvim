"the ownership of this config is uhmm... complicated
" my config (initially forked/inspired by dotangad's dotvim) --> 
" somi's new nvim config starter --> my config ded --> i take somi's 🙃

" UTF-8 😤
scripte utf-8

" Because (yea we don't really know why this is here . . .)
syntax on
filetype plugin indent on

" My prefs (might shift to 2 spaces some day 😳)
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set hlsearch
set wildmenu
set showmatch

" Apparently long line bad 🙄 (agreed.)
set colorcolumn=90

" Leader key is comma because idk why (originally from my config)
let mapleader = ","

" Plugins owo
call plug#begin('~/.local/share/nvim/plugged')

" Python
Plug 'davidhalter/jedi-vim'

"Epic theme (nah i don't like this)
"Plug 'kaicataldo/material.vim', { 'branch': 'main' }

"Much epicer theme imo
Plug 'ayu-theme/ayu-vim'

" Fast grep
Plug 'jremmen/vim-ripgrep'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Epic Undo
Plug 'mbbill/undotree'

"bhyi why put airline in undo smh
Plug 'vim-airline/vim-airline'

" Pair the brackets and quotes pls kthx
Plug 'jiangmiao/auto-pairs'

" idk what this does tbh | wow bhai this is like the most epic plugin lel
Plug 'scrooloose/nerdcommenter'

" Ig this formats stuff? idk looks like some indent thing (yes)
Plug 'sbdchd/neoformat'

" Highlight what I just yanked because I have no idea how to vim (same bro
" same)
Plug 'machakann/vim-highlightedyank'

" Use nerdtree with a nice little git plugin
Plug 'scrooloose/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

" Find the files plss
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Autocomplete (vvvepic would recommened 💯)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" I dont even use typescript lmao (i do bhyi sorry f abhi yaad aaya)
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" I dont use any of these themes but idk why theyre still here
" i do bhyi and it is epic
Plug 'vim-airline/vim-airline-themes', {'branch': 'master'}

" vibe zone comding
Plug 'junegunn/goyo.vim'

call plug#end()

" Remove delays while switching modes
set timeoutlen=1000 ttimeoutlen=10

" Move over visual lines
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Epic true colors
if (has('termguicolors'))
  set termguicolors
end

" Dont use jedi completions since coc-python has so many more epic features
let g:jedi#completions_enabled = 0
" Open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" File drawer:
" Use Ctrl+B because I am vscode boi
" Ctrl+B bad (bonk), use something faster
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" <leader>g to go into 'd epic vibe zone comding zone'
nnoremap <silent> <leader>g :Goyo<cr>

" Show hidden files, show smol UI, dont ignore anything, and turn off
" statusline
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open, and do some
" toggle magic I think idk exactly tbh but it does toggle using some function
" in this file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusWithFlags = 1
" Epic comment toggle thing
vmap <C-K> <plug>NERDCommenterToggle
nmap <C-K> <plug>NERDCommenterToggle

" Terminal stuff
" Open new split panes to right and below
set splitright
set splitbelow

"split navigations 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
"this won't work CL --> terminal
""nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Always start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Toggle terminal on Ctrl+L (thankq somi for this uwu)
let s:term_buf_nr = -1
function! s:ToggleTerminal() abort
    if s:term_buf_nr == -1
        split term://bash
        resize 10
        let s:term_buf_nr = bufnr("$")
    else
        try
            execute "bdelete! " . s:term_buf_nr
        catch
            let s:term_buf_nr = -1
            call <SID>ToggleTerminal()
            return
        endtry
        let s:term_buf_nr = -1
    endif
endfunction
nnoremap <silent> <C-L> :call <SID>ToggleTerminal()<CR>
tnoremap <silent> <C-L> :call <SID>ToggleTerminal()<CR>

" Exit fzf using Esc
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" File search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Make ctrl-p ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Airline stuff
" Use powerline font
let g:airline_powerline_fonts = 1

" No idea what this does but I like how it makes my statusline look
let g:airline_mode_map = {
  \ '__'     : '-',
  \ 'c'      : 'C',
  \ 'i'      : 'I',
  \ 'ic'     : 'I',
  \ 'ix'     : 'I',
  \ 'n'      : 'N',
  \ 'multi'  : 'M',
  \ 'ni'     : 'N',
  \ 'no'     : 'N',
  \ 'R'      : 'R',
  \ 'Rv'     : 'R',
  \ 's'      : 'S',
  \ 'S'      : 'S',
  \ ' '     : 'S',
  \ 't'      : 'T',
  \ 'v'      : 'V',
  \ 'V'      : 'V',
  \ '	'     : 'V',
  \ }

" Enter normal mode and save file with C-s
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
" Vertical split
nnoremap C-w v :vsplit<cr>

" Quick save and quit just in case the cops kick down the door
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Edit and reload vimrc
nnoremap <leader>ve :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>vr :source ~/.config/nvim/init.vim<CR>

" Coc autocomplete prefs

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" idk what these are and I'm too scared to touch it
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-python',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json']

set updatetime=300

" don't give |ins-completion-menu| messages (very important thank)
set shortmess+=c

" always show signcolumns
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <C-I>  <Plug>(coc-format-selected)
nmap <C-I>  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use Shift + K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" F2 Rename
nmap <F2> <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Form :call CocAction('format')
command! -nargs=0 Fmt :call CocAction('format')
nnoremap <C-i> :call CocAction('format')<CR>


" Fix autofix problem of current line
nmap <C-F> <Plug>(coc-fix-current)

" Colorscheme stuff
set termguicolors
let ayucolor="dark"
colorscheme ayu
" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
"let g:material_terminal_italics = 1
"let g:material_theme_style = 'ocean'
"colorscheme material
"let g:airline_theme='material'

