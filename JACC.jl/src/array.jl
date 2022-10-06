


struct Array{T,N}(::UndefInitializer, dims::Dims{N}, deferred::Bool=true )  where{T,N}
{
    
    dims::Dims{N}
    deferred::Bool

}