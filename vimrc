set nocompatible
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" set runtimepath^=~/.vim/pack/plugins/start/vim-vue/syntax/vue.vim

set background=dark
set packpath=~/.vim/
