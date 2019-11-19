let mapleader=" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/goyo.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

let g:airline_theme = 'codedark'

" Basic settings
syntax on
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number relativenumber
set termguicolors

set clipboard+=unnamedplus

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" Enable Disable colourizing
map <leader>d :ColorizerAttachToBuffer<CR>
map <leader>D :ColorizerDetachFromBuffer<CR>

map <leader>g :Goyo<CR>
map <leader>G :Goyo!<CR>

" Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Enable spell checking, o for othography
map <leader>s :setlocal spell! spelllang=en_au<CR>

" Enable disable auto indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Shell check
map <leader>P :!clear && shellcheck %<CR>

" Compile and open output
map <leader>r :w! \| !comp <c-r>%<CR><CR>
map <leader>o :!opout <c-r>%<CR><CR>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Alias replace all to S
nnoremap S :%s//g<Left><Left>

" Alias write to W
nnoremap W :w<CR>

" Alias write and quit to Q
nnoremap Q :wq<CR>

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Fix tex file type set
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Guide navigation
noremap <leader><Tab> <Esc>/<++><Enter>"_c4l
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" general insert commands
inoremap ;g <++>
inoremap ;q ""<++><Esc>?"<CR>i
inoremap ;a ''<++><Esc>?'<CR>i
inoremap ;b ()<++><Esc>?)<CR>i
inoremap ;s []<++><Esc>?]<CR>i
inoremap ;c {}<++><Esc>?}<CR>i
inoremap ;r ``<++><Esc>?`<CR>i


" shell
map <leader>b i#!/bin/sh<CR><CR>
autocmd FileType sh inoremap ,f ()<Space>{<CR><Tab><++><CR>}<CR><CR><++><Esc>?()<CR>
autocmd FileType sh inoremap ,i if<Space>[<Space>];<Space>then<CR><++><CR>fi<CR><CR><++><Esc>?];<CR>hi<Space>
autocmd FileType sh inoremap ,ei elif<Space>[<Space>];<Space>then<CR><++><CR><Esc>?];<CR>hi<Space>
autocmd FileType sh inoremap ,sw case<Space>""<Space>in<CR><++>)<Space><++><Space>;;<CR><++><CR>esac<CR><CR><++><Esc>?"<CR>i
autocmd FileType sh inoremap ,ca )<Space><++><Space>;;<CR><++><Esc>?)<CR>

" html
autocmd FileType html noremap <leader>d i<!DOCTYPE html><CR><html><CR><head><CR><meta charset="UTF-8"><CR><title><++></title><CR></head><CR><body><CR><++><CR></body><CR></html>
autocmd FileType html inoremap ,1 <h1></h1><CR><CR><++><Esc>?</h1<CR>i
autocmd FileType html inoremap ,2 <h2></h2><CR><CR><++><Esc>?</h2<CR>i
autocmd FileType html inoremap ,3 <h3></h3><CR><CR><++><Esc>?</h3<CR>i
autocmd FileType html inoremap ,4 <h4></h4><CR><CR><++><Esc>?</h4<CR>i
autocmd FileType html inoremap ,5 <h5></h5><CR><CR><++><Esc>?</h4<CR>i
autocmd FileType html inoremap ,6 <h6></h6><CR><CR><++><Esc>?</h4<CR>i
autocmd FileType html inoremap ,d <div><CR></div><CR><CR><++><Esc>?</div<CR><S-o>
autocmd FileType html inoremap ,ar <article><CR></article><CR><CR><++><Esc>?</arti<CR><S-o>
autocmd FileType html inoremap ,as <aside><CR></aside><CR><CR><++><Esc>?</asid<CR><S-o>
autocmd FileType html inoremap ,fic <figcaption><CR></figcaption><CR><CR><++><Esc>?</figcap<CR><S-o>
autocmd FileType html inoremap ,fi <figure><CR></figure><CR><CR><++><Esc>?</figure<CR><S-o>
autocmd FileType html inoremap ,he <header><CR></header><CR><CR><++><Esc>?</header<CR><S-o>
autocmd FileType html inoremap ,f <footer><CR></footer><CR><CR><++><Esc>?</footer<CR><S-o>
autocmd FileType html inoremap ,fo <form action=""><CR><++><CR></form><CR><CR><Esc>?"<CR>i
autocmd FileType html inoremap ,in <input type="" name="<++>" placeholder="<++>"/><CR><++><Esc>?""<CR>li
autocmd FileType html inoremap ,te <textarea rows="" col="<++>" placeholder="<++>"/><++></textarea><CR><++><Esc>?s=""<CR>llli
autocmd FileType html inoremap ,bu <button type=""><++></button><CR><++><Esc>?"<CR>i
autocmd FileType html inoremap ,la <label for=""><++></label><CR><++><Esc>?"<CR>i
autocmd FileType html inoremap ,ma <main><CR></main><CR><CR><++><Esc>?</main<CR><S-o>
autocmd FileType html inoremap ,mr <mark><CR></mark><CR><CR><++><Esc>?</mark<CR><S-o>
autocmd FileType html inoremap ,n <nav><CR></nav><CR><CR><++><Esc>?</nav<CR><S-o>
autocmd FileType html inoremap ,se <section><CR></section><CR><CR><++><Esc>?</section<CR><S-o>
autocmd FileType html inoremap ,su <summary><CR><summary><CR><CR><++><Esc>?</summary?<CR><S-o>
autocmd FileType html inoremap ,p <p><CR></p><CR><CR><++><Esc>?</p><CR><S-o>
autocmd FileType html inoremap ,b <b></b><Space><++><Esc>?</b><CR>i
autocmd FileType html inoremap ,a <a href=""><++></a><Space><++><Esc>?"<CR>i
autocmd FileType html inoremap ,br <CR></br><CR>
autocmd FileType html inoremap ,em <em><em><Space><++><Esc>?</p><CR>i
autocmd FileType html inoremap ,im <img src="" alt="<++>"><CR><CR><++><Esc>?""<CR>li
autocmd FileType html inoremap ,ol <ol><CR><li></li><CR><++><CR></ol><CR><CR><++><Esc>?</li><CR>i
autocmd FileType html inoremap ,ul <ul><CR><li></li><CR><++><CR></ul><CR><CR><++><Esc>?</li><CR>i
autocmd FileType html inoremap ,li <li></li><CR><++><Esc>?</li><CR>i
autocmd FileType html inoremap ,ta <table><CR><thead><CR><tr><CR><th></th><CR><++><CR></tr><CR></thead><CR><tbody><CR><tr><CR><td><++></td><CR><++><CR></tr><CR></tbody><CR><tfoot><CR><tr><CR><td><++></td><CR><++><CR></tfoot><CR></table><Esc>?</th><CR>i
autocmd FileType html inoremap ,th <th></th><CR><++><Esc>?</th><CR>i
autocmd FileType html inoremap ,td <td></td><CR><++><Esc>?</td><CR>i
autocmd FileType html inoremap ,tr <tr><CR></tr><CR><CR><++><Esc>?</tr><CR>i

" markdown
autocmd FileType markdown noremap <leader>r i---<CR>title:<Space><++><CR>author:<Space>"Brodie Robertson"<CR>geometry:<CR>-<Space>top=30mm<CR>-<Space>left=20mm<CR>-<Space>right=20mm<CR>-<Space>bottom=30mm<CR>header-includes:<Space>\|<CR><Tab>\usepackage{float}<CR>\let\origfigure\figure<CR>\let\endorigfigure\endfigure<CR>\renewenvironment{figure}[1][2]<Space>{<CR><Tab>\expandafter\origfigure\expandafter[H]<CR><BS>}<Space>{<CR><Tab>\endorigfigure<CR><BS>}<CR><BS>---<CR><CR>
autocmd FileType markdown inoremap ,i ![]("<++>")<Space><++><Esc>F]i
autocmd FileType markdown inoremap ,a []("<++>")<Space><++><Esc>F]i
autocmd FileType markdown inoremap ,1 #<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,2 ##<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,3 ###<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,4 ####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,5 #####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,u +<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,o 1.<Space><CR><++><Esc>1k<S-a>

" latex
autocmd FileType tex,latex noremap <leader>d :w<CR>:!texify<Space>-cp<Space>%<CR>
autocmd FileType tex,latex inoremap ,c \{<++>}<CR><++><Esc>?{<CR>i
autocmd FileType tex,latex inoremap ,dc \documentclass{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,up \usepackage{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,bd \begin{document}<CR><CR><CR><CR>\end{document}<Esc>kki
autocmd FileType tex,latex inoremap ,be \begin{}<CR><CR><CR><CR>\end{<++>}<Esc>?n{<CR>lli
autocmd FileType tex,latex inoremap ,ti \title{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,a \author{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,mt \maketitle<CR><CR>
autocmd FileType tex,latex inoremap ,s \section{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,ss \subsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,sss \subsubsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,rc \renewcommand{}{<++>}<CR><CR><++><Esc>?}{<CR>i
autocmd FileType tex,latex inoremap ,tf \titleformat{}{<++>}{<++>}{<++>}{<++>}<CR><CR><++><Esc>?{}<CR>li
autocmd FileType tex,latex inoremap ,lt {\LaTeX}<Space>
autocmd FileType tex,latex inoremap ,b \bfseries
autocmd FileType tex,latex inoremap ,t \tiny
autocmd FileType tex,latex inoremap ,sc \scriptsize
autocmd FileType tex,latex inoremap ,fn \footnotesize
autocmd FileType tex,latex inoremap ,sm \small
autocmd FileType tex,latex inoremap ,l \large
autocmd FileType tex,latex inoremap ,h \huge
