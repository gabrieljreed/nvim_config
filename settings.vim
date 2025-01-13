" Vim settings
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
" set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set relativenumber
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set autoread " Automatically reloads the file if it was changed
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim
let g:netrw_liststyle = 3 " Set netrw to use tree style
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set tabstop=4 " Number of spaces that a <Tab> in the file counts for
set softtabstop=4 " Number of spaces that a <Tab> in the file counts for
set expandtab " Converts tabs to spaces
" set smartcase  " Use case-insensitive search on lowercase, otherwise use case-sensitive search

set termguicolors

set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

" Powershell settings
" let &shell = executable('pwsh') ? 'pwsh' : 'powershell'  -- For now, I don't like using the new powershell, I just want the regular one
let &shell = 'powershell'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
let &shellpipe  = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=

let g:qs_highlight_on_keys = ["f", "F", "t", "T"]
