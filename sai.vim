" MIT License. Copyright (c) 2013-2020 Bailey Ling et al.
" vim: et ts=2 sts=2 sw=2 tw=80

scriptencoding utf-8
" For this, the dark.vim, theme, this is defined as
let g:airline#themes#sai#palette = {}


" The sai.vim theme:
let s:airline_a_normal   = [ '#d0d0d0' , '#121212' , 252 , 233 , 'bold' ]
let s:airline_b_normal   = [ '#ffffff' , '#303030' , 255 , 236 ]
let s:airline_c_normal   = [ '#a8a8a8' , '#1c1c1c' , 248  , 234 ] " fg green in normal
let g:airline#themes#sai#palette.normal = airline#themes#generate_color_map
            \(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)

" show light bright green in normal mode if text is modefied
let g:airline#themes#sai#palette.normal_modified = {
      \ 'airline_c': [ '#5fff00' , '#1c1c1c' , 82 , 234 , 'bold' ] ,
      \ }


let s:airline_a_insert = [ '#00af00' , '#121212' , 34  , 233, 'bold'  ]
let s:airline_b_insert = [ '#ffff00' , '#005fff' , 226 , 234  ] " utf-8 is now grey in insert mode
let s:airline_c_insert = [ '#121212' , '#00d700' , 233  , 40  ] " dark golden bg in the start of insert mode

let g:airline#themes#sai#palette.insert = airline#themes#generate_color_map
            \(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)

" Middle bar is very dark while typing in Insert Mode
let g:airline#themes#sai#palette.insert_modified = {
      \ 'airline_c': [ '#ffffff' , '#005f00' , 255     , 22      , ''     ] ,
      \ }
let g:airline#themes#sai#palette.insert_paste = {
      \ 'airline_a': [ s:airline_a_insert[0]   , '#000000' , s:airline_a_insert[2] , 0     , ''     ] ,
      \ }

let g:airline#themes#sai#palette.terminal = airline#themes#generate_color_map
            \(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)

let g:airline#themes#sai#palette.replace = copy(g:airline#themes#sai#palette.insert)
let g:airline#themes#sai#palette.replace.airline_a =
            \[ s:airline_b_insert[0]   , '#af0000' , s:airline_b_insert[2] , 124     , ''     ]

let g:airline#themes#sai#palette.replace_modified = g:airline#themes#sai#palette.insert_modified


let s:airline_a_visual = [ '#000000' , '#5fafd7' , 232 , 74 ]
let s:airline_b_visual = [ '#000000' , '#585858' , 232 , 240 ]
let s:airline_c_visual = [ '#ffffff' , '#121212' , 15  , 233  ]
let g:airline#themes#sai#palette.visual = airline#themes#generate_color_map
            \(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)

let g:airline#themes#sai#palette.visual_modified = {
      \ 'airline_c': [ '#ffffff' , '#121212' , 255     , 233     , ''     ] ,
      \ }


let s:airline_a_inactive = [ '#4e4e4e' , '#1c1c1c' , 239 , 234 , '' ]
let s:airline_b_inactive = [ '#4e4e4e' , '#262626' , 239 , 235 , '' ]
let s:airline_c_inactive = [ '#6c6c6c' , '#1c1c1c' , 242 , 234 , '' ]
let g:airline#themes#sai#palette.inactive = airline#themes#generate_color_map
            \(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)

let g:airline#themes#sai#palette.inactive_modified = {
      \ 'airline_c': [ '#875faf' , '' , 97 , '' , '' ] ,
      \ }

" For commandline mode, we use the colors from normal mode, except the mode
" indicator should be colored differently, e.g. light green
let s:airline_a_commandline = [ '#000000' , '#0cff00' , 16  , 40 ]
let s:airline_b_commandline = [ '#ffffff' , '#444444' , 255 , 238 ]
let s:airline_c_commandline = [ '#9cffd3' , '#202020' , 85  , 234 ]
let g:airline#themes#sai#palette.commandline = airline#themes#generate_color_map
            \(s:airline_a_commandline, s:airline_b_commandline, s:airline_c_commandline)

let g:airline#themes#sai#palette.accents = {
      \ 'green': [ '#5faf00' , '' , 70 , ''  ]
      \ }


" Here we define the color map for ctrlp
if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#sai#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ [ '#d7d7ff' , '#5f00af' , 189 , 55  , ''     ],
        \ [ '#ffffff' , '#875fd7' , 231 , 98  , ''     ],
        \ [ '#5f00af' , '#ffffff' , 55  , 231 , 'bold' ])
endif
