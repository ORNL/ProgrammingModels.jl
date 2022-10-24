module JACC

export Array

using Requires: @require

function __init__()


    @require CUDA = "052768ef-5323-5732-b1bb-66c8b64840ba" begin
        const Array = CUDA.CuArray{T,N} where {T,N}
    end

    @require AMDGPU = "21141c5a-9bdb-4563-92ae-f87d6854732e" begin
        const Array = AMDGPU.ROCArray{T,N} where {T,N}
    end

end


end # module JACC
