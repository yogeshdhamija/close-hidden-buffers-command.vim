if(exists("g:autoloaded_uss_clean_buffers"))
    finish
endif
let g:autoloaded_uss_clean_buffers = 1

function! ussCleanBuffers#DeleteHiddenBuffers(shouldCloseTerminalBuffers) abort
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

