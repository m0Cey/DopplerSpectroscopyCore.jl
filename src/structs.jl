"""
    LightSource

Class that describes light source which is used to interact with the quantum
two-level system.

# Fields
* `wavelength` :
    Represents a value of the main light source wavelength
    (m).
* `rabi_freq_1` :
    Represents a value of the Rabi frequency originated from the interaction between
    direct light beam and two-level system
    (units of spontaneous emission frequency `γ₀`).
* `rabi_freq_2` :
    Represents a value of the Rabi frequency originated from the interaction between
    reverse/reflected light beam and two-level system
    (units of spontaneous emission frequency `γ₀`).

# Arguments
Refer to fields' description.

# Returns
* `Laser` :
    composite type instance.

# References
* Wikipedia: https://en.wikipedia.org/wiki/Laser
* Wikipedia: https://en.wikipedia.org/wiki/Optical_parametric_amplifier
* Wikipedia: https://en.wikipedia.org/wiki/Spontaneous_emission
"""
struct LightSource
    wavelength::Float64
    rabi_freq_1::Float64
    rabi_freq_2::Float64
    function LightSource(λ::Real, Ω₁::Real, Ω₂::Real = 0.0)
        return new(λ, Ω₁, Ω₂)
    end
end


"""
    Quantum2Level

Class that describes the quantum two-level system via parameters of that system.

# Fields
* `mass` :
    Represents a value of the quantum system's mass
    (kg).
* `temperature` :
    Represents a value of the quantum system's temperature
    (K).
* `relax_sp` :
    Represents a value of the spontaneous emission frequency in quantum system and
    considered to be constant in this model, referred to as `γ₀` in other documentation
    and below
    (Hz).
* `relax_opt` :
    Represents a value of the optical emission frequency of optical transitions in quantum
    system and considered to be constant in this model
    (units of `γ₀`).
* `dimmless_velocity` :
    Represents a value of the quantum system's most probable velocity in
    dimensionless units.

# Arguments
* `M`, `T`, `γ₀`, `γₒₚₜ` :
    Refer to fields' description.
* `light` :
    Light source which is used to interact with the quantum two-level system.

# Returns
* `Quantum2Level` :
    Composite type instance.

# See also
* [`LightSource`](@ref)

# References
* Wikipedia: https://en.wikipedia.org/wiki/Density_matrix
* Wikipedia: https://en.wikipedia.org/wiki/Spontaneous_emission
"""
struct Quantum2Level
    mass::Float64
    temperature::Float64
    relax_sp::Float64
    relax_opt::Float64
    dimmless_velocity::Float64
    function Quantum2Level(M::Real, T::Real, γ₀::Real, γₒₚₜ::Real, light::LightSource)
        local λ = light.wavelength
        k::Float64 = 2π / λ     # calculate the wave number
        k_B = 1.380649e-23
        v₀ = √(2*k_B*T / M)
        x₀ = v₀*k / γ₀
        return new(M, T, γ₀, γₒₚₜ, x₀)
    end
    function Quantum2Level(q_sys::Quantum2Level, light::LightSource)
        local M = q_sys.mass
        local T = q_sys.temperature
        local γ₀ = q_sys.relax_sp
        local γₒₚₜ = q_sys.relax_opt
        local λ = light.wavelength
        k::Float64 = 2π / λ     # calculate the wave number
        k_B = 1.380649e-23
        v₀ = √(2*k_B*T / M)
        x₀ = v₀*k / γ₀
        return new(M, T, γ₀, γₒₚₜ, x₀)
    end
end
