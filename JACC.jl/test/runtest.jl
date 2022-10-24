
import JACC


A = JACC.Array{Float32,2}(undef, 2, 2)
A[1] = 1
println(A)




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

# @testset VectorAddLambda begin

#     function f(x,d_a)
#         d_a[x] = d_a[x] + 5.
#     end

#     function _parallel_for_cuda(f,d_a)
#         i = (blockIdx().x - 1) * blockDim().x + threadIdx().x
#         f(i,d_a)
#         return nothing
#     end

#     function parallel_for(N,f,d_a)
#         @cuda blocks=1 threads=N _parallel_for_cuda(f, d_a)
#     end

#     dims = (10)
#     a = round(rand(Float32,dims)*100)
#     d_a = CuArray(a)

#     parallel_for(10, f, d_a)

# end