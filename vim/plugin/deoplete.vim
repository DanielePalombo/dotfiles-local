if has('nvim')
  call deoplete#enable()

  let g:deoplete#enable_at_startup=1
  let g:deoplete#enable_refresh_always=1
  let g:deoplete#auto_complete_start_length=2
  let g:deoplete#file#enable_buffer_path=1
  let g:deoplete#disable_auto_complete = 0

  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
    \ 'tern#Complete',
    \ 'jspc#omni'
  \]

  let g:deoplete#sources={}
  let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
  let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
  let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
  let g:deoplete#sources['javascript'] = ['buffer', 'member', 'file', 'ultisnips', 'omni', 'ternjs']
  let g:deoplete#sources['javascript.jsx'] = ['buffer', 'member', 'file', 'ultisnips', 'omni', 'ternjs']
  let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
  let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
  let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']
  " }}}
end
