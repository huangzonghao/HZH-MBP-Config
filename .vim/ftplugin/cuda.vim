"nnoremap <silent> <f8> :update<CR> :!make<CR>
"nnoremap <silent> <f7> :!./executable<CR>

colo slate
set tabstop=4
set spell
"call DoWordComplete()

"Some key bindings
call IMAP('INT', "size_t","cuda")
call IMAP('??', "/* <++> */","cuda")
call IMAP('TID', "threadIdx.","cuda")
call IMAP('BID', "blockIdx.","cuda")
call IMAP('CER', "checkCudaErrors(<++>)<++>","cuda")
call IMAP('MCP', "cudaMemcpy(<++>)<++>","cuda")
call IMAP('MAL', "cudaMalloc(<++>)<++>","cuda")
call IMAP('MHD', "cudaMemcpyHostToDevice","cuda")
call IMAP('MDH', "cudaMemcpyDeviceToHost","cuda")

