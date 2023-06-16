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
    @test Array(a_device) ≈ a_expected rtol = 1e-5

end


@testset "AXPY" begin

    function axpy(i, alpha, x, y)
        @inbounds x[i] = x[i] + alpha[1,1] * y[i]
    end

    function seq_axpy( N, alpha, x, y)
        for i in 1:N
            x[i] = x[i] + alpha[1,1] * y[i]
        end
    end

    dims = (1000000)
    x = round.(rand(Float32, dims) * 100)
    y = round.(rand(Float32, dims) * 100)
    alpha = 2.5

    dx = JACC.Array(x)
    dy = JACC.Array(y)
    JACC.parallel_for(dims, axpy, alpha, dx, dy)

    x_expected = x
    seq_axpy(dims, alpha, x_expected, y)
    
    @test Array(dx) == x_expected rtol = 1e-10 

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
