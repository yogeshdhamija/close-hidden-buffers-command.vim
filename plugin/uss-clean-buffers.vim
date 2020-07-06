" uss-clean-buffers.vim - clean buffers plugin
" Maintainer: Yogesh Dhamija <ydhamija96.github.io>
" Version 0.1

if(exists("g:loaded_uss_clean_buffers"))
    finish
endif
let g:loaded_uss_clean_buffers = 1

if !exists(":CloseHiddenBuffers")
    command! CloseHiddenBuffers call s:delete_hidden_buffers()
endif
if !exists(":CLO")
    command! CLO call s:delete_hidden_buffers()
endif

function! s:delete_hidden_buffers() abort
    let l:tpbl=[]
    let l:closed = 0
    call map(range(1, tabpagenr('$')), 'extend(l:tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(l:tpbl, v:val)==-1')
        if getbufvar(buf, '&mod') == 0 && getbufvar(buf, '&buftype') != 'terminal'
            silent execute 'bwipeout!' buf
            let l:closed += 1
        endif
    endfor
    redraw!
    echo "Closed ".l:closed." hidden buffers"
endfunction

