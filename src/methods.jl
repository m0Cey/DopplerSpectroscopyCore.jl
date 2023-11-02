function ρₑₑ(x::Real, δ::Real, self::Quantum2Level, light::LightSource)
    local γₒₚₜ = self.relax_opt
    local x₀ = self.dimmless_velocity
    local Ω₁ = light.rabi_freq_1
    local Ω₂ = light.rabi_freq_2
    # <functions block>
    s⁽⁰⁾ₓ = sₓ(x, δ, Ω₁, γₒₚₜ)   # 0th order approximation
    s⁽²⁾ₓ = sₓ(-x, δ, Ω₂, γₒₚₜ)  # 2nd order approximation 
    fₓ = fᵥ(x, x₀)
    # <densities block>
    ρ⁽⁰⁾ₑₑ = 2*γₒₚₜ*s⁽⁰⁾ₓ*fₓ / (1 + 4*γₒₚₜ*s⁽⁰⁾ₓ)
    ρ⁽²⁾ₑₑ = 2*γₒₚₜ*s⁽²⁾ₓ*fₓ / (1 + 4*γₒₚₜ*s⁽⁰⁾ₓ)
    return ρ⁽⁰⁾ₑₑ + ρ⁽²⁾ₑₑ
end


"""@docs
    probe(δ::Real, two_level, light) -> Real
    probe(δ_vec::Vector{T}, two_level, light) -> Vector{T} where T<:Real
    probe(δ_range::LinRange{T1, T2}, two_level, light)
    -> Vector{T1} where {T1<:Real, T2<:Integer}

Compute probability `nₑ` of a quantum system to be in excited state for detuning `δ`.
By supplying multiple detuning values via `δ_vec` or `δ_range` compute `nₑ` for
each of them.

# Arguments
* `δ` :

* `two_level::Quantum2Level` :

* `light::LightSource` :

# Returns
* `nₑ` :
    Real number.

# See also
* [`StateVector`](@ref)

# References
* Springer: https://link.springer.com/chapter/10.1007/978-1-4684-4550-3_5
    (If you find any unpaywalled refence, please contact me via mail suggested on package's
    github page or create an issue)
"""
function probe(δ::Real, two_level::Quantum2Level, light::LightSource)::Real
    nₑ, error = QuadGK.quadgk(
        x -> ρₑₑ(x, δ, two_level, light),
        -Inf, +Inf
    )
    return nₑ
end
function probe(
    δ_vec::Vector{T},
    two_level::Quantum2Level,
    light::LightSource,
)::Vector{T} where T<:Real
    nₑ_vec = Vector{T}(undef, length(δ_vec))
    Threads.@threads for i in eachindex(δ_vec)
        nₑ_vec[i] = probe(δ_vec[i], two_level, light)
    end
    return nₑ_vec
end
function probe(
    δ_range::LinRange{T1, T2},
    two_level::Quantum2Level,
    light::LightSource,
)::Vector{T1} where {T1<:Real, T2<:Integer}
    nₑ_vec = Vector{T1}(undef, length(δ_range))
    Threads.@threads for i in eachindex(δ_range)
        nₑ_vec[i] = probe(δ_range[i], two_level, light)
    end
    return nₑ_vec
end
