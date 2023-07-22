"{{{ -- Vim Plug  --
" ( :source ~/.vimrc ) Reload vimrc file.
" ( :PlugInstall ) to intstall plugins.
" ( :PlugClean ) to uninstall, clean unused plugins.

call plug#begin('~/.vim/plugged/')

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'easymotion/vim-easymotion'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'dense-analysis/ale'
"Plug 'crusoexia/vim-monokai'
"Plug 'Yggdroot/indentLine'

call plug#end() " }}}


"{{{ -- my config -- 

colorscheme onehalfdark
"colorscheme onehalflight
filetype plugin on
syntax on

set nu rnu
set noru
set cursorline

set ttyfast                              "fast terminal for smoother redrawing
set fdm=marker
set timeout timeoutlen=1000 ttimeoutlen=100

set mouse=a
set ttymouse=xterm2
set colorcolumn=80


autocmd BufWinLeave *.* mkview          " auto save Code Folding View on leave
autocmd BufWinEnter *.* silent loadview " auto load Code Folding View on start

autocmd filetype cpp nnoremap <F12> : w <bar> exec '!clear && make %< && ./%<'<CR>
" Compile
"nnoremap <silent> <F7> :<c-u>make %<<cr>
" Execute
"nnoremap <silent> <c-f5> :<c-u>term ./%<<cr>

"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set noexpandtab

"}}}--- my config --- 


"{{{ TabLine   --

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .' '
    let s .= (bufname != '' ? fnamemodify(bufname, ':t'). ' ' : '[No Name] ')
	"let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= ' + ' 
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists("g:tablineclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction
set tabline=%!Tabline()

hi TabLine      ctermfg=250    ctermbg=235 cterm=NONE
hi TabLineFill  ctermfg=250    ctermbg=235 cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=239 cterm=NONE

" }}}
