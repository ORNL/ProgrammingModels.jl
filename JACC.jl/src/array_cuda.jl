

function backend()
    return cuda
end


function _parallel_for_cuda(f, d_a)
    i = (CUDA.blockIdx().x - 1) * CUDA.blockDim().x + CUDA.threadIdx().x
    f(i, d_a)
    return nothing
end

function parallel_for(N, f, d_a)
    CUDA.@cuda blocks = 1 threads = N _parallel_for_cuda(f, d_a)
end