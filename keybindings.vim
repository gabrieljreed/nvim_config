" Mappings
let mapleader=" "

nmap <leader>o o<Esc>
nmap <leader>O O<Esc>
nmap <leader>/ :noh<CR>
nmap <leader><CR> i<CR><Esc>

nmap <leader>r ^Da
nmap <leader>d 0D
nmap <leader>p "0p
nmap <leader>P "*p
nnoremap <leader>J J
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
vnoremap <leader>y "+y

nnoremap gl $
nnoremap gh ^
nnoremap gH 0

vnoremap gl $
vnoremap gh ^
vnoremap gH 0

command Q qa!

inoremap <D-c> <Esc>
inoremap jj <Esc>

" Back and forward
nmap <leader>b <c-o>
nmap <leader>n <c-i>

nnoremap n nzz

let g:qs_highlight_on_keys = ["f", "F", "t", "T"]

