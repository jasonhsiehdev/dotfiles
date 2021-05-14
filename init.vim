syntax on                       " enables syntax highlighting
filetype plugin on

set title
set path+=**                    " searches current directory recursively.
set nocompatible                " necessary for several cool vim things
set tabstop=4 softtabstop=4     " sets tabs equal to 4 spaces
set shiftwidth=4                " sets shift width to 4 spaces
set expandtab                   " converts tabs to spaces
set smartindent                 " attempts to properly indent
set showcmd                     " shows current command
set showmode                    " shows current mode
set number                      " shows line numbers
set relativenumber              " shows line numbers relative to the cursor position
set nowrap                      " does not allow lines to wrap
set ignorecase                  " ignores case when searching
set smartcase                   " turns on case sensitive search when letters are capitalized
set incsearch                   " sets incremental search
set scrolloff=8                 " starts scrolling the page when cursor is # lines from the bottom
set encoding=utf-8              " encode utf-8
set nohlsearch                  " turns off highlight after enter is pressed when searching
set mouse=a                     " mouse scrolling
set clipboard+=unnamedplus      " sets the clipboard so you can paste stuff from outside vim into vim.
set complete+=kspell            " auto complete with spellcheck
set completeopt=menuone,longest " auto complete menu (It's pretty great)
set splitbelow                  " set split terminal at the bottom

call plug#begin('~/.config/nvim/plugged')   " For plugin start
        
Plug 'vim-airline/vim-airline'              " For vim airline 
Plug 'vim-airline/vim-airline-themes'       " For vim airline theme 
Plug 'nvim-lua/popup.nvim'                  " For files finder 
Plug 'nvim-lua/plenary.nvim'                " For files finder  
Plug 'nvim-telescope/telescope.nvim'        " For files finder
Plug 'vim-utils/vim-man'                    " For vim man help 
Plug 'gruvbox-community/gruvbox'            " For vim theme
Plug 'flazz/vim-colorschemes'               " For vim color  
Plug 'mbbill/undotree'                      " For undotree, <leader>u for show undotree 
Plug 'preservim/nerdcommenter'              " For multiple comment, use <leader>cc for comment, <leader>ci for uncomment
Plug 'preservim/tagbar'                     " For code tag 
Plug 'Valloric/YouCompleteMe'               " For code complete 
Plug 'chazy/cscope_maps'                    " For code navigation
Plug 'lyuts/vim-rtags'                      " For code navigation 
Plug 'tpope/vim-fugitive'                   " For git 
Plug 'plasticboy/vim-markdown'              " For markdown syntax
call plug#end()                             " For plugin end

colorscheme gruvbox                         " For vim theme         

if executable('rg')
    let g:rg_derive_root='true'
endif
 
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'  " For YCM configuration
let g:ycm_confirm_extra_conf = 0                        " For YCM configuration
let g:NERDSpaceDelims = 1                               " For comment space dilims
let mapleader = " "                                     " My leader character

" For page up/down scroll speed
map <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR> 
map <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR> 

" For user shortcut by chenghung
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>u :UndotreeShow<cr>
nnoremap <leader>tt : 5sp term://fish<cr>
nnoremap <leader>a ^
nnoremap <leader>e <END>
nnoremap <leader>dw db
vnoremap <leader>a ^
vnoremap <leader>e <END>

" For telescope files finder shortcut
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" For code navigation shortcut 
nnoremap <silent> <leader>gd :cs find g <C-R>=expand("<cword>")<CR><CR> 
nnoremap <silent> <leader>gi :cs find i <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <leader>gu :cs find c <C-R>=expand("<cword>")<CR><CR> 
nnoremap <silent> <leader>gf :cs find f <C-R>=expand("<cword>")<CR><CR>

" For code navigation back shortcut
nnoremap <C-C> <C-T>               

" For tarbar shortcut
nnoremap <leader>ft :TagbarToggle<cr>  


" Install neovim dependency library 
	" brew install pkg-config starship cmake luarocks ctags
" vim ~/.config/fish/config.fish at the end of file 
	" starship init fish | source
" Install vim plug for neovim
	" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" Create synbolic link between .vimrc and ~/.config/nvim/init.vim
	" cp ~/.vimrc ~/.config/nvim/init.vim
	" ln -s ~/.vimrc ~/.config/nvim/init.vim

" Install latest neovim
	" brew install --HEAD neovim
" .gitignore locally 
    " git update-index --assume-unchanged .gitignore
