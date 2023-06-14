module JACC

# module to set back end preferences 
include("JACCPreferences.jl")

export Array
export parallel_for

function parallel_for(N, f, d_a)

end

function __init__()
    @info("Using JACC backend: $(JACCPreferences.backend)")
end


end # module JACC
