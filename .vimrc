" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

execute pathogen#infect()
let mapleader = ","
map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>f :CommandT<CR>
map <leader>f :CommandT<CR>
" Emmit.vim modes
map <leader>em <C-y>,
"map <leader>t :FufCoverageFile<CR>
" DirDiff settings
let g:DirDiffExcludes = "system,CVS,*.class,*.exe,.*.swp"
let g:DirDiffIgnore = "Id:,Revision:,Date:"
let g:DirDiffAddArgs = "-w"
" Catch the transition to diff mode
au FilterWritePre * if &diff | exe 'noremap <space> ]cz.' | exe 'noremap <S-space> [cz.' | endif
au FilterWritePre * if &diff | exe 'noremap <leader>g :diffget<CR>' | exe 'noremap <leader>p :diffput<CR>' | endif
au FilterWritePre * if &diff | exe 'nmap <leader>u :wincmd l<CR>:normal u<CR>:wincmd h<CR>' | endif
au FilterWritePre * if &diff | exe 'set diffopt=filler,context:1000,iwhite' | exe 'execute "normal \<c-w>\<c-w>"' | endif

set diffexpr=MyDiff()
function MyDiff()
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

" Switch/toggle between the last two files
nnoremap <leader><leader> <c-^>

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set noswapfile
set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set spell
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

map <C-h> :nohl<cr>
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

" ---- Show tab number on the tabline
if exists("+showtabline") 
     function MyTabLine() 
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

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " Highlights the line you are doing input in
  " autocmd InsertLeave * se nocul
  " autocmd InsertEnter * se cul
  au BufWritePost /Users/christian/www/jensen-dev/library/js/cs/*.coffee silent CoffeeMake! -b | cwindow | redraw!
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

color desert
highlight Search guifg=Black guibg=Red gui=bold
