using DopplerSpectroscopyCore
using Test

@testset "DopplerSpectroscopyCore.jl" begin
    include("doppler.jl")
    include("sub-doppler.jl")
end
