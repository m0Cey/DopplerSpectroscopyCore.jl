@testset "typecheck" begin
    light = LightSource(8e-7, 1, 0.3)
    atom = Quantum2Level(1.4e-25, 300, 2π*5e+6, 0.5, light)
    detun_linrange = LinRange(-100, 100, 201)
    @test eltype(probe(detun_linrange, atom, light)) == eltype(detun_linrange)
    detun_vec = collect(detun_linrange)
    @test eltype(probe(detun_vec, atom, light)) == eltype(detun_vec)
end