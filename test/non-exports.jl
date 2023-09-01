@testset "non-exports" begin
    @test DopplerSpectroscopyCore.fᵥ(1, 1) == exp(-1) / √π
    @test DopplerSpectroscopyCore.fᵥ(1, 1) == exp(-1)/ √π
    @test DopplerSpectroscopyCore.sₓ(rand(), rand(), 0, rand()) == 0
    @test DopplerSpectroscopyCore.sₓ(1, 1, 1, 1) == 1
end
