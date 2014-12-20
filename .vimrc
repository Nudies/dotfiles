let g:mapleader =","
filetype plugin on "Enable plugins

"=====Color Settings====="
set t_Co=256 "set 256 color
syntax enable
set background=dark
set cursorline "Highlight current line
hi CursorLine cterm=NONE ctermbg=234
"Set cursorline color

"=====Spacing======"
set expandtab
set autoindent
set smartindent
set tabstop=2 "Number of visiual spaces per TAB
set softtabstop=2 "Number of spaces in tab when editing
set expandtab "Tabs are spaces
set shiftwidth=2

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
set <F4>=[14~

nmap <F1> :call CleanXML()<CR>
nmap <F2> :call RemoveID()<CR>
set pastetoggle=<F3>
nmap <F4> :set wrap! wrap?<CR>

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

" Wrap visual selection in an HTML tag.
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
