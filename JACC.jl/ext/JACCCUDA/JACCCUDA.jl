
module JACCCUDA

using JACC, CUDA

function JACC.parallel_for(N, f, x...)
  maxPossibleThreads = attribute(device(),CUDA.DEVICE_ATTRIBUTE_MAX_BLOCK_DIM_X) 
  cuda_threads = min(N, maxPossibleThreads)
  cuda_blocks = ceil(Int, N/cuda_threads)
  @cuda threads=cuda_threads blocks=cuda_blocks parallel_for_cuda(N, f, x...)
end

function _parallel_for_cuda(N, f, x...)
  i = ( blockIdx().x - 1) * blockDim().x + threadIdx().x
  #@inbounds f(i, x...)
  if i <= N
    f(i,x...)
  end
  return nothing
end


function __init__()
    const JACC.Array = CUDA.CuArray{T,N} where {T,N}
end

end # module JACCCUDA
