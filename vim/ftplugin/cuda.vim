source ~/dotfiles/vim/ftplugin/cxx_common.vim
"Some key bindings
call IMAP('TID', "threadIdx.","cuda")
call IMAP('BID', "blockIdx.","cuda")
call IMAP('CER', "checkCudaErrors(<++>)<++>","cuda")
call IMAP('MCP', "cudaMemcpy(<++>)<++>","cuda")
call IMAP('MAL', "cudaMalloc(<++>)<++>","cuda")
call IMAP('MHD', "cudaMemcpyHostToDevice","cuda")
call IMAP('MDH', "cudaMemcpyDeviceToHost","cuda")

