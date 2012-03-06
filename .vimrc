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

let mapleader = ","
map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
"map <leader>f :FufFile<CR>
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

" Switch between the last two files
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
set autoindent
set winheight=999 " new window always opens fully expanded
set ignorecase
set smartcase "overrides ignorecase if uppercase used
" set nohlsearch
syntax on
set autoread
set number
set scrolljump=5
set scrolloff=3
map <S-j> <C-W>j<C-W>_
map <S-k> <C-W>k<C-W>_
" remap the tab movement
map <S-l> gt
map <S-h> gT
" For Win32 Ctrl-y gets remapped to Ctrl-r (redo) Don't want that -- need to edit mswin.vim
set wmh=0 " split don't have that xtra line
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
