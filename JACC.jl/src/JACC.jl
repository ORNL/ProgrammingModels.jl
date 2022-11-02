module JACC

export Array
export backend, Backend
export parallel_for

using Requires: @require


@enum Backend cuda amdgpu threads

function __init__()

    backend_type = threads
    @require CUDA = "052768ef-5323-5732-b1bb-66c8b64840ba" begin
        backend_type = cuda
        const Array = CUDA.CuArray{T,N} where {T,N}
        include("array_cuda.jl")
    end

    @require AMDGPU = "21141c5a-9bdb-4563-92ae-f87d6854732e" begin
        if backend_type != cuda
            const Array = AMDGPU.ROCArray{T,N} where {T,N}
            include("array_amdgpu.jl")
        end
    end

end


end # module JACC
