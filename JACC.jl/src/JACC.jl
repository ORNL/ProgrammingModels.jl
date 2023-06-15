module JACC

# module to set back end preferences 
include("JACCPreferences.jl")

export Array
export parallel_for

global Array

function parallel_for(N, f, a)
    for i in 1:N
        f(i, a)
    end
end

function __init__()
    @info("Using JACC backend: $(JACCPreferences.backend)")

    if JACCPreferences.backend == "threads"
        const JACC.Array = Base.Array{T,N} where {T,N}
    end
end


end # module JACC
