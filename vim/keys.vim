" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <A-Right> :call utils#intelligentVerticalResize('right')<cr>
nnoremap <silent> <A-Left> :call utils#intelligentVerticalResize('left')<cr>
nnoremap <silent> <A-Up> :resize +1<cr>
nnoremap <silent> <A-Down> :resize -1<cr>

" wipout buffer
nmap <silent> <leader>b :bw<cr>
" shortcut to save
nmap <leader>w :w<cr>
" shortcut to quit
nmap <leader>q :q<cr>
" set paste toggle
set pastetoggle=<leader>v
" toggle paste mode
" map <leader>v :set paste!<cr>

" navigate tabs
noremap <leader>. :bnext<cr>
noremap <leader>, :bprev<cr>

" clear highlights after search
noremap <leader>/ :noh<cr>
noremap <leader>Q :quitall<cr>

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

if has('nvim')
  " https://github.com/christoomey/vim-tmux-navigator#it-doesnt-work-in-neovim-specifically-c-h
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz
