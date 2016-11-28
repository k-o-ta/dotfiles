call lexima#add_rule({'char': '<C-h>', 'at': "'\\%#'", 'delete': 1})

function! s:clang_format()
  let l:lines="all"
  :pyf /usr/local/Cellar/clang-format/2016-08-03/share/clang/clang-format.py
endfunction
autocmd BufWrite *.cpp :call s:clang_format()

if executable("clang++")
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
  let g:quickrun_config = {}
  let g:quickrun_config['cpp/clang++11'] = {
      \ 'cmdopt': '-std=c++11 -stdlib=libc++',
      \ 'type': 'cpp/clang++'
    \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++11'}
endif

