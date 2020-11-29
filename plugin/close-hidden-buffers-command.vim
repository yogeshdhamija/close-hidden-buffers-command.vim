if(exists("g:loaded_close_hidden_buffers_command"))
    finish
endif
let g:loaded_close_hidden_buffers_command = 1

command -bang CloseHiddenBuffers call closeHiddenBuffersCommand#DeleteHiddenBuffers(<bang>0)
command -bang CLO call closeHiddenBuffersCommand#DeleteHiddenBuffers(<bang>0)
