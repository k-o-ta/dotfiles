call lexima#add_rule({'char': '<C-h>', 'at': "'\\%#'", 'delete': 1})

function! s:clang_format()
  :ClangFormat
endfunction
autocmd BufWrite *.c :call s:clang_format()
