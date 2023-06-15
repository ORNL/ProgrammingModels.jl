import JACC
using Test


@testset "TestBackend" begin
    @test JACC.JACCPreferences.backend == "threads"
end


@testset "VectorAddLambda" begin

    function f(x, a)
        @inbounds a[x] = a[x] + 5.0
    end

    dims = (10)
    a = round.(rand(Float32, dims) * 100)
    a_expected = a .+ 5.0

    JACC.parallel_for(10, f, a)

    @test a ≈ a_expected rtol = 1e-5

end
