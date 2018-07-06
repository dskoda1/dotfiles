set nocompatible              " be iMproved, required
filetype off                  " required

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


syntax on
filetype plugin indent on

" allow more color schemes to work
"set t_Co=256
colorscheme Chasing_Logic

" Tabs are 4 stops
set tabstop=4
set expandtab

" use last indent on next line
set autoindent
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set ruler
set number

" Backspace over anything
"set backspace=2
set backspace=indent,eol,start

" make screen not flash on error
set vb t_vb=""

"set mouse=a

"history spans multiple openings/closings of a file
try
    set undodir=/.vimundo
    set undofile
catch
endtry

" relative numbering
set rnu

" fast terminal connection
"set ttyfast

" automatically create closing braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
" parentheses
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()


inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Two js equal to an esc
inoremap jj <ESC>
inoremap JJ <ESC>
inoremap Jj <ESC>
inoremap jJ <ESC>

" remap for switching panes, so you dont
" have to click ctrl w first, just ctrl hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Autocompletion for : menu
set wildmenu

" Include search/highlight search
set incsearch
set hlsearch

" tell you where 80 columns is
set colorcolumn=80  
  

" Delete extra whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" On :w, strip trailing whitespaces
autocmd FileType csc2,c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=LightGray guibg=LightGray
match ExtraWhitespace /\s\+$/

" Auto complete for files that are open in vim only
function InsertTabWrapper()
	let col = col('.') - 1
		if !col || getline('.')[col - 1]!~'\k'
		    return "\<tab>"
	    else
			return "\<c-p>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>


" Add include guards around #include statements
nmap <F7> yyPwdwiifndef INCLUDED<Esc>lr_vw~wDjo#endif<Esc>o<Esc>

augroup H
    au BufNewFile *.h 0r ~/.emptyclass.h
augroup end

augroup Cpp
    au BufNewFile *.cpp 0r ~/.emptyclass.cpp
augroup end

augroup Main
    au BufNewFile *m.cpp 0r ~/.empty.m.cpp
augroup end

augroup Csc2
    au BufNewFile *.csc2 0r ~/.empty.csc2
augroup end


