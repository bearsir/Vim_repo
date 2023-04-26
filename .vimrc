syntax on
set t_Co=256
set wrap
set ruler
set incsearch

" display relative number
set number
set relativenumber
set numberwidth=3
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" hightlight cursorline
set cursorline
set cursorcolumn
hi cursorcolumn cterm=none ctermbg=237 ctermfg=none
hi Cursor guifg=white guibg=red
let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[1 q"

"use spaces instead of tabs
set shiftwidth=2
set softtabstop=2
set expandtab

" vim package manage

packloadall

" user key map at here
map <F5> i{<Esc>ea}<Esc>

" syntastic setting
if &t_Co > 2 || has("gui_running")
    syntax on
endif
map <Leader>s :SyntasticToggleMode<CR>
map <S-l> :lclose<CR>
map <S-e> :Error<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"---for flake8---
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--config=/Users/hero/.config/flake8/flake8'
"---for yaml---
"let g:syntastic_yaml_checkers = ['yamllint']
"let g:syntastic_yaml_checker_args='--ignore=line-length'
" NerdTree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeWinPos="left"
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" user define
" 存檔移除多餘空白
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
        call system('true')
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
