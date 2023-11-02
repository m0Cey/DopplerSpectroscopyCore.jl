module DopplerSpectroscopyCore

import QuadGK


# documented for more readability of other file's code
# maybe will export them in future
include("functions.jl")

export Quantum2Level, LightSource
include("structs.jl")

export probe
include("methods.jl")


end
