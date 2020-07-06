if(exists("g:loaded_uss_clean_buffers"))
    finish
endif
let g:loaded_uss_clean_buffers = 1

command -bang CloseHiddenBuffers call ussCleanBuffers#DeleteHiddenBuffers(<bang>0)
command -bang CLO call ussCleanBuffers#DeleteHiddenBuffers(<bang>0)
