" Set , as the leader key
let mapleader=","
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
call plug#begin()
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'build': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim'
"For Denite features
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdtree'
Plug 'tmsvg/pear-tree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zacanger/angr.vim'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'preservim/nerdtree'
Plug 'peitalin/vim-jsx-typescript'
Plug 'godoctor/godoctor.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
"javascript plugins 
Plug 'pangloss/vim-javascript'
" Enable deoplete at startup
Plug 'neoclide/coc.nvim', {'branch':'release','tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc-denite'

Plug 'Quramy/tsuquyomi'
"  let g:deoplete#enable_a!t_startup = 1
" tools for git integration
Plug 'tveskag/nvim-blame-line'

Plug 'tpope/vim-fugitive'
Plug 'chr4/nginx.vim'
call plug#end()

set autowrite
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
set relativenumber

colorscheme angr

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 0 
let g:go_highlight_functions = 0 
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=50
let g:go_auto_sameids = 1
let g:deoplete#sources#go#gocode_binary = '~/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
call deoplete#custom#option('auto_complete_delay', 10)
autocmd FileType go nmap <leader>b  <Plug>(go-build)

" typescript related changes 
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tsuquyomi_completion_detail = 1
let g:typescript_indent_disable = 1
autocmd FileType typescript :set makeprg=tsc
autocmd FileType typescript setlocal completeopt+=menu,preview
let g:javascript_plugin_jsdoc = 1
let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#signature_complete = 1 
let g:nvim_typescript#suggestions_enabled = 1
let g:nvim_typescript#default_mappings = 1

" go to last editing location
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
autocmd FileType json syntax match Comment +\/\/.\+$+

" Scala metal settings 
" " Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
