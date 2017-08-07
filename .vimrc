execute pathogen#infect()

filetype indent plugin on
syntax on

set wildmenu
set hlsearch
set ignorecase
set smartcase
set nowrap

set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set backspace=indent,eol,start
set laststatus=2
set nostartofline

set confirm
set visualbell
set t_vb=

set cmdheight=2

set number
set cursorline
set ruler

set background=dark

if has("gui_running")
  set background=light
  colors mayansmoke
  set guifont=Fantasque_Sans_Mono:h10:cANSI:qDRAFT
  set lines=80
  set columns=140
endif

let mapleader=","
au BufNewFile,BufRead *.cln setlocal ft=baan

" Easy Align
xmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Shortcuts
nnoremap <F3> :set hlsearch!<CR>
vnoremap // y/<C-R>"<CR>

" Abbreviations
ab trace1 #define r.push(lay)<Cr>^<Tab><Tab>r_append_line(1, "", lattr.layout.id$(1), "", REP_TEXT)<Cr>^<Tab><Tab>r_spool_line()<Cr>^<Tab><Tab>orig.r.push(lay)
ab trace2 #undef r.push(lay)<Cr>function orig.r.push(long lay) { r.push(lay) }
ab !+ <Bar>===-------------------~
ab !- ~-------------------===<Bar>

" Statusline
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=\ %f\                          " file name
set statusline+=%-14.(%l,%c%V%)\ %<%P\         " offset
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%=                           " right align
set statusline+=Buf\ %-4.4n\                      " buffer number
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=\ \ \ \ Dr.\ House\ 

" Commands
function! Baan_Cust()
  let date = strftime("%d.%m.%Y")
  call append(line("."), "|* ")
  call append(line("."), "|* ID HD_XYZ999, Daniel Hauser, " . date . " [T0000]")
  :normal! j _ 2w
endfunction

command! Cust call Baan_Cust()
