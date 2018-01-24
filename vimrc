"==========================================Notes and Tips=========================================
"
" ------------------------------------------Shortcuts---------------------------------------------
" - Press 'zz' to instantly center the line where the cursor is located.
" - Press <F11> key to toggle menubar & toolbar.
" - Press 'wm' under normal mode to toggle NERDTree.
" - Press <Ctrl><Alt><P> to toggle CtrlP tool.
" - Press <Ctrl><Alt><M> to toggle Most Recently Used files window of CtrlP tool.
" - Press <Ctrl><Alt><B> to toggle the current Buffer or all listed buffers window of CtrlP tool.
" - Press '-' to access the current directory(of current file or current PWD), press '-' twice to
"   access parent directory, and so on.
" - Press ',,sv' to source ~/.vimrc file
" - Press ',,ev' to open ~/.vimrc file in a new tab.
" - Press ',,eb' to open ~/.vim_runenv/vimrcs/basic_settings.vim file
" - Press ',,pl' to open the plugin config list file (mainly for vim-plug)
" - Press ',,<space>' to turn off the highlight(s).
" ---------------------------------------End of Shortcuts-----------------------------------------
"
" -------------------------------------------For Ctags--------------------------------------------
" - Press ',f' to toggle Ctags tool, then input the tag you want to locate.
" - Press <F6> key to goto the previous tag.
" - Press <F7> key to goto the next tag.
" -----------------------------------------end of Ctags-------------------------------------------
"
" - Press <F11> key to toggle MenuBar & ToolBar in normal mode.
" - Press <Ctrl><Alt><T> to toggle Command-T tool.
" - Press ',su' in visual mode(assume you already select at least 2 lines), to sort those select
"   lines in order of shortest to longest.
" - Press <F5> key to auto-format C/C++/C# & Java code in current file with allman style.
"
" ------------------------------For NERDCommenter------------------------------"
" - Press ',cc' Comment out the current line or text selected in visual mode
" - Press ',cb' Comment 
" - Press ',cu' Uncomments the selected line(s)
" ----------------------------END of NERDCommenter-----------------------------"
" - Press '<Ctrl><F4>' to toggle Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim_runenv
source ~/.vim_runenv/vimrcs/plugins.vim

" Include all VIM Global Environment Variables
source ~/.vim_runenv/vimrcs/vim_global_env.vim

" To source ~/.vim_runenv/vimrcs/basic_settings.vim
exe "source " .g:cvimrcp .g:basicFileName

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------Auto-Commands------------------------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: Reserve this auto resource command here!
" Automatically source the Vimrc file on save.
augroup autosourcing
	" Remove all autosourcing auto-commands
	autocmd!	
	autocmd BufWritePost .vimrc source %
augroup END
"----------------------PlugIns Management----------------------
