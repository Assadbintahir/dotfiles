call plug#begin('~/.vim/plugged')

" neovim themes
Plug 'glepnir/oceanic-material'
Plug 'arcticicestudio/nord-vim'
Plug 'haystackandroid/carbonized'

" TS/JS plugins
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'editorconfig/editorconfig-vim'

" coc plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git', 'coc-emmet', 'coc-css', 'coc-html', 'coc-eslint', 'coc-prettier']

" files hierarchy tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" toggle NERDTree with ctrl-e, similar to vscode
nmap <C-E> :NERDTreeToggle<CR>
" exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |

"   \ quit | endif

" cool icons
Plug 'ryanoasis/vim-devicons'
let g:webdevicons_enable_nerdtree = 1

" neovim status line
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'

" file naviation plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <C-p> :GFiles --cached --others --exclude-standard<cr>

" git flow plugins
" for documentation, view blog https://www.chrisatmachine.com/Neovim/12-git-integration/
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk


" If you like colors instead
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" docker plugin
Plug 'ekalinin/Dockerfile.vim'

" golang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" set number on for all projects
set number
set clipboard+=unnamedplus
set autoindent smartindent

" set theming
" for nord theme, set to nord
" for carbonized theme, set to carbonized-dark
set background=dark " disable this for themes other than oceanic_material
colorscheme oceanic_material


" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" navigating
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
