" 修改leader键
let mapleader = ','
let g:mapleader = ','

syntax on	                              " 开启语法高亮
colorscheme solarized8_light

set history=2000 					              " history存储容量
set number                              " 显示行号

filetype on                           " 检测文件类型
filetype indent on                    " 针对不同的文件类型采用不同的缩进格式
filetype plugin on                    " 允许插件
filetype plugin indent on             " 启动自动补全

"set cursorcolumn                     " 突出显示当前列
"set cursorline                       " 突出显示当前行

set tabstop=4                               " 设置tab
set shiftwidth=4                            " 设置自动缩进的大小
set expandtab                               " 输入tab时自动将其转化为空格
set showmatch                               " 括号配对情况, 跳转并高亮一下匹配的括号

" 配置缩进
set autoindent
set cindent
set smartindent
set backspace=2                           " 设置macos下删除键
set clipboard=unnamed

" 设置文内智能搜索提示
set hlsearch                              " 高亮search命中的文本
set incsearch                             " 打开增量搜索模式,随着键入即时搜索
set ignorecase                            " 搜索时忽略大小写
set smartcase                             " 有一个或以上大写字母时仍大小写敏感

" 配置快捷键
" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
nmap <leader>t :TagbarToggle<CR>


" YouCompleteMe
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项

" go
" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!
  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" easymotion
" <Leader>m{char} to move to {char}
map  <Leader>m <Plug>(easymotion-bd-f)
nmap <Leader>m <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
