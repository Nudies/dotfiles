execute pathogen#infect()
let g:mapleader =","
filetype plugin indent on "Enable plugins

"=====Plugin KeyMaps====="
nmap <leader>n :NERDTreeToggle<CR>

"=====Color Settings====="
set t_Co=256 "set 256 color
syntax enable
set background=dark
set cursorline "Highlight current line
hi CursorLine cterm=NONE ctermbg=16
"Set cursorline color
set background=dark
"=====Spacing======"
set autoindent
set smartindent
set tabstop=4 "Number of visiual spaces per TAB
set shiftwidth=4

"======Mouse======"
set ttymouse=xterm2
set mouse=a "Allow mouse for highlighting and moving cursor
set ww+=<,>h,l

"======UI Config======="
set number "Show line numbers
set showcmd "Show command in bottom bar
set wildmenu "Visual autocomplete for command menu
set wildmode=full "Enable menu gui
set showmatch "Highigh matching [{()}]
set title "Show filename in title bar
set nowrap "Wraps the line

"======Searching======"
set incsearch "Increment search
set hlsearch "Highlight search results
set ignorecase "Case insensitive
nnoremap <silent> <C-l> :nohl<CR><C-l>
"removes hightlighted searches with ctrl+l

"======Movement======"
set scrolloff=5 "Set scrolloff line number

"=====Functions====="
"Fixes problems with F keys
set <F1>=[11~
set <F2>=[12~
set <F3>=[13~
"set <F3>=^[OR"
set <F4>=[14~
nmap <F1> :call CleanXML()<CR>
nmap <F2> :call RemoveID()<CR>
set pastetoggle=<F3>
nmap <F4> :set wrap! wrap?<CR>
nmap <F5> :call Tabber(0)<cr>
nmap <F6> :call Tabber(1)<cr>
nmap <F7> :set syntax=xml<cr>
nmap <F8> :set syntax=css<cr>
nmap <F9> :set syntax=javascript<cr>
nmap <F10> :set syntax=python<cr>
nmap <F11> :set syntax=csv<cr>
nmap <F12> :set syntax=html<cr>
nmap <C-n> :tabnext<cr>
nmap <C-p> :tabprev<cr>

function! RemoveID()
"remove id=""
  %s/ id="\w\{5\}"//g
endfunction

function! CleanXML()
"remove xmlns declarations
  1,s/ xmlns:\w\+="[^"]*"//g

"fix survey tag on each line
  1,s/<survey /<survey \r /g
  1,s/" /"\r /g

"add break after suspends
  %s/<suspend id="[^"]*"\/>/<suspend\/>\r/g
endfunction

"wrap visual selection in an HTML tag.
vmap <Leader>w <Esc>:call VisualHTMLTagWrap()<CR>
function! VisualHTMLTagWrap()
  let tag = input("Tag to wrap block: ")
  if len(tag) > 0
    normal `>
    if &selection == 'exclusive'
      exe "normal i</".tag.">"
    else
      exe "normal a</".tag.">"
    endif
    normal `<
    exe "normal i<".tag.">"
    normal `<
  endif
endfunction

"increase/decrease tab space
function! Tabber(tab)
  if a:tab
    if &wrap
      set nowrap
    endif
    set ts+=2 ts?
  else
    set ts-=2 ts?
  endif
endfunction

"====Custom Maps===="
"These are found in .vim/ftplugins directory
inoremap { {}<Esc>i
"inoremap [ []<Esc>i
"inoremap ( ()<Esc>i
"inoremap <leader>. <Esc>la
nnoremap <leader>! i<!DOCTYPE html><CR><html lang="en"><CR><head><CR><C-t><meta charset="UTF-8" /><CR><title>Document</title><CR><C-d></head><CR><body><CR><CR></body><CR></html><Esc>kki<C-t>