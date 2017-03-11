" TODO: I don't know why ftplugin isn't loaded automatically
" if needed uncomment out
" :source ~/.vim/plugged/rust.vim/ftplugin/rust.vim

" setting of rustfmt
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
if findfile(".rustfmt-inhibitter", ".;")
  let g:rustfmt_autosave = 0
else
  let g:rustfmt_autosave = 1
endif

" setting of racer
set hidden
let g:racer_cmd = $HOME."/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let $RUST_SRC_PATH="/usr/local/src/rust/src"

setlocal tags=./rusty-tags.vi;/
function! s:rusty_tags()
  if findfile("Cargo.toml", ".;")
    :silent exec "!rusty-tags vi --start-dir=" . expand('%:p:h') . "&" | redraw!
  endif
endfunction
autocmd BufWrite *.rs :call s:rusty_tags()

" setting of lexima not to complete lifetime
call lexima#add_rule({'char': "'", 'input_after': "", 'filetype': 'rust'})

" alias to run rustc
nnoremap <silent><F10>  :RustRun! --cfg local<CR>
nnoremap <silent><F9>  :RustRun<CR>

nmap gd <Plug>(rust-def)
nmap gs <Plug>(rust-def-split)
nmap gx <Plug>(rust-def-vertical)
nmap <leader>gd <Plug>(rust-doc)

