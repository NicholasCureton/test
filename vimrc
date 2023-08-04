"{{{ | Vim Plug |
" ( :source ~/.vimrc ) Reload vimrc file.
" ( :PlugInstall ) to intstall plugins.
" ( :PlugClean ) to uninstall, clean unused plugins.

call plug#begin('~/.vim/plugged/')

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'bfrg/vim-cpp-modern'
Plug 'pangloss/vim-javascript'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'


Plug 'dense-analysis/ale' 
" I'm using ale for linting and autocompletion for now.
" Vim built-in autocompletion
" :h ins-completion
" Install Clangd on ubuntu 
" After <C-x>
" <Ctrl + ]>: Tags file completion
" <Ctrl + d>: Definition completion
" <Ctrl + f>: Filename completion (based on files in $PWD)
" <Ctrl + i>: Path pattern completion
" <Ctrl + k>: Dictionary completion
" <Ctrl + l>: Whole line completion
" <Ctrl + n>: Keyword local completion
" <Ctrl + o>: Omni completion completion
" <Ctrl + v>: Command line completion

call plug#end() " }}}


"{{{ | my config |

colorscheme onehalfdark
"colorscheme onehalflight
filetype plugin on
syntax on
syntax enable
set omnifunc=syntaxcomplete#Complete

set nu rnu
set noru
set cursorline
set colorcolumn=80

set ttyfast                              "fast terminal for smoother redrawing
set fdm=marker
set timeout timeoutlen=1000 ttimeoutlen=100

set mouse=a
set ttymouse=xterm2


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


" | Plugin Related configs |{{{  

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight     = 1 "vim-cpp_member_highlight plugin
let g:cpp_function_highlight   = 1
let g:cpp_attributes_highlight = 1
let g:cpp_simple_highlight = 1

let g:ale_completion_enabled        = 1
set completeopt=menu,popup
let g:ale_hover_to_floating_preview = 1
let g:ale_popup_menu_enabled        = 1

let g:ale_lint_on_text_changed      = 'never'
let g:ale_lint_on_insert_leave      = 0
let g:ale_lint_on_enter             = 0

"let g:ale_c_parse_makefile          = 1
"let g:ale_c_parse_compile_commands  = 1


"--- }}}


"{{{ | TabLine |

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
