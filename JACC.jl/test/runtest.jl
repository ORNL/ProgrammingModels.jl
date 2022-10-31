
import CUDA
import AMDGPU


if CUDA.functional()
    include("runtest_cuda.jl")
end

if AMDGPU.functional()
    include("runtest_amdgpu.jl")
end
