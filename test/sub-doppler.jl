@testset "sub-doppler" begin
    light = LightSource(8e-7, 1, 0.3)
    atom = Quantum2Level(1.4e-25, 300, 2π*5e+6, 0.5, light)
    @test probe(0, atom, light) < probe(5, atom, light)
    @test probe(0, atom, light) < probe(-5, atom, light)
    @test probe(-100, atom, light) ≈ probe(100, atom, light)
    detun_linrange = LinRange(-20, 20, 301)
    @test minimum(probe(detun_linrange, atom, light)) == probe(0, atom, light)
    detun_vec = collect(detun_linrange)
    @test minimum(probe(detun_vec, atom, light)) == probe(0, atom, light)
end