"encoding to write
set fileencoding=japan
" encoding to read
set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp,ucs-2le,ucs-2

" enable incremental search
set incsearch
" highlights when hit the search word
set hlsearch

" show row number
set number

" prevent auto CR
let g:org_tag_column = 0

" show title on window
set title

" use space when <TAB> is inserted
set expandtab

" enable jump to corresponding end from def
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" enable delete by backspace
set backspace=indent,eol,start

" change spece numbers depending on filetype
" filetype plugin indent on

set smartindent
""""setting for copy and paste"""""""""""""""""""""""""""""""""""""""""""""""" " use clipboard when yank
set clipboard=unnamed,autoselect

" prevent indent when paste
imap <F5> <nop>
set pastetoggle=<F5>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" amount of spaces inerted automatically
set shiftwidth=2

" stop pasting after using x, d, D
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D

" file setting
" set hidden
set autoread

" syntax on
" filetype off

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  " set color thema
  Plug 'tomasr/molokai'
  " remove trailing whitespace
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  " file search
  Plug 'Shougo/vimproc.vim'
  Plug 'Shougo/unite.vim'
  Plug 'rking/ag.vim'

  " caution! can't back by [ESC]
  " Plug 'Townk/vim-autoclose'
  Plug 'cohama/lexima.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'nathanaelkane/vim-indent-guides'
  " Plug 'Shougo/neocomplete.vim'
  Plug 'scrooloose/syntastic'
  Plug 'vim-scripts/taglist.vim'

  Plug 'tpope/vim-fugitive'

  " TODO: enable only filetype using def and end
  Plug 'tpope/vim-endwise'

  " git plugin
  Plug 'airblade/vim-gitgutter'

  " Rust plugin
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'

  " org-mode plugin
  Plug 'tpope/vim-speeddating'
  Plug 'jceb/vim-orgmode'
call plug#end()

" :let g:org_export_emacs="/usr/local/Cellar/emacs/24.4/Emacs.app/Contents/MacOS/Emacs"

let g:rustfmt_autosave = 1

" alias to show nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" alias to ctags
nnoremap <C-]> g<C-]>

" set indent color
let g:indent_guides_enable_on_vim_startup = 1

" sytastic_check
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']

syntax on
colorscheme desert

scriptencoding=utf-8
" $BA^F~%b!<%I;~!"%9%F!<%?%9%i%$%s$N?'$rJQ99(B
" "
" " $B$3$N%U%!%$%k$NFbMF$r$=$N$^$^(B.vimrc$BEy$KDI2C$9$k$+!"(B
" " plugin$B%U%)%k%@$X$3$N%U%!%$%k$r%3%T!<$7$^$9!#(B
" " $BA^F~%b!<%I;~$N?';XDj(B

" change status bar color when insert mode
set laststatus=2
if !exists('g:hi_insert')
  let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellowgui=none ctermfg=blue ctermbg=yellow cterm=none'
endif
if has('syntax')
  augroup InsertHook
  autocmd!
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
    else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" setting of neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_at_startup = 1

" let g:neocomplcache_enable_underbar_completion = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
" nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space><space> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" window resize shortcut
nnoremap sl :vertical resize +5<cr>
nnoremap sh :vertical resize -5<cr>
nnoremap sk :resize -5<cr>
nnoremap sj :resize +5<cr>

" vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray
