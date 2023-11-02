"""@docs
    fᵥ(x::Real, x₀::Real) -> Real

Compute the value of the Maxwell-Boltzmann distribution for a given dimensionless velocity
value `x`, with a most probable dimensionless velocity `x₀` of the distribution.

# Arguments
* `x` : 
    The dimensionless velocity value to evaluate the function at.
* `x₀` : 
    The most probable dimensionless velocity of the distribution.

# Returns
* `value of the distribution` :
    Real number.

# References
* Wikipedia: https://en.wikipedia.org/wiki/Maxwell%E2%80%93Boltzmann_distribution

# Examples
    julia> fᵥ(1, 2)
    0.21969564473386122
    julia> fᵥ(0, 1)
    0.5641895835477563
"""
fᵥ(x::Real, x₀::Real) = exp(-x^2/x₀^2) / (x₀*√π)

"""@docs
    sₓ(x::Real, δ::Real, Ω::Real, γ::Real) -> Real

Compute the saturation parameter value of a quantum two-level system for a
given dimensionless velocity.

# Arguments
* `x` :
    The dimensionless velocity value to evaluate the function at.
* `δ` :
    The detuning, a measure of how far the perturbation field oscillation frequency is
    off-resonance relative to the transition
    (units of spontaneous emission frequency `γ₀`).
* `Ω` :
    The Rabi frequency at which the probability amplitudes of two energy levels fluctuate
    in an oscillating perturbation field
    (units of spontaneous emission frequency `γ₀`).
* `γ` :
    The optical emission frequency of optical transitions in quantum system
    (units of spontaneous emission frequency `γ₀`).

# Returns
* `saturation parameter` :
    Real number.

# See also
* [`Quantum2Level`](@ref)

# References
* Wikipedia: https://en.wikipedia.org/wiki/Spontaneous_emission
"""
sₓ(x::Real, δ::Real, Ω::Real, γ::Real) = Ω^2 / (γ^2 + (δ-x)^2)
