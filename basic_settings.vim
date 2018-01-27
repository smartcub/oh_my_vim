""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" Basic Settings """"""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Rocky Liu
"
" Version:
"       0.1 - Jan/24/2018
" Sections:
"       -> Common Settings
"       -> VIM user interfaces
"       -> Visuals Settings
"       -> Text, tab and indent related
"       -> Visual mode related
"       -> Key mappings
"       -> Status Line
"       -> Spell checking
"       -> Misc
"       -> Build in functions

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Common Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    set nocompatible                	" We want the latest Vim settings/options.
    set shortmess=atI                   " Do not show any tips of helping Uganda children when startup
    syntax enable
    
    
    let mapleader = ','			" The default leader is \, but a period(comma) is much better.
    let g:mapleader = ','               " With map leader it's possible to do extra key combinations.
    
    set number			    	" Let's activate line numbers.
    set linespace=4			" GUI vim specific line-height.
    " Linebreak on 100 characters
    set tw=100                      	" Set the maximum width of text that can be inserted.
    set tabstop=8                      	" Set tabstop to a reasonable value
    set expandtab                       " Set using spaces instead of tabs
    set softtabstop=4                   " Set the width we apply when hitting the tab key in insert mode
    set shiftwidth=4 			" Set the width of indent in normal mode
    "set lines=25 columns=120
    " set autowriteall 			" Automatically write the file when switching buffers.
    set history=1000                    " Set how many lines of history VIM has to remember
    set so=7                            " Set 7 lines to the cursor - when moving vertically using j/k
    set showcmd                         " Show typed command in status bar
    
    if has("eval")
        filetype on                     " Detect file type
        filetype plugin on              " Always ensure enable filetype plugins
        filetype indent on              " Load indent rule for the given filetype
    endif

    "-----------------------Settings for mouse---------------------"
    if exists("&mouse")
        set mouse=a                             " Use mouse in all modes
        set selection=inclusive                 " Include the position of the cursor while selecting text
        set selectmode=mouse,key                

        " Automatically close scratch preview while leaving complete pop-window or insert mode
        set mousemodel=popup                    " Pop up menu while click the auxiliary mouse key
        set listchars=tab:\|\\,trail:.,extends:>,precedes:<,eol:$
        " NOTE: 'autoindent' must be set too
        set formatoptions=tcrqn
        set completeopt=longest,menu
        set complete=.,i
        " Automatically close scratch preview while leaving complete pop-window or insert mode
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    endif
    
    "--------------------------Searching---------------------------"
    set hlsearch
    set incsearch
    
    "----------------------Split Management------------------------"
    set splitbelow
    set splitright

    "----------------------Set foldenable--------------------------"
    if exists('+foldmethod')
        set foldmethod=manual " set fold method to marker
    endif
    if exists('+foldlevel')
        set foldlevel=100     " Dont automatically fold code
    endif
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encodings
" {
    if g:select_supported_lang == 1
        " Avoid garbled charaters in Chinese language windows OS
        let $LANG='zh_CN.UTF-8'
        set langmenu=zh_CN.UTF-8
    else
        let $LANG='en_US'
        set langmenu=en_US
    endif
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " Config encoding format for file opening
    set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,cp936,big5,latin1,euc-jp,euc-kr
    set fileencoding=utf-8

    " Avoid garbled output of the console
    set termencoding=utf-8

    " Tips in Chinese language
    language messages zh_CN.utf-8

    " Help in Chinese languages
    set helplang=cn

    " Use twice the width of ASCII characters
    " NOTE: This option is incompatible with air-line of its left-arrows
    " set ambiwidth=double
" }

    " Turn on the Wild menu
    set wildmenu

" Avoid files when compiling
" {
    " NOTE: If you do debugging with compiled files, plz close it
    " Ignore compiled files
    if 1
        set wildignore=*.o,*~,*.pyc,*.so,*.a,*.obj,*.swp,*.class,*zip,*exe,*dll
        if has("win16") || has("win32")
            set wildignore+=.git\*,.hg\*,.svn\*
        else
            set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
        endif
    endif
" }

" Appearances
"/
"/ Setting of the VIM appearences. Remember put these settings
"/ follow the 'colorscheme' setting, or these will be overwrite!
"/
" {
    " Always show current position
    set ruler
    
    " Force height of the command bar to 1
    set cmdheight=1
    
    " A buffer becomes hidden when it is abandoned
    set hid
    
    " Configure arrow(left/right) keys & backspace so they act as they should act
    set backspace=indent,eol,start 		" Make backspace behave like every other editor.
    set whichwrap+=<,>,h,l                  " Cursor left/right can move to the previous/next line.
    
    " Ignore case while searching
    set ignorecase
    
    " When searching try to be smart about cases
    set smartcase
    
    " Do not redraw while executing macros(good performance config)
    set lazyredraw
    
    " For regular expressions turn magic on
    set magic
    
    " Show matching brackets when text indicator is over them
    set showmatch
    
    " How many tenths of a second to blink when matching brackets
    set mat=2
    
    " No annoying sound on errors
    set noerrorbells visualbell t_vb=	" No damn bells, so turn it OFF!
    set tm=500
    
    " Properly disable sound on errors on MacVim
    if has("gui_macvim")
        autocmd GUIEnter * set vb t_vb=
    endif

    
    
"/
"/ END of VIM appearences
"/
" }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----------------------Visuals Settings------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    if has('gui_running')
        set background=dark
        colorscheme solarized
        set guifont=Fira\ Code\ Light\ 16
    else
        try
        " Use 256 colors. This is useful in Gnome Terminal Vim.
        " NOTE: it's t_Co, NOT t_CO or t_co!!!
        "if $COLORTERM == 'gnome-terminal'
        set t_Co=256
        "endif
    	color molokai
        catch
        endtry
    endif

    " We'll fake a custom left padding for each window
    " NOTE: Should be put below colorscheme settings
    if 1
        hi LineNr guibg=bg
        hi tabline guibg=bg
        hi tabline ctermbg=darkblue
        " hi LineNr ctermbg=LightCyan
        hi LineNr ctermfg=LightCyan
    
        "-----------------Will set the spaces for every line
        " set foldcolumn=1
    
        hi foldcolumn guibg=bg
    
        " Get rid of ugly split borders.
        hi vertsplit guifg=cyan guibg=red
        hi vertsplit ctermfg=cyan ctermbg=red
    endif
    
    " This option specifies when the line with tab page labels will be displayed:
    "    0: never
    "    1: only if there at least two tab pages
    "    2: always
    set showtabline=2
    
    " Setting for macOS, DO NOT open this under other system!
    "set macligatures                         
    
    " We want pretty symbols, when available
    
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=b     " Hidden bottom scrolling bar
    
    " When 'e' is missing a non-GUI tab pages line may be used.
    " This tells vim DO NOT show GUI tabs above, a non-GUI one is OK.
    " NOTE: Advanced Feature
    if has("gui_running")
        set guioptions-=e
        set guitablabel=%N/\ %t\ %M
    " Let's make gvim more comfortable: Toggle Menu & ToolBar by <F11>
        set guioptions-=m
        set guioptions-=T
    endif
    
    " For GUI vim, use <F11> to toggle MenuBar & ToolBar
    " NOTE: Advanced Feature
    map <silent> <F11> :if &guioptions=~#'T'<BAR>
                            \set guioptions-=T<BAR>
                            \set guioptions-=m<BAR>
                        \else<BAR>
                            \set guioptions+=T<BAR>
                            \set guioptions+=m<BAR>
                        \endif<CR>
    	
    
    
    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf-8
    
    "Use Unix as the standard file type
    set ffs=unix,dos,mac
    
    " Highlight current line / current column
    " NOTE: Advanced feature
    if 1
        au WinLeave * set nocursorline nocursorcolumn
        au WinEnter * set cursorline cursorcolumn
        set cursorline cursorcolumn
    endif
" }

" Text, tab and indent related
" {
    " Be smart when using tabs ;)
    set smarttab
    
    " Auto indent / Smart indent / Wrap lines
    " NOTE: Dont wrap lines! It conflict with "set nowrap"
    set ai si "wrap

    set nowrap                          " Dont wrap lines
    set lbr                             " Dont wrap lines inside a word. This option is not used when 'nowarp'
    set autoindent                      " Copy indent for current line when starting a new line
    set smartindent                     " Imply smart indent when starting a new line
    set fo+=mB                          " Turn on supportting of Asian languages at line break

    if has("cindent")
        set cindent                     " C-style indenting
        set cino=:0g0t0(sus             " Auto indent options of C/C++ style, details for :help cinoptions-values
    endif

    if exists('+colorcolumn')
        set colorcolumn=80,120
        hi colorcolumn guibg=lightcyan
        hi colorcolumn ctermbg=lightcyan
    else
        autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    endif
    
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Visual mode press * or # searches for the current selection
    " Super useful! From an idea
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------Files & backup------------------------"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    set nobackup                            " Dont backup when overwriting
    set noswapfile                          " Loading file without creating a swapfile.
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------Key mappings-------------------------"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Smart way to move between split windows
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-H> <C-W><C-H>
    nnoremap <C-L> <C-W><C-L>

    inoremap <C-J> <Down>
    inoremap <C-K> <Up>
    inoremap <C-H> <Left>
    inoremap <C-L> <Right>

    " imap means mapping for insert mode, nmap means mapping for normal mode
    " Make it easy to edit the Vimrc file.
    if 0    " same as else, but command map dont show colors, so I use else instead
        nmap <Leader><Leader>ev :tabedit $MYVIMRC<CR>
        nmap <Leader><Leader>sv :so $MYVIMRC<CR>
        nmap <Leader><Leader>eb :exe "tabnew ".g:cvimrcp."basic_settings.vim"<CR>
    else
        execute "nnoremap <Leader><Leader>ev :tabedit " .$MYVIMRC ."<CR>"
        execute "nnoremap <Leader><Leader>sv :so " .$MYVIMRC ."<CR>"
        execute "nnoremap <Leader><Leader>eb :tabnew ".g:cvimrcp .g:basicFileName ."<CR>"
        execute "nnoremap <Leader><Leader>pl :tabnew ".g:cvimrcp .g:vimPlugInsList ."<CR>"
    endif
    
    " Add simple highlight removal.
    nmap <Leader><Leader><space> :nohlsearch<CR>
    
    " Make NERDTree easier to toggle.
    nmap <silent> wm :NERDTreeToggle<CR>
    
    " Quick search in tags
    nmap <Leader>f :tag<space>
    
    " Hot-key for tag previous(ctags)
    nmap <F6> :tp<CR>
    
    " Hot-key for tag next(ctags)
    nmap <F7> :tn<CR>
    
    " Useful mappings for managing tabs
    map <ESC>to :tabonly<CR>
    map <ESC>tc :tabclose<CR>
    map <ESC>tn :tabnext<CR>
    map <ESC>tp :tabprevious<CR>
    
    " Opens a new tab with the current buffer's path
    " Super usefull when editing files in the same directory
    map <ESC>te :tabedit <c-r>=expand("%:p:h")<CR>/
    
    " Let '<ESC>tl' toggle between this and the Last accessed Tab
    " NOTE: Advanced feature
    let g:lasttab = 1
    nmap <ESC>tl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()
    
    " Switch CWD(current working directory) to the directory of the open path
    " NOTE: also a another way to automatically imply this function, details locate **1
    map <ESC>cd :cd %:p:h<CR>:pwd<CR>
    
    " Eggcache vim
    "nnoremap ; :
    "noremap W w
    "noremap WQ wq
    "noremap Wq wq
    "noremap Q q
    "noremap Qa qa
    "noremap QA qa

    " Mapping for indentLine
    " {
        " Use ',,il' trigger indentLines 
        nmap <Leader><Leader>il :IndentLinesToggle<CR>
    " }
    " Trigger background changing
    " {
        " Use ',,bg' to change background 
        if has("gui_running")
            noremap <silent> <Leader><Leader>bg :call ToggleBG()<CR>
        endif
    " }
    " For vim-easy-align
    " {
        " Start intercative EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)
        " Start intercative EasyAlign for a motion/text object (e.g. vipga)
        nmap ga <Plug>(EasyAlign)
    " }
    " For vim-multiple-cursors
    " {
        " Default mappings
        let g:multi_cursor_next_key='<A-n>'
        let g:multi_cursor_prev_key='<A-p>'
        let g:multi_cursor_skip_key='<A-x>'
        let g:multi_cursor_quit_key='<Esc>'
    " }

" }
" DO NOT open this feature right now!
if 0
" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Most prefer to automatically switch to the current file directory when a 
    " new buffer is opened; to prevent this behavior, add the following to your
    " vim_global_env.vim file: 
    "   let g:rocky_no_autochdir = 1
    " {
        " Enabled by default
        if !exists('g:rocky_no_autochdir')
            " Alway switch to the current file directory
            autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        endif
    " }

    " Clean redundant spaces in the tail of following type of files
    " *.txt/*.js/*.py/*.wiki/*.sh/*.coffee
    " {
        if has("autocmd")
            autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
        endif
    " }
    
    " Return to last edit position when opening files (You want this!)
    " {
        " This one is also working good
        " autocmd BufReadPost *
        "       \ if !exists("g:leave_my_cursor_position_alone") |
        "       \   if line("'\"") > 0 && line("'\"") <= line("$") |
        "       \       exe "normal g'\"" |
        "       \   endif |
        "       \ endif
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
    " }
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Always show the status line
    set laststatus=2
    
    " Format the status line
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" }


" Air-line
" {
    " Basic settings
    " {
        let g:airline_theme = 'molokai'
        let g:airline_powerline_fonts = 1
    " }

    " Tabline
    " {
        " Enable/Disable enhanced tabline.
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_extensions = ['branch', 'tabline']

        " Configure whether buffer numbers should be shown. 
        let g:airline#extensions#tabline#buffer_nr_show = 1

        " enable/disable displaying open splits per tab (only when tabs are opened). 
        let g:airline#extensions#tabline#show_splits = 1

        " configure separators for the tabline only
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        " defines the name of a formatter for how buffer names are displayed.
        let g:airline#extensions#tabline#formatter = 'unique_tail'
    " }

    " Shortcuts for switching buffer
    nnoremap <tab> :bn<CR>
    nnoremap <s-tab> :bp<CR>

    " Enable/Disable detection of whitespace errors.
    let g:airline#extensions#whitespace#enabled = 0
    " Customize the whitespace symbol.
    let g:airline#extensions#whitespace#symbol = '!'

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    
    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''

" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Dnot generate netrw history files. Otherwise it will write
    " .netrwhist in directory ~/.vim/
    let g:netrw_dirhistmax = 0
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Press ,ss will toggle and untoggle spell checking
    map <silent><Leader>ss :setlocal spell!<CR>
    
    " Shortcuts using <Leader>
    map <Leader>sn ]s
    map <Leader>sp [s
    map <Leader>sa zg
    map <Leader>s? z=
" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    " Remove the Windows  - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm
    
    " Toggle paste mode on & off
    map <Leader>pp :setlocal paste!<CR>
" }

"--------------------------Plugins-----------------------------"
"/
"/ CtrlP
"/
" {
    let g:ctrlp_map='<C-p>'
    let g:ctrlp_open_multiple_file='v'
    let g:ctrlp_root_markers=['tags']
    if 1
        let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
    else
        let g:ctrlp_custom_ignore = {
                    \ 'dir':  '{\.git$\|\.hg$\|\.svn$|^\.*}',
                    \ 'file': '{tags|taghl|cscope\.|None}'
                    \ }
    endif
    let g:ctrlp_match_window = 'top,order:btt,min:1,max:30,results:30'
    let g:ctrlp_working_path_mode ='0' "disable work path mode
    
    " Set this to 1 if you want CtrlP to scan for dotfiles and dotdirs:
    " (hidden files or hidden dirs)
    let g:ctrlp_show_hidden = 1
    
    " Should FIXME!!!
    " {
        nmap <C-A-P> :CtrlP<CR>
        nmap <C-A-M> :CtrlPMRU<CR>
        nmap <C-A-B> :CtrlPBufTag<CR>
    " }
" }
"/
"/ End of CtrlP
"/

"/
"/ NERDTree
"/
" {
    " Display hidden files by default
    let NERDTreeShowHidden  = 1

    " Tell the NERD Tree DO NOT replease the netrw autocommands
    " set NERDTreeHijackNetrw to ZERO the we can continue using
    " dash("-") to explore local directories. ^_^
    let NERDTreeHijackNetrw = 0

    " Specify which files the NERD tree should ignore
    let NERDTreeIgnore=[
                \ 'cscope\.','tags','taghl','\.pyc','\~$','\.swp','None',
                \ '\.d','\.o','\.so','\.a','\.map','\.bin','\.elf','\.exe',
                \ '\.\d*\d$','\.git'
                \ ] 
    if has("autocmd")
        " Toggle NERDTree when start vim without loading any file
        autocmd VimEnter * if !argc() | NERDTree | endif
        " Automatically close while leaving NERDTree alone
        autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    endif
" }
"/
"/ End of NERDTree
"/

"/
"/ Greplace.vim
"/
" {
    set grepprg=ag			" We want to use Ag for the search.
    let g:grep_cmd_opts = '--line-numbers --noheading'
" }
"/
"/ END of Greplace.vim
"/

"/
"/ Tagbar
"/
" {
    set tags+=./tags,./*/tags " use currenddir up dir recuit sub dir tag
    if has("gui_running")
        map <silent> <C-F4> :TagbarToggle<CR>
    else
        map <silent> <F4> :TagbarToggle<CR>
    endif
" }
"/
"/ End of Tagbar
"/

"/
"/ Command-T(A tool just like CtrlP)
"/
"NOTE: should FIXME!!!
"NOTE: Removed by Rocky @ Jan 27, 2018
"nmap <C-A-T> :CommandT<CR> 
"/
"/ END of Command-T
"/

"/
"/ Vim-Autoformat
"/
" {
    if executable('astyle')
        nmap <silent> <F5> :Autoformat<CR>
        " set Vim-autoformat in verbose-mode, it will output errors on formatters that failed.
        let g:autoformat_verbosemode=1
        " define code style to allman(more details astyle --help) and insert space padding around operators.
        let g:formatdef_allman = '"astyle --style=allman --pad-oper"'
        " Use allman style for C++
        let g:formatters_cpp = ['allman']
        " Use allman style for C
        let g:formatters_c =['allman']
    endif
" }
"/
"/ END of Vim-Autoformat
"/
"/
"/ A.vim
"/
" {
    let g:alternateSearchPath='sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../../include'
" }
"/
"/ END of A.vim
"/

"/
"/ OmniCppComplete
"/
" {
    " Automatically complete c/c++ codes
    " NOTE: Build the ctags database before use omnicppcomplete
    " To extract C/C++ symbols information, the script needs an ctags database.
    " You have to build your database with at least the following options:
    "   --c++-kinds=+p : Adds prototypes in the database for C/C++ files.
    "   --fields=+iaS  : Adds inheritans (i), access (a) and function
    "                    signature (S) information.
    "   --extra=+q     : Adds context to the tag name. NOTE: Without this
    "                    option, the script cannot get class members.
    " Thus to build recursively a ctags database from the current directory, the
    " command looks like this:
    " >
    "   ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
    " <
    map <C-F12> :!ctags -R --c++-kinds=+p --c-kinds=+p --fields=+iaS --extra=+q .<CR>
    let OmniCpp_MayCompleteDot = 1      " autocomplete with .   
    let OmniCpp_MayCompleteArrow = 1    " autocomplete with ->   
    let OmniCpp_MayCompleteScope = 1    " autocomplete with ::   
    let OmniCpp_SelectFirstItem = 1     " select first popup item (inserting it to the text)
    let OmniCpp_NamespaceSearch = 2     " search namespaces in this and included files   
    let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window   
    let OmniCpp_GlobalScopeSearch=1   
    let OmniCpp_DisplayMode=1   
" }
"/
"/ END of OmniCppComplete
"/

"/
"/ NERDCommenter
"/
" {
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
    " Align line-wise comment delimiters flush left instead of following code
    " indentation
    let g:NERDDefaultAlign = 'left'
    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_c = 1
    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1
" }
"/
"/ END of NERDCommenter
"/

"/
"/ DoxygenToolkit.vim
"/
" {
    map fg : Dox<CR>
    let g:DoxygenToolkit_authorName = 'Rocky Liu'
    let g:DoxygenToolkit_commentType = "C"
    let g:DoxygenToolkit_briefTag_pre = "@brief "
    let g:DoxygenToolkit_templateParamTag_pre= "@<T>Param: "
    let g:DoxygenToolkit_paramTag_pre= "@Param: "
    let g:DoxygenToolkit_returnTag = "@Return: "
    let g:DoxygenToolkit_throwTag_pre = "@Throw: " " @exception is also valid"
    let g:DoxygenToolkit_fileTag = "@File: "
    let g:DoxygenToolkit_dateTag = "@Date: "
    let g:DoxygenToolkit_authorTag = "@Author: "
    let g:DoxygenToolkit_versionTag = "@Ver.: "
    let g:DoxygenToolkit_blockTag = "@Name: "
    let g:DoxygenToolkit_classTag = "@Class: "
    let g:doxygen_enhanced_color = 1
    let g:DoxygenToolkit_blockHeader = "--------------------------------------------------------------------------------" 
    let g:DoxygenToolkit_blockFooter = "--------------------------------------------------------------------------------" 
    let g:DoxygenToolkit_licenseTag = "GNU license"
" }
"/
"/ END of DoxygenToolkit.vim
"/

"/
"/ SrcExpl
"/
" {
    nmap <C-F5> :SrcExplToggle<CR>
    let g:SrcExpl_winHeight = 8
    let g:SrcExpl_refreshTime = 100
    let g:SrcExpl_jumpKey = "<ENTER>"
    let g:SrcExpl_gobackKey = "<SPACE>"
    let g:SrcExpl_searchLocalDef = 1 
    let g:SrcExpl_isUpdateTags = 0 
    let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
    let g:SrcExpl_updateTagsKey = "<C-F11>" 
    let g:SrcExpl_prevDefKey = "<C-3>" 
    let g:SrcExpl_nextDefKey = "<C-4>"
    
    let g:SrcExpl_pluginList = [ 
                \ "__Tag_List__", 
                \ "_NERD_tree_", 
                \ "Source_Explorer" 
                \ ] 
" }
"/
"/ END of SrcExpl
"/

"/
"/ My cscope settings
"/
" {
    " Cscope maps
    " {
        nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>
        nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-[>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
    " }
    " Cscope configure
    " {
        if has("cscope")
            set csto=0      " 1 means prioritily use ctags DB, 0 means prioritily use cscope DB
            set cst         " Search both in cscope & tags DB always 
            set csverb      " Show add DB success or fail
            set cscopequickfix=s-,c-,d-,i-,t-,e-    " Use quickfix window exploring the result of cscope 
        endif
    " }

    nmap <C-F10> :call Do_CsTag()<CR>
" }
"/
"/ END of My cscope maps
"/


"/
"/ YankRing
"/
" {
    " Remove conflict shortcut with CtrlP
    nmap <Leader>y :YRShow<CR>
    let g:yankring_replace_n_pkey = '' 
    " Set the following two global varibles will ensure the history is not
    " remembered the next time Vim is started, including NOT create the history
    " file in ~/
    let g:yankring_persist = 0
    let g:yankring_share_between_instances = 0
" }
"/
"/ YankRing
"/

"/
"/ Others
"/
" Sort selected lines in order of shortest to longest during visual mode.
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d \\  -f2-" }'<CR>
"/
"/ END of others
"/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Build in functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {
    function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
    endfunction

    " Visual Selection
    function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"
    
        let l:pattern = escape(@", "\\/.*'$^~[]")
        let l:pattern = substitute(l:pattern, "\n$", "", "")
    
        if a:direction == 'gv'
            call CmdLine("Ack '" . l:pattern . "' " )
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        endif
    
        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction
    
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        endif
        return ''
    endfunction

    " Delete trailing white space on save, useful for some filetypes ;)
    function! CleanExtraSpaces()
        let save_cursor = getpos('.')
        let old_query = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfunction

    " Estimate current Operating System
    function! MySys()
        if has("unix")
            return "unix"
        elseif has("mac")
            return "mac"
        else
            return "win32"
        endif
    endfunction

    " Allow to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction

    function! Do_CsTag()
        if( MySys() != "win32" )
            " Delete ctags DB and recreate it
            if filereadable("tags")
                silent! execute "!rm -rf tags"
            endif
            silent! execute "!ctags -R --fields=+iaS --extra=+q --c-kinds=+p --c++-kinds=+p"
            if(executable('cscope') && has("cscope") )
                if filereadable("cscope.out")
                    silent! execute "cs kill cscope.out"
                endif
                silent! execute "!rm -rf cscope.out ncscope.out cscope.files"
                silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp'  -o -name '*.s' > cscope.files"
                silent! execute "!cscope -Rbq"
            endif
        else
            silent! execute "!del /f/q tags"
            silent! execute "!ctags -R --fields=+iaS --extra=+q --c-kinds=+p --c++-kinds=+p"
            if(executable('cscope') && has("cscope") )
                if filereadable("cscope.out")
                    silent! execute "cs kill cscope.out"
                endif
                silent! execute "!del /f/q cscope.out ncscope.out cscope.files"
                silent! execute "!dir /s/b *.c,*.cpp,*.h,*.s > cscope.files"
                silent! execute "!cscope -Rbq"
            endif
        endif
    
        if filereadable("cscope.out")
            silent! execute "cs add cscope.out"
            echo "Add cscope"
        endif
        " Should redraw the whole window other wise it will make some confusion
        " of the display while using terminal-vim.
        silent! execute "redraw!"
    endfunction

    function! Ctags_add()
        if(executable('ctags'))
            if filereadable("tags")
                silent! execute "!rm -rf tags"
            endif
            silent! execute "!ctags -R"
            echo "Generate tags!"
            if filereadable("tags")
                silent! execute "set tags=tags"
                echo "Add tags!"
            else
                echohl WarningMSG | echo "Fail to add tags!" | echohl None
            endif
        endif
    endfunction
    
    function! Cs_add()
        if(executable('cscope'))
            if filereadable("cscope.out")
                silent! execute "!rm -rf cscope.*"
            endif
            silent! execute "!cscope -Rbq"
            echo "Generate cscope!"
            if filereadable("cscope.out")
                silent! execute "cs add cscope.out"
                echo "Add cscope!"
            else
                echohl WarningMSG | echo "Fail to add cscope.out!" | echohl None
            endif
        endif
    endfunction
" }
