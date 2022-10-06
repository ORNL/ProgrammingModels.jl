
import JACC


# A + B
@testset VectorAdd begin
    N = 1024
    A = JACC.Array{Float32}(1, N)
    B = JACC.Array{Float32}(1, N)
    C = A + B
end

@testset VectorAddLoop begin
    N = 1024
    A = JACC.Array{Float32}(1, N)
    B = JACC.Array{Float32}(1, N)

    @jacc

    @threads
    for i in 1:N
        C[i] = A[i] + B[i]
    end
end

@testset VectorReduce begin
    N = 1024
    A = JACC.Array{Float32}(1, N)
    B = JACC.Array{Float32}(1, N)

    @jacc reduction(C)
    for i in 1:N
        C += A[i] * B[i]
    end
end