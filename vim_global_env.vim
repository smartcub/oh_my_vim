"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""   For Global Variable   """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Directories
" {
    " Chief vim scripts directory
    let g:cvimrcp="~/.vim_runenv/vimrcs/"
    " Chief vim plugins directory
    let g:cpluginsp='~/.vim_runenv/'
" }

" For Files
" {
    " Basic settings file
    let g:basicFileName="basic_settings.vim"
    " Location of Plugins Config file
    let g:vimPlugInsList="plugins.vim"
" }

" For language support settings
" {
"   " set g:select_supported_lang to 1 for zh_CN, 0 for en_US
    let g:select_supported_lang = 1
" }

" Toggles for some extra-function
" {
    " Automatically switch the current file directory when a new buffer
    " is opened. Set it to 1 to disable it.
    let g:rocky_no_autochdir = 1
" }
