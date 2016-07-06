" TODO: I don't know why ftplugin isn't loaded automatically
:source ~/.vim/plugged/rust.vim/ftplugin/rust.vim
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

" setting of racer
set hidden
" let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_cmd = "/Users/koji/.cargo/bin/racer"
let $RUST_SRC_PATH="/usr/local/src/rustc-1.5.0/src"

setlocal tags=./rusty-tags.vi;/
" TODO: disable when there is no Cargo.toml
autocmd BufWrite *.rs :silent exec "!rusty-tags vi --start-dir=" . expand('%:p:h') . "&" | redraw!

" alias to run rustc
nnoremap <silent><F10>  :RustRun<CR>
