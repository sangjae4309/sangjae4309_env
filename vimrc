" Colors {{{
syntax on " enable syntax processing
colorscheme molokai
" }}}


" Spaces & Tabs {{{
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
" }}}


" UI Config {{{
set number		" show line numbers
set showcmd		" show command in bottom bar
set cursorline		" highlight current line
" }}}


" Searching {{{
set hlsearch   " highlight searches
set incsearch  " incremental searching
set ignorecase " searches are case insensitive
set smartcase  " unless there is one capital letter
"}}}


" Wild {{{
set wildmode=list:longest
set wildmenu
" }}}


" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' 			" (required) let Vundle manage Vundle

"" --------------- Your Plugin Here ------------------------
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'ervandew/supertab'
"" ---------------------------------------------------------

call vundle#end()
filetype plugin indent on
" }}}

" c++-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
" }}}

" vim-airline {{{
let g:airline_theme='lessnoise'
" }}}



