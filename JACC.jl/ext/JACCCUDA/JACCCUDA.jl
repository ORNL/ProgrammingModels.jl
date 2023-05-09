
module JACCCUDA

using JACC, CUDA


function JACC.parallel_for(N, f, d_a)
    @cuda blocks = 1 threads = N _parallel_for_cuda(f, d_a)
end

function _parallel_for_cuda(f, d_a)
    i = (blockIdx().x - 1) * blockDim().x + threadIdx().x
    f(i, d_a)
    return nothing
end


function __init__()
    const JACC.Array = CUDA.CuArray{T,N} where {T,N}
end

end # module JACCCUDA