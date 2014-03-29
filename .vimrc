"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this vimrc is based on the vimrc by amix:
"       http://amix.dk/vim/vimrc.html
" and by easwy yang:
"       http://github.com/easwy/share/tree/master/vim/vimrc/
"
" use vundle to manger the bundle:
"       https://github.com/gmarik/vundle
"
" maintainer:  martin tang
" last change: Mon oct 25 16:04:31 cst 2010
" version:     0.1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Get out of VI's compatible mode
set nocompatible

" Basic configuration
if has("win32")
  " Set _viminfo in the $VIM folder
  set viminfo='100,<50,s10,h,rA:,rB:,n$VIM\\_viminfo
  set guifont=courier_new:h12
else
  set guifont=Monospace\ 11
endif
set history=700
set so=7  " Set 7 lines to the curors when moving vertical..
set number
set autoread
set completeopt=longest,menu  " Enable the omni-completion
set ruler  "Always show current position
set cmdheight=2  "The commandbar height
set hid  "Change buffer - without saving
set backspace=eol,start,indent  " Set backspace config
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch  "Highlight search things
set incsearch  "Make search act like search in modern browsers
set magic  "Set magic on, for regular expressions
set showcmd
set showmatch "Show matching bracets when text indicator is over them
set formatoptions+=mM  "Suit for Chinese text format
set fileformats=unix,dos,mac "Default file types
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set shiftround
set linebreak
set autoindent "Auto indent
set smartindent "Smart indet
set wrap "Wrap lines
set sessionoptions-=curdir
set sessionoptions+=sesdir,slash,unix
set list
set listchars=tab:>-,trail:-
set nobackup
set noswapfile
set nolazyredraw "Don't redraw while executing macros
set wildmenu
set wildignore+=*.o,*.obj,.git,*.pyc
set switchbuf=usetab
set stal=2
set guitablabel=%t
set mat=2 "How many tenths of a second to blink
set tm=500
set tw=500
set vb t_vb=
set laststatus=2  " Always hide the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c  " Format the statusline

if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=0
    set cst
    set csverb
endif

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme peaksea
else
  colorscheme peaksea
  set background=dark
endif

set fileencoding=utf8
"Support Chinese
set encoding=utf8
if has("multi_byte")
  set fileencodings=ucs-bom,utf8,cp936,big5,euc-jp,euc-kr,latin1
  set ambiwidth=double
endif


" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Key mappings to ease browsing long lines
noremap  j           gj
noremap  k           gk
noremap  <Down>      gj
noremap  <Up>        gk
inoremap <Down> <C-O>gj
inoremap <Up>   <C-O>gk

nmap <silent> <leader><cr> :nohlsearch<cr>

map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>

map <leader>pp :setlocal paste!<cr>

" Buffer configuration
map <leader>bb :e ~/buffer<cr>
map <leader>bd :Bclose<cr>
map <leader>ba :1,300 bd!<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

map <leader>cd :cd %:p:h<cr>

map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

nmap <leader>ss :call SaveSession()<cr>
nmap <leader>ls :call LoadSession()<cr>

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

map Q gq
noremap gQ Q

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" Smart mappings on the command line
cnoremap $h e ~/
cnoremap $j e ./
cnoremap $d cs add ~/tags/
cnoremap $t set tags+=~/tags/

map <leader>cc :botright cope<cr>
"map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Fast editing of the .vimrc
if has("win32")
    map <leader>e :e! $VIM/_vimrc<cr>
    autocmd! bufwritepost _vimrc source $VIM/_vimrc
else
    map <leader>e :e! ~/.vimrc<cr>
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" Support man in vim
runtime! ftplugin/man.vim

syntax enable  "Enable syntax hl

" Vundle configuration
filetype off      " required!

if has("win32")
    set runtimepath+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle')
else
    set runtimepath+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'winmanager--Fox'
Bundle 'taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'project.tar.gz'
Bundle 'Shougo/neocomplcache'
Bundle 'msanders/snipmate.vim'
Bundle 'genutils'
Bundle 'lookupfile'
Bundle 'YankRing.vim'
Bundle 'Mark'
Bundle 'Conque-Shell'
Bundle 'mru.vim'
Bundle 'grep.vim'
Bundle 'a.vim'
Bundle 'c.vim'
Bundle 'Command-T'
Bundle 'cscope_macros.vim'
Bundle 'perl-support.vim'
Bundle 'matchit.zip'
Bundle 'txt.vim'
Bundle 'othree/xml.vim'
Bundle 'rkulla/pydiction'
Bundle 'python.vim--Vasiliev'
Bundle 'python_fold'

" Enable filetype plugin
filetype plugin indent on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


"auto sv and ld session
let g:AutoSessionFile="project.vim"
let g:OrigPWD=getcwd()
function! SaveSession()
    exec "mksession! ".g:OrigPWD."/".g:AutoSessionFile
    exec "wviminfo! ".g:OrigPWD."/".g:AutoSessionFile."info"
endfunction

function! LoadSession()
    exec "source ".g:AutoSessionFile
    exec "rviminfo ".g:AutoSessionFile."info"
endfunction

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

if has('win32') || has('win95') || has('win64')
  nmap <leader>tv :ConqueTermSplit cmd <CR>
else
  nmap <leader>tv :ConqueTermSplit bash <CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>


""""""""""""""""""""""""""""""
" => Taglist plugin
""""""""""""""""""""""""""""""
let g:Tlist_Show_One_File=1
let g:Tlist_Exit_OnlyWindow=1


""""""""""""""""""""""""""""""
" => NERDTree plugin
""""""""""""""""""""""""""""""
let g:NERDTree_title='[NERD Tree]'

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

""""""""""""""""""""""""""""""
" => Winmanager plugin
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth=40
"nnoremap <leader>wm :WMToggle<cr> 
nmap <silent> <leader>wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>


""""""""""""""""""""""""""""""
" => A plugin
""""""""""""""""""""""""""""""
nnoremap <silent><F12> :A<cr>

""""""""""""""""""""""""""""""
" => Grep plugin
""""""""""""""""""""""""""""""
nnoremap <silent><F3> :Grep<cr>

""""""""""""""""""""""""""""""
" => Supertab plugin
""""""""""""""""""""""""""""""
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"


""""""""""""""""""""""""""""""
" => YankRing plugin
""""""""""""""""""""""""""""""
nnoremap <silent><F11> :YRShow<cr>
if has("win32")
    let g:yankring_history_dir = '$VIM'
endif
let g:yankring_min_element_length = 2
let g:yankring_window_height = 5
let g:yankring_manage_numbered_reg = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au FileType python call PythonFold()

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

function! PythonFold() 
    setl foldmethod=indent
endfunction

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
if has("win32")
    let MRU_File=$VIM.'\_vim_mru_files'
    let MRU_Exclude_Files = '^c:\\temp\\.*'
else
    let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
endif
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
if has("win32")
"  set grepprg=findstr /S
else
  set grepprg=/bin/grep\ -nH
endif


""""""""""""""""""""""""""""""
" => pydiction
""""""""""""""""""""""""""""""
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================
