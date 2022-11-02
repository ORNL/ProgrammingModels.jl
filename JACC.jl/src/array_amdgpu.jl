
function backend()
    return amdgpu
end

function _parallel_for_amdgpu(f, d_a)
    i = (AMDGPU.workgroupIdx().x - 1) * AMDGPU.workgroupDim().x + AMDGPU.workitemIdx().x
    f(i, d_a)
    return nothing
end

function parallel_for(N, f, d_a)
    AMDGPU.@roc gridsize = 1 groupsize = N _parallel_for_amdgpu(f, d_a)
end