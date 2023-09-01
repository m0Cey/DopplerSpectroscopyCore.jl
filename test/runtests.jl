using DopplerSpectroscopyCore
using Test

@testset "DopplerSpectroscopyCore.jl" begin
    include("non-exports.jl")
    include("typecheck.jl")
    include("doppler.jl")
    include("sub-doppler.jl")
end
