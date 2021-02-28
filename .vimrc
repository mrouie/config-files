" colorscheme ron
colorscheme ron

" configure tab width and insert spaces instead of tabs
:set tabstop=4 " tab width is 4 spaces
:set shiftwidth=4 " indent also with 4 spaces
:set expandtab " expand tabs to spaces

" turn synatx highlighting on
"set t_Co=256
syntax on

" use indentation of previous line
set autoindent

" use intelligent indentation (for c, but also works for other langs)
set smartindent

" enables line numbers
set number

" highlights matching braces
set showmatch

" intelligent commenting
set comments=sl:/*,mb:\ *,elx:\ */
