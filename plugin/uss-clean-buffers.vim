" uss-clean-buffers.vim - clean buffers plugin
" Maintainer: Yogesh Dhamija <ydhamija96.github.io>
" Version 0.1

if(exists("g:loaded_uss_clean_buffers"))
    finish
endif
let g:loaded_uss_clean_buffers = 1

if !exists(":CloseHiddenBuffers")
    command! -bang CloseHiddenBuffers call s:delete_hidden_buffers(<bang>0)
endif
if !exists(":CLO")
    command! -bang CLO call s:delete_hidden_buffers(<bang>0)
endif

function! s:delete_hidden_buffers(shouldCloseTerminalBuffers) abort
    let l:tpbl=[]
    let l:closed = 0
    call map(range(1, tabpagenr('$')), 'extend(l:tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(l:tpbl, v:val)==-1')
        if getbufvar(buf, '&mod') == 0
            if (getbufvar(buf, '&buftype') != 'terminal' || a:shouldCloseTerminalBuffers)
                silent execute 'bwipeout!' buf
                let l:closed += 1
            endif
        endif
    endfor
    redraw!
    echo "Closed ".l:closed." hidden buffers"
endfunction

