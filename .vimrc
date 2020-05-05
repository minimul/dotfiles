" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

execute pathogen#infect()

" Enable built-in matchit plugin
runtime macros/matchit.vim

let mapleader = ","
map <leader>nt :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>nd :NERDTree %<CR>
map <leader>ns :setlocal nospell<CR>
map <leader>ss :setlocal spell<CR>
map <leader>nl :set invnumber<CR>
map <Leader>fc :call OpenFactoryFile()<CR>
map <leader>em <C-y>, " Emmit.vim modes
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>sp :set paste<CR>
map <Leader>np :set nopaste<CR>
map <Leader>vr :rightbelow vnew
map <Leader>snru :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<CR>
map <Leader>snjs :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/javascript/javascript.snippets<CR>
map <Leader>snra :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/rails.snippets<CR>
map <Leader>snhtml :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/html.snippets<CR>
map <Leader>snerb :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/eruby.snippets<CR>
map <Leader>snsh :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/sh.snippets<CR>
map <Leader>wd :set textwidth=78<CR>
map <Leader>ww ggVG<CR> " Visual block the whole page
map <Leader>wv ggVGgq<CR> " Format entire page with textwidth=78
map <Leader>cp :w<cr>:call CopyToOSClipboard()<CR>
map <Leader>rg :reg<CR>
map <Leader>wq Vapgq<CR>
map <Leader>gr :!ts github-markdown-preview %<CR>
map <Leader>el :w<cr>:call RunCurrentLineInExpressTest()<CR>
map <Leader>et :w<cr>:call RunCurrentExpressTest()<CR>
map <Leader>dt :w<cr>:call RunCurrentTest('!ts spec/dummy/bin/rspec')<CR>
map <Leader>dl :w<cr>:call RunCurrentLineInTest('!ts spec/dummy/bin/rspec')<CR>
map <Leader>st :w<cr>:call RunCurrentTest('!ts bin/rspec')<CR>
map <Leader>sl :w<cr>:call RunCurrentLineInTest('!ts bin/rspec')<CR>
map <Leader>rb :w<cr>:!ts ruby %<CR>
map <Leader>rt :w<cr>:call RunCurrentTest('!ts be rspec')<CR>
map <Leader>rl :w<cr>:call RunCurrentLineInTest('!ts be rspec')<CR>
map <Leader>rn :call RenameFile()<cr>
" Paste from clipboard
map <Leader>pp :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>ee :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>se :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>ve :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Twitvim
let twitvim_browser_cmd = "open"

" DirDiff settings
let g:DirDiffExcludes = "system,CVS,*.class,*.exe,.*.swp"
let g:DirDiffIgnore = 'Id:,Revision:,Date:,File:,\\\$Id'
let g:DirDiffAddArgs = "-w"
" Catch the transition to diff mode
au FilterWritePre * if &diff | exe 'noremap <space> ]cz.' | exe 'noremap <S-space> [cz.' | endif
au FilterWritePre * if &diff | exe 'noremap <leader>dg :diffget<CR>' | exe 'noremap <leader>dp :diffput<CR>' | endif
au FilterWritePre * if &diff | exe 'nmap <leader>du :wincmd l<CR>:normal u<CR>:wincmd h<CR>' | endif
au FilterWritePre * if &diff | exe 'set diffopt=filler,context:1000,iwhite' | exe 'execute "normal \<c-w>\<c-w>"' | endif

set rtp+=/usr/local/opt/fzf

set ssop-=options  " do not store global and local values in a session" 
set diffexpr=MyDiff()
function! MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "--ignore-all-space "
   endif
   silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
    \  " > " . v:fname_out
endfunction
" End DirDiff settings
" Indenting options
set comments +=fb:*,fb:[-],fb:[+],fb:>>,fb:[1],fb:[2],fb:[3],fb:[4],fb:[5],fb:[6],n::
set fo +=n2
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set noswapfile
set nobackup		" do not keep a backup file, use versions instead
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set complete+=kspell
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set winheight=999 " new window always opens fully expanded
set ignorecase
set smartcase "overrides ignorecase if uppercase used
" set nohlsearch
set hlsearch
syntax on
set autoread
set number
set scrolljump=5
set scrolloff=3
set nofoldenable " Say no to code folding...
let $BASH_ENV = "~/.bash_profile"
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

map <C-h> :nohl<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" Make 'Y' consistent with 'C' & 'D'
nnoremap Y y$

" ----- Window & Tab movement -----
" Switch/toggle between split windows
map <leader>w <c-w>w
" Go to left vertical split
map <leader>h <c-w>h<c-w><cr>
" Go to right vertical split
map <leader>l <c-w>l<c-w><cr>
" Map up and down to horizontal split
map <S-j> <C-W>j<C-W>_
map <S-k> <C-W>k<C-W>_
" remap the tab movement
map <S-l> gt
map <S-h> gT
" For Win32 Ctrl-y gets remapped to Ctrl-r (redo) Don't want that -- need to edit mswin.vim
set wmh=0 " split don't have that xtra line
" ---- Toggle between the last two active tabs
let g:lasttab = 1
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Align GitHub-flavored Markdown tables
" au FileType markdown,md 
vmap <leader><Bar> :EasyAlign*<Bar><Enter>

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
  exec '!ts ./bin/run ' . Relpath(expand("%:p"))
endfunction

function! RunCurrentLineInExpressTest()
  let ln = line(".")
  exec '!ts ./bin/run ' . Relpath(expand("%:p")) . ':' . ln
endfunction

function! RunCurrentTest(rspec_type)
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  :echo in_test_file
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bin/cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_test\.rb$') != -1
      call SetTestRunner("!ts bin/rails test")
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
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
    if match(expand('%'), '_test\.rb$') != -1
      call SetTestRunner("!ts bin/rails test")
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

function! CopyToOSClipboard()
  exec(":silent !cat % | pbcopy")
  :redraw!
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

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " au FileType javascript call JavaScriptFold()

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd BufRead,BufNewFile ~/www/minimul/data/*/* set syntax=html
  autocmd FileType text call SetTextFile()
  " Highlights the line you are doing input in
  " autocmd InsertLeave * se nocul
  " autocmd InsertEnter * se cul
  autocmd BufRead,BufNewFile *.md setlocal spell
  au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null " type gg=G to pretty print xml
  " autocmd FileType javascript setlocal expandtab shiftwidth=4 softtabstop=4
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

endif " has("autocmd")

" Use Silver Searcher instead of grep
set grepprg=ag
"
" " Get rid of the delay when hitting esc!
set noesckeys

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

"set background=light
"color desert
colorscheme pyte
highlight Search guifg=Black guibg=Red gui=bold
" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow
