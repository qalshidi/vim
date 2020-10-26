" Mappings
if get(g:, 'loaded_custom_mappings', 0)
  finish
endif
let g:loaded_custom_mappings = 1

" More torelable defaults
nnoremap Y y$
" Escape key is inconvenient
inoremap <nowait> jk <Esc>
inoremap <nowait> kj <Esc>
if exists(':tnoremap')
  tnoremap <nowait> jk <C-\><C-N>
  tnoremap <nowait> kj <C-\><C-N>
endif
nnoremap \ @@

" easily navigate windows
if exists(':tnoremap')
  if has('nvim')
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  else
    tnoremap <C-h> <C-w>h
    tnoremap <C-j> <C-w>j
    tnoremap <C-k> <C-w>k
    tnoremap <C-l> <C-w>l
  endif
endif

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>wh <C-w>H
nnoremap <Leader>wj <C-w>J
nnoremap <Leader>wk <C-w>K
nnoremap <Leader>wl <C-w>L
nnoremap <Leader>wx <C-w>x
nnoremap <Leader>wr <C-w>r

" resize with ctrl
noremap <silent> <C-Up>    :resize +3<CR>
noremap <silent> <C-Down>  :resize -3<CR>
noremap <silent> <C-Left>  :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>

" resize with alt
noremap <silent> <A-k> :resize +3<CR>
noremap <silent> <A-j> :resize -3<CR>
noremap <silent> <A-h> :vertical resize -3<CR>
noremap <silent> <A-l> :vertical resize +3<CR>

" highlighting
nnoremap <silent> n n:set hlsearch<CR>
nnoremap <silent> N N:set hlsearch<CR>
nnoremap <silent> * *N:set hlsearch<CR>
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

" write with sudo
cmap w!! w !sudo -A tee > /dev/null %

" TAB in normal mode will move to text buffer
nnoremap <silent> <Tab> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-Tab> :bprevious<CR>

" jumps
nnoremap ]j <C-I>
nnoremap [j <C-O>
" keyword jump
nnoremap ]i ]<C-I>
nnoremap [i [<C-I>
" definition jump
nnoremap ]D ]<C-D>
nnoremap [D [<C-D>

" misc
nnoremap <Leader>gt :!ctags -R .<CR>
nnoremap <Leader>h :Helptags<CR>

" editing
" For <CR> to work properly
if exists('*complete_info') && has('nvim')
  imap <expr> <CR>  pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
endif
nnoremap <Leader>r *N:set hlsearch<CR>:%s///g<Left><Left>
nnoremap <Leader>R *N:set hlsearch<CR>:silent! argdo! s///g<Left><Left>

" Snippets
inoreabbrev <expr> ;d strftime("%Y-%m-%d")

" LSP
if has('nvim-0.5')
  nnoremap <buffer> <silent> <Leader>ld         <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <buffer> <silent> <Leader>lD         <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <buffer> <silent> <Leader>ll         <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <buffer> <silent> <Leader>li         <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <buffer> <silent> <C-s>              <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <buffer> <silent> <Leader>lt         <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <buffer> <silent> <Leader>lr         <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <buffer> <silent> <F2>               <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <buffer> <silent> <Leader>f          <cmd>lua vim.lsp.buf.formatting()<CR>
  nnoremap <buffer> <silent> <Leader>l0         <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <buffer> <silent> <Leader>lW         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <buffer> <silent> <Leader>le         <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
  nnoremap <buffer> <silent> <Leader>la         <cmd>lua vim.lsp.buf.code_action()<CR>
  inoremap <buffer> <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <buffer> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif
