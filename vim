" [VIM]:[CONFIGURACION]:[Black Reaper - Fedeya]

" 1) Plugins
" 2) Opciones de alineado
" 3) Opciones de archivos
" 4) Opciones visuales
" 5) Autocompletado inteligente
" 6) Definicion de atajos

" 1 --------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
    Plug 'joshdick/onedark.vim'             " Esquema de color One Dark Pro
    
    Plug 'jiangmiao/auto-pairs'             " Cerrado de llaves, parentecis...
    Plug 'mattn/emmet-vim'                  " Abrevieturas html
    Plug 'scrooloose/nerdtree'              " Arbol de directorios
    Plug 'itchyny/lightline.vim'            " Barra personalizada
    Plug 'majutsushi/tagbar'                " Arbol de elementos 
    Plug 'Yggdroot/indentLine'              " Lineas guia para alineacion

    Plug 'posva/vim-vue'                    " Mejoras para Vue.js
    Plug 'jelera/vim-javascript-syntax'     " Mejoras para JavaScript
    Plug 'justinmk/vim-syntax-extra'        " Mejoras para C/C++
    Plug 'plasticboy/vim-markdown'          " Modo Markdown
    Plug 'tpope/vim-speeddating'            " Dependencia para Org mode
    Plug 'jceb/vim-orgmode'                 " Modo Org 
call plug#end()
    
" 2 --------------------------------------------------------------------------

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" 3 -------------------------------------------------------------------------- 
set noswapfile
set nobackup
set encoding=utf-8
set backspace=indent,eol,start

set hidden
set nowrap
set showmatch
set noshowmode

" 4 --------------------------------------------------------------------------

set nu
set relativenumber
set cursorline

set background=dark
set termguicolors

let g:tagbar_ctags_bin='~\.vim\ctags.exe'
let g:NERDTreeQuitOnOpen = 1

set laststatus=2

color onedark

let g:lightline = {
\  'colorscheme': 'onedark',
\ }


" 5 --------------------------------------------------------------------------

function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction

" 6 --------------------------------------------------------------------------

inoremap <Tab>      <C-R>=Tab_Or_Complete()<CR>
nnoremap <Tab>      :bn<CR>
nnoremap <S-Tab>    :bp<CR>
nnoremap <F2>       :NERDTreeToggle<CR>
nnoremap <F8>       :TagbarOpen<CR><C-w>l
