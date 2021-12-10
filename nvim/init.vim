call plug#begin('~/.vim/plugged')

" ========== start neovim themes ===========
"
Plug 'glepnir/oceanic-material'
Plug 'haystackandroid/carbonized'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"
" ========== end neovim themes ==========

" ========== start TS/JS plugins ==========
"
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'editorconfig/editorconfig-vim'
" 
" ========== end TS/JS plugins ==========

"========== start coc plugins ==========
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver', 'coc-go', 'coc-json', 'coc-git', 'coc-emmet', 'coc-css', 'coc-html', 'coc-eslint', 'coc-prettier']

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" navigating
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" ========== end coc plugins ==========


" ========== start vim specific ==========
"
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" show hidden files by default
let NERDTreeShowHidden=1
" toggle NERDTree with ctrl-e, similar to vscode
nmap <C-E> :NERDTreeToggle<CR>
" exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |

"   \ quit | endif
" auto comment like IDE
Plug 'tpope/vim-commentary'

" tagbar like IDE
Plug 'preservim/tagbar'
nmap <F8> :TagbarToggle<CR>


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
" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

" relative path (src/foo.txt)
nnoremap <leader>crp :let @+ = expand("%")<CR>

" absolute path (/something/src/foo.txt)
nnoremap <leader>cap :let @+ = expand("%:p")<CR>

" filename (foo.txt)
nnoremap <leader>cfn :let @+ = expand("%:t")<CR>
"
" ========== end vim specific ==========

" ========== start git flow plugins ==========
"
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
"
" ========== end git flow plugins ==========

" docker plugin
Plug 'ekalinin/Dockerfile.vim'


" ========== start golang plugins ==========
" 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Use new vim 8.2 popup windows for Go Doc
let g:go_doc_popup_window = 1
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0
" run go imports on file save
let g:go_fmt_command = "goimports"
" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
"syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" running go tests in current file
autocmd BufEnter *.go nmap <leader>r <Plug>(go-run)
autocmd BufEnter *.go nmap <leader>b <Plug>(go-build)
autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
" running current go test only
autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
" Show the function signature for a given routine
autocmd BufEnter *.go nmap <leader>fs  <Plug>(go-info)
" Show the interfaces a type implements
autocmd BufEnter *.go nmap <leader>ti  <Plug>(go-implements)
" Describe the definition of a given type
autocmd BufEnter *.go nmap <leader>td  <Plug>(go-describe)
" See the callers of a given function with
autocmd BufEnter *.go nmap <leader>fc  <Plug>(go-callers)

"
" ========== end golang plugins ==========

" ========== start debug plugins ==========
"
Plug 'puremourning/vimspector'

let g:vimspector_sidebar_width = 40
let g:vimspector_bottombar_height = 14

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
"
" ========== end debug plugins ==========

call plug#end()

" set number on for all projects
set number
set clipboard+=unnamedplus
set autoindent smartindent
syntax enable
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" set theming
" set background=dark " disable this for themes other than solarized & oceanic_material
" let g:oceanic_material_transparent_background=1 only for oceanic_material
" set t_ut= " code dark only
" set t_Co=256 " code dark only
let g:gruvbox_italic=1 " gruvbox only
"following is only for gruvbox
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE 
" let g:material_terminal_italics = 1 " materi theme only
" let g:material_theme_style = 'default' "material theme only
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
" for monokai only
" let g:molokai_original = 1
" let g:rehash256 = 1


" short cut for buffer close
nnoremap <silent> <leader>w :bd <cr>
