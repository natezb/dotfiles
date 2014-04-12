set textwidth=0
set wrapmargin=0

syntax on
set foldmethod=indent
set foldnestmax=2
nnoremap <Space> za

set number
set autochdir
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Make F2 select and copy the whole file and return to where we began
map <F2> ggVG"+y2<C-o>

" make Y yank to end of line
map Y y$

filetype plugin indent on

set hlsearch
hi Search guibg=LightBlue

nmap j gj
nmap k gk
nnoremap <C-j> 10j
nnoremap <C-k> 10k

nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
set t_Co=256

nmap <C-e> :e#<CR>

"nnoremap <C-n> :NERDTreeToggle<CR>

if has('mouse')
	set mouse=a
	if &term =~ "xterm" || &term =~ "screen"
		autocmd VimEnter * set ttymouse=xterm2
		autocmd FocusGained * set ttymouse=xterm2
		autocmd BufEnter * set ttymouse=xterm2
	endif
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set nosmartindent

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.s set filetype=avr

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYVIMRC | endif
augroup END


" BEGIN Vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'zeis/vim-kolor'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'flazz/vim-colorschemes'
Bundle 'nvie/vim-flake8'
filetype plugin indent on
" END Vundle stuff

" Set colorscheme after vundle stuff
color wombat256
hi Folded guibg=bg
hi Folded guifg='orange'

" Set cursor shapes
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>[6 q"
  let &t_EI = "\<Esc>[2 q"
endif


command! ReplaceChars :call ReplaceChars()
function! ReplaceChars()
    silent s/1\/2/½/eg
    silent s/1\/4/¼/eg
    silent s/3\/4/¾/eg
    silent s/degF/°F/eg
    silent s/degC/°C/eg
endfunction

map <F3> :ReplaceChars<CR>
