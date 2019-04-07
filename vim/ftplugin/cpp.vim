call lexima#add_rule({'char': '<C-h>', 'at': "'\\%#'", 'delete': 1})

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

nmap gd :call rtags#JumpTo(g:SAME_WINDOW)<CR>
nmap gs :call rtags#JumpTo(g:H_SPLIT)<CR>
nmap gx :call rtags#JumpTo(g:V_SPLIT)<CR>
nmap <Leader>gt :call rtags#JumpTo(g:NEW_TAB)<CR>

nmap gf :<C-u>Unite<Space>rtags/references<CR>
noremap <[[> [[?^?s*$<CR>jz<CR>
noremap <]]> /^?s*$<CR>]]?^?s*$<CR>jz<CR>
