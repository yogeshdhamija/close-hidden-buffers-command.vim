if(exists("g:autoloaded_close_hidden_buffers_command"))
    finish
endif
let g:autoloaded_close_hidden_buffers_command = 1

function! closeHiddenBuffersCommand#DeleteHiddenBuffers(shouldCloseTerminalBuffers) abort
    if(exists("g:vscode"))
        call VSCodeCall("workbench.action.clearEditorHistory")
        call VSCodeCall("workbench.action.splitEditor")
        call VSCodeCall("workbench.action.closeActiveEditor")

        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
        call VSCodeCall("workbench.action.focusNextGroup")
    else
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
    endif
endfunction

