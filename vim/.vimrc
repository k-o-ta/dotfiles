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
set pastetoggle=<F5>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" amount of spaces inerted automatically
set shiftwidth=2

" vim window setting
nnoremap <C-w>o <C-w>w
nnoremap <C-w><C-o> <C-w><C-w>

" file setting
" set hidden
set autoread

" syntax on
" filetype off

autocmd ColorScheme * highlight Search ctermfg=15 ctermbg=21 guifg=wheat guibg=peru

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  " set color thema
  Plug 'tomasr/molokai'
  " remove trailing whitespace
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  " file search
  Plug 'Shougo/vimproc.vim'
  Plug 'bon-chi/unite.vim', { 'branch': 'enable_default_bookmark_name' }
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
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" :let g:org_export_emacs="/usr/local/Cellar/emacs/24.4/Emacs.app/Contents/MacOS/Emacs"

" alias to show nerdtree
nnoremap <Space>n :NERDTreeToggle<CR>
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
let g:deoplete#enable_at_startup = 1

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
" nnoremap <space><space> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

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
" vim command alias
command Bookmark exec("Unite bookmark:" . split(getcwd(), '/')[-1])
command Add UniteBookmarkAdd

" rust language server setting
" TODO move to rust.vim
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ }
" json's duble quote
set conceallevel=0

" md as markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
let g:vim_markdown_new_list_item_indent = 2



" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" denite
call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#var('file_rec', 'command',['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])

" find
" nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR>
nnoremap <space><space> :split<cr> :<C-u>Denite -auto_preview -mode=normal file_rec<cr>
"grep
" カーソル以下の単語をgrep
nnoremap <silent> ;cg :<C-u>DeniteCursorWord -auto_preview -mode=normal grep -buffer-name=search line<CR><C-R><C-W><CR>
" 普通にgrep
nnoremap <silent> ;g :<C-u>Denite -auto_preview -mode=normal -buffer-name=search -mode=normal grep<CR>

