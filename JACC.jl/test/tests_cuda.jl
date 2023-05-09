import CUDA
import JACC
using Test


@testset "TestBackend" begin
    @test JACC.JACCPreferences.backend == "cuda"
end

@testset "VectorAddLambda" begin

    function f(x, d_a)
        @inbounds d_a[x] = d_a[x] + 5.0
    end

    dims = (10)
    a = round.(rand(Float32, dims) * 100)

    a_device = JACC.Array(a)
    JACC.parallel_for(10, f, a_device)

    a_expected = a .+ 5.0
    @show Array(a_device) ≈ a_expected rtol = 1e-5

end















# A + B
# @testset VectorAdd begin
#     N = 1024
#     A = JACC.Array{Float32}(1, N)
#     B = JACC.Array{Float32}(1, N)
#     C = A + B
# end

# @testset VectorAddLoop begin
#     N = 1024
#     A = JACC.Array{Float32}(1, N)
#     B = JACC.Array{Float32}(1, N)

#     @jacc
#     for i in 1:N
#         C[i] = A[i] + B[i]
#     end
# end

# @testset VectorReduce begin
#     N = 1024
#     A = JACC.Array{Float32}(1, N)
#     B = JACC.Array{Float32}(1, N)

#     @jacc reduction(C)
#     for i in 1:N
#         C += A[i] * B[i]
#     end
# end


# @testset VectorAddLoopKernel begin
#     N = 1024
#     A = JACC.Array{Float32}(1, N)
#     B = JACC.Array{Float32}(1, N)

#     function kernel(i, A, B)

#     end

#     @jacc
#     for i in 1:N
#         C[i] = A[i] + B[i]
#     end
# end