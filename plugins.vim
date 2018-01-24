" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim_runenv/plugged')

" Make sure you use single quotes
"""""""""""""""""""""""""""""""""""
""""""""""General Plugins""""""""""
"""""""""""""""""""""""""""""""""""
" {
    Plug 'tpope/vim-vinegar'
    Plug 'scrooloose/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'rking/ag.vim'
    Plug 'skwp/greplace.vim'
    Plug 'wincent/command-t'
    " Plug 'msanders/snipmate.vim'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'tpope/vim-surround'
    Plug 'ervandew/supertab'
    Plug 'Chiel92/vim-autoformat'
" }

""""""""""""""""""""""""""""""""""""
""""""""""" Easy-using  """"""""""""
""""""""""""""""""""""""""""""""""""
" Tagbar
" {
    Plug 'majutsushi/tagbar'
" }

""""""""""""""""""""""""""""""""""""
""""""""""  Status Bar  """"""""""""
""""""""""""""""""""""""""""""""""""
" Air-line
" {
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
" }
" Fugitive (Git plugin)
" {
    Plug 'tpope/vim-fugitive'
" }


""""""""""""""""""""""""""""""""""""
"""""""""  Color Schemes  """"""""""
""""""""""""""""""""""""""""""""""""
" Molokai
" {
    Plug 'tomasr/molokai'
    let g:molokai_original = 1
    
    " Solarized
    Plug 'altercation/vim-colors-solarized'
    let g:color_name='solarized'
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast='normal'
    let g:solarized_visibility='normal'
" }

" {
    " A basic Library of VIM
    Plug 'vim-scripts/L9'
    " Display the indention lvevls with thin vertical lines
    Plug 'Yggdroot/indentLine'
    let g:indentLine_color_gui = '#303030'
" }

" {
    " A low-contrast VIM color scheme, includes both Dark&light
    Plug 'junegunn/seoul256.vim'
" }

" {
    " Asynchronous Lint Engine
    if v:version >= 800
        Plug 'w0rp/ale'
    endif
" }
" {
    " Automatically align code
    Plug 'junegunn/vim-easy-align'
" }
" {
    " True Sublime Text style multiple selection for Vim
    Plug 'terryma/vim-multiple-cursors'
" }
" {
    " Alternate File quickly(.c --> .h etc)
    Plug 'vim-scripts/a.vim'
" }
" {
    " Temporarily using for code completion
    Plug 'vim-scripts/OmniCppComplete'
" }
" {
    " Code commenter
    Plug 'scrooloose/nerdcommenter'
" }
" {
    " Doxygen
    Plug 'vim-scripts/DoxygenToolkit.vim'
" }
" {
    " Source Insight-like code explorer
    Plug 'vim-scripts/SrcExpl'
" }
" {
    " Visual mark @brian wang
    Plug 'yqking/visualmark'
" }
" {
    " YankRing Maintains a history of previous yanks, changes & deletes.
    Plug 'vim-scripts/YankRing.vim'
" }
" Initialize plugin system
call plug#end()
