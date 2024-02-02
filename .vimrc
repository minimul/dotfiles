set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/vim-easy-align' " horizontal aligning
Plug 'junegunn/seoul256.vim' " Color scheme
Plug 'Raimondi/delimitMate' " Adds auto pairing of ', [, etc.
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'twitvim/twitvim'
Plug 'therubymug/vim-pyte' " Theme
Plug 'will133/vim-dirdiff'
Plug 'tpope/vim-fugitive' " Git blame integration
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish' " Smart case-sensitive search and replace
Plug 'tpope/vim-repeat'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax' " Support for ES6 keywords, operators, etc.
Plug 'sickill/vim-pasta' " Make hashs, arrays, etc aligned nicely when pasting
Plug 'christoomey/vim-run-interactive' " Run command within a full bash env
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-rfactory'
" begin snipmate
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" let g:snipMate = { 'snippet_version' : 1 }
" Plug 'honza/vim-snippets'
" end snipmate
Plug 'Julian/vim-textobj-brace' " edit inside of [] and {}
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user' " create custom text-objects
Plug 'nelstrom/vim-textobj-rubyblock' " easily select ruby constructs
Plug 'HerringtonDarkholme/w3m.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

filetype plugin indent on

runtime macros/matchit.vim " Enable built-in matchit plugin

let mapleader = ","
map <leader>nt :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>nd :NERDTree %<CR>
map <leader>ns :setlocal nospell<CR>
map <leader>ss :setlocal spell<CR>
map <leader>nl :set invnumber<CR>
map <leader>em <C-y>, " Emmit.vim modes
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>np :set nopaste<CR>
map <Leader>vr :rightbelow vnew
map <Leader>vf :rightbelow vnew test/factories/
map <Leader>rf :rightbelow vnew spec/factories/
map <Leader>snrb :rightbelow vnew ~/.vim/snippets/ruby.snippets<CR>
map <Leader>snjs :rightbelow vnew ~/.vim/snippets/javascript.snippets<CR>
map <Leader>snra :rightbelow vnew ~/.vim/snippets/rails.snippets<CR>
map <Leader>snerb :rightbelow vnew ~/.vim/snippets/eruby.snippets<CR>
map <Leader>snsh :rightbelow vnew ~/.vim/snippets/sh.snippets<CR>
map <Leader>wd :set textwidth=78<CR>
map <Leader>ww ggVG<CR> " Visual block the whole page
map <Leader>wv ggVGgq<CR> " Format entire page with textwidth=78
map <Leader>rg :reg<CR>
map <Leader>wq Vapgq<CR>
map <Leader>gr :RunInInteractiveShell ts github-markdown-preview %<CR>
map <Leader>el :w<cr>:call RunCurrentLineInExpressTest()<CR>
map <Leader>et :w<cr>:call RunCurrentExpressTest()<CR>
map <Leader>dt :w<cr>:call RunCurrentTest('RunInInteractiveShell ts spec/dummy/bin/rspec')<CR>
map <Leader>dl :w<cr>:call RunCurrentLineInTest('RunInInteractiveShell ts spec/dummy/bin/rspec')<CR>
map <Leader>st :w<cr>:call RunCurrentTest('RunInInteractiveShell ts bin/rspec')<CR>
map <Leader>sl :w<cr>:call RunCurrentLineInTest('RunInInteractiveShell ts bin/rspec')<CR>
map <Leader>rb :w<cr>:RunInInteractiveShell ts ruby %<CR>
map <Leader>rt :w<cr>:call RunCurrentTest('RunInInteractiveShell ts be rspec')<CR>
map <Leader>rs :w<cr>:RunInInteractiveShell ts be standardrb %<CR>
map <Leader>sp :RunInInteractiveShell ts spp<CR>
map <Leader>ra :RunInInteractiveShell ts be rake<CR>
map <Leader>rsa :w<cr>:RunInInteractiveShell ts be standardrb<CR>
map <Leader>rsaf :w<cr>:RunInInteractiveShell ts be standardrb --fix<CR>
map <Leader>rsf :w<cr>:RunInInteractiveShell ts be standardrb --fix %<CR>
map <Leader>rj :w<cr>:RunInInteractiveShell ts yarn standard %<CR>
map <Leader>rja :w<cr>:RunInInteractiveShell ts yarn standard<CR>
map <Leader>rjf :w<cr>:RunInInteractiveShell ts yarn standard --fix %<CR>
map <Leader>rjaf :w<cr>:RunInInteractiveShell ts yarn standard --fix<CR>
map <Leader>rst :w<cr>:RunInInteractiveShell rst<CR>
map <Leader>rl :w<cr>:call RunCurrentLineInTest('RunInInteractiveShell ts be rspec')<CR>
map <Leader>rbp :w<cr>:execute '!rbprettier --write %'<CR>
map <Leader>rn :call RenameFile()<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>ee :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>se :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>ve :vnew <C-R>=expand("%:p:h") . '/'<CR>

nnoremap <leader>ri :RunInInteractiveShell<space>

" Twitvim
let twitvim_browser_cmd = 'w3m'
let twitvim_browser_fork = "w3m"

set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/snippets
set rtp-=~/.vim/plugged/vim-snippets " remove from rtp - only use my snippets in ~/.vim/snippets

set ssop-=options  " do not store global and local values in a session" 

" Indenting options
set comments +=fb:*,fb:[-],fb:[+],fb:>>,fb:[1],fb:[2],fb:[3],fb:[4],fb:[5],fb:[6],n::
set fo +=n2

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set noswapfile
set nobackup    " do not keep a backup file, use versions instead
set history=500   " keep 500 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching
set complete+=kspell
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set winheight=999 " new window always opens fully expanded
set ignorecase
set smartcase "overrides ignorecase if uppercase used
set hlsearch
syntax on
set autoread
set number
set scrolljump=5
set scrolloff=3
set nofoldenable " Say no to code folding...
" let $BASH_ENV = "~/.bash_profile"
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

map <C-h> :nohl<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
nnoremap Y y$ " Make 'Y' consistent with 'C' & 'D'

set wmh=0 " split don't have that xtra line
map <leader>w <c-w>w " Switch/toggle between split windows
map <leader>h <c-w>h<c-w><cr> " Go to left vertical split
map <leader>l <c-w>l<c-w><cr> " Go to right vertical split

map <S-j> <C-W>j<C-W>_ " Map up and down to horizontal split
map <S-k> <C-W>k<C-W>_

map <S-l> gt " remap the tab movement
map <S-h> gT
let g:lasttab = 1 " ---- Toggle between the last two active tabs
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" ---- Show tab number on the tabline
if exists("+showtabline") 
     function! MyTabLine() 
         let s = '' 
         let t = tabpagenr() 
         let i = 1 
         while i <= tabpagenr('$') 
             let buflist = tabpagebuflist(i) 
             let winnr = tabpagewinnr(i) 
             let s .= '%' . i . 'T' 
             let s .= (i == t ? '%1*' : '%2*') 
             let s .= ' ' 
             let s .= i . ')' 
             "let s .= winnr . '/' . tabpagewinnr(i,'$') 
             let s .= ' %*' 
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#') 
             let file = bufname(buflist[winnr - 1]) 
             let file = fnamemodify(file, ':p:t') 
             if file == '' 
                 let file = '[No Name]' 
             endif 
             let s .= file 
             let i = i + 1 
         endwhile 
         let s .= '%T%#TabLineFill#%=' 
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X') 
         return s 
     endfunction 
     set stal=2 
     set tabline=%!MyTabLine() 
endif 


vmap <leader><Bar> :EasyAlign*<Bar><Enter> " Align GitHub-flavored Markdown tables
map Q gq

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Relpath(filename)
  let cwd = getcwd()
  let s = substitute(a:filename, l:cwd . "/" , "", "")
  return s
endfunction

function! RunCurrentExpressTest()
  exec 'RunInInteractiveShell ts ./bin/run ' . Relpath(expand("%:p"))
endfunction

function! RunCurrentLineInExpressTest()
  let ln = line(".")
  exec 'RunInInteractiveShell ts ./bin/run ' . Relpath(expand("%:p")) . ':' . ln
endfunction

function! RunCurrentTest(rspec_type)
  let in_test_file = match(expand("%"), '\(_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '_test\.rb$') != -1
      call SetTestRunner("RunInInteractiveShell ts bin/rails test")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner(a:rspec_type)
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner(a:rspec_type)
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest(rspec_type)
  let in_test_file = match(expand("%"), '\(_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
    if match(expand('%'), '_test\.rb$') != -1
      call SetTestRunner("RunInInteractiveShell ts bin/rails test")
    else
      call SetTestRunner(a:rspec_type)
    endif
  end

  exec g:bjo_test_runner g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! OpenFactoryFile()
if filereadable("test/factories.rb")
  execute ":sp test/factories.rb"
else
  execute ":sp spec/factories.rb"
end
endfunction

function! s:IsMacOS()
  let os = substitute(system('uname'), '\n', '', '')
  return has("gui_mac") || os ==? 'Darwin'
endfunction

fun! SetTextFile()
  let in_minimul_dir = match(expand("%"), 'www\/minimul\/data') != -1
  if in_minimul_dir
    setlocal textwidth=0
    return
  else
    setlocal textwidth=78
  end
endfun

if s:IsMacOS()
  " Paste from clipboard. Only works on Mac. On Linux use system-copy plugin
  map <Leader>pp :set paste<CR>o<esc>"*]p:set nopaste<CR>:retab<CR>
  " map <Leader>cp :w<CR>exec ':silent !cat % | pbcopy'<CR>
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

"""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile ~/www/minimul/data/*/* set syntax=html
" Inspect the variable on the current line (in Ruby)
autocmd FileType ruby nmap ,i ^"oy$Iputs "<esc>A: #{<esc>"opA"<esc>
autocmd FileType text call SetTextFile() " For all text files set 'textwidth' to 78 characters.
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

function SqlFormatter()
  set noai
  map <Leader>sf :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
endfunction
autocmd FileType sql call SqlFormatter()

" Use Silver Searcher instead of grep
set grepprg=ag
"
" " Get rid of the delay when hitting esc!
set noesckeys

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" let g:seoul256_background = 256
" colo seoul256-light
colo pyte
highlight Search guifg=Black guibg=Red gui=bold
" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow
