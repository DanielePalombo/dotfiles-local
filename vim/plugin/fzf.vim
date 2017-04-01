let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
  " if in a git project, use :GFiles
  nmap <silent> <leader>f :GFiles<cr>
else
  " otherwise, use :FZF
  nmap <silent> <leader>f :FZF<cr>
endif

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>
