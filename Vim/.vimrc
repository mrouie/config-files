" mrouie's vim config file

" --- Plugins ---
" install pathogen:
"   mkdir -p ~/.vim/autoload ~/.vim/bundle
"   curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
" run pathogen (if installed):
execute pathogen#infect()

" Some good plugins out there:
" (Pathogen) install auto-pairs:
"   git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
" (Pathogen) install ale:
"   git clone https://github.com/dense-analysis/ale.git ~/.vim/bundle/ale
" (Pathogen) install The NERDTree:
"   git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
" (Pathogen) install fugitive:
"   git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
" (Pathogen) install vim-gitgutter:
"   git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter.git
"
"
"" --- Tab Mechanics ---
" configure tab width and insert spaces instead of tabs
set tabstop=4 " tab width is 4 spaces
set shiftwidth=4 " indent also with 4 spaces
set expandtab " expand tabs to spaces

" --- Visuals and Sounds ---
set number " enable line numbers
colorscheme ron " set the color scheme to ron
syntax on " turn syntax highlighting on
set showmatch " highlight matching parentheses, brackets, and braces
set belloff=all " disable all alert bell sounds
setlocal spell spelllang=en " enable spell checking

" --- Indentation Mechanics ---
set autoindent " use indentation of previous line
set smartindent " use vim's intelligent indentation
filetype plugin indent on " load filetype-specific indent files

" --- Comments ---
set comments=sl:/*,mb:\ *,elx:\ */ " setup intelligent c-style commenting

" enable visual autocomplete for command menu
set wildmenu

" vim search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
