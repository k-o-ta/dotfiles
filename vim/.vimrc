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
set clipboard+=unnamedplus

" prevent indent when paste
imap <F5> <nop>
" set pastetoggle=<F5>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" amount of spaces inerted automatically
set shiftwidth=2

" vim window setting
nnoremap <C-w>o <C-w>w
nnoremap <C-w><C-o> <C-w><C-w>

" file setting
set hidden
set autoread

" syntax on
" filetype off

let g:python3_host_prog = '~/.pyenv/shims/python3'

autocmd ColorScheme * highlight Search ctermfg=15 ctermbg=21 guifg=wheat guibg=peru

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  " set color thema
  Plug 'tomasr/molokai'
  " remove trailing whitespace
  Plug 'bronson/vim-trailing-whitespace'


  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'majutsushi/tagbar'


  " file search
  Plug 'Shougo/vimproc.vim'
  Plug 'Shougo/denite.nvim'
  Plug 'rking/ag.vim'

  " caution! can't back by [ESC]
  " Plug 'Townk/vim-autoclose'
  Plug 'cohama/lexima.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'scrooloose/syntastic'
  Plug 'vim-scripts/taglist.vim'

  " snippete
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'

  Plug 'tpope/vim-fugitive'

  " TODO: enable only filetype using def and end
  " TODO: conflict with vim-endwise
  " Plug 'tpope/vim-endwise'

  " git plugin
  Plug 'airblade/vim-gitgutter'

  " quickrun
  Plug 'thinca/vim-quickrun'

  " clang plugin
  Plug 'rhysd/vim-clang-format'
  Plug 'justmao945/vim-clang'

  Plug 'lyuts/vim-rtags'

  " Rust plugin
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'

  " org-mode plugin
  Plug 'tpope/vim-speeddating'
  Plug 'jceb/vim-orgmode'

  " markdown plugin
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled = 1

  Plug 'ymyzk/vim-copl'

  " language server
  " Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
call plug#end()

" :let g:org_export_emacs="/usr/local/Cellar/emacs/24.4/Emacs.app/Contents/MacOS/Emacs"

" alias to show nerdtree
nnoremap <Space>n :TagbarToggle<CR>:NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='h'

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

" setting of deopelete
let g:deoplete#enable_at_startup = 1 " skip vim intro

" let g:neocomplcache_enable_underbar_completion = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" window resize shortcut
nnoremap sl :vertical resize +5<cr>
nnoremap sh :vertical resize -5<cr>
nnoremap sk :resize -5<cr>
nnoremap sj :resize +5<cr>

" leader key
let mapleader = "\<Space>"

" vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray

""""setting for lexima.vim""""""""""""""""""""""""""""""""""""""""""""""""
call lexima#add_rule({'char': '<C-h>', 'at': '(\%#)', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '(\%#)', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '{\%#}', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '\[\%#\]', 'delete': 1})

call lexima#add_rule({'char': '<C-h>', 'at': '"\%#"', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '"""\%#"""""""', 'input': '<C-h><C-h><C-h>', 'delete': 3})
call lexima#add_rule({'char': '<C-h>', 'at': "'''\\%#'''''''", 'input': '<C-h><C-h><C-h>', 'delete': 3})
call lexima#add_rule({'char': '<C-h>', 'at': '`\%#`', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '```\%#```````', 'input': '<C-h><C-h><C-h>', 'delete': 3})

call lexima#add_rule({'char': '<C-h>', 'at': '( \%# )', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '{ \%# }', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '\[ \%# ]', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '"\%#"', 'delete': 1})
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""setting for snippet""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/snippets/,~/.vim/snippets'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" os depending setting
if has('unix')
  runtime! userautoload/*.vim
endif

" bookmark setting
let g:default_bookmark_name = split(getcwd(), '/')[-1]

set wildmode=longest:full,full

" rust language server setting
" TODO move to rust.vim
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
" json's duble quote
set conceallevel=0

" md as markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
let g:vim_markdown_new_list_item_indent = 2

" denite
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
endfunction

call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#var('file/rec', 'command',['rg', '--files', '--glob', '!.git', '--color', 'never'])

call denite#custom#var('grep', {
	\ 'command': ['rg'],
	\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
	\ 'recursive_opts': [],
	\ 'pattern_opt': ['--regexp'],
	\ 'separator': ['--'],
	\ 'final_opts': [],
	\ })

call denite#custom#option('search', {
      \ 'auto_action': 'preview',
      \ 'vertical_preview': v:true,
      \ 'preview_width': float2nr(&columns * 0.4),
      \ })

" find
" nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR>
nnoremap <space><space> :split<cr> :<C-u>Denite -start-filter file/rec<cr>
"grep
" カーソル以下の単語をgrep
nnoremap <silent> ;cg :<C-u>DeniteCursorWord grep -buffer-name=search<CR>
" 普通にgrep
nnoremap <silent> ;g :<C-u>Denite grep -buffer-name=search<CR>
" grep検索結果の再呼出
nnoremap <silent> ;r  :<C-u>Denite -resume -buffer-name=search<CR>

