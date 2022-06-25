call lexima#add_rule({'char': '<C-h>', 'at': "'\\%#'", 'delete': 1})
"
" Because of command name conflict 'ClanFormat', I stop using vim-clang's ClangFormat, which run clang-format without style=file option
" I can also use vim-clang's ClangFormat using option style=file, but I use vim-clang-format, because I'd like to use another use full function of vim-clan-format
" If I stop using vim-clang-format, I can remove this odd setting.
let g:clang_enable_format_command = 0
let g:clang_format#detect_style_file = 1
function! s:clang_format()
  if findfile(".clang-format-inhibitter", ".;") == ""
    :ClangFormat
  endif
endfunction

" function! s:clang_format()
"   :ClangFormat
" endfunction
autocmd BufWrite *.c :call s:clang_format()


" disable auto completion for vim-clang
" let g:clang_auto = 0

" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone,preview'
let g:clang_cpp_completeopt = 'menuone,preview'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#force_overwrite_completefunc = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.c =
\ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
