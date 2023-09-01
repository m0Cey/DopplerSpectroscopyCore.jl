# DopplerSpectroscopyCore.jl

(This section is WIP)

DopplerSpectroscopyCore.jl provides core toolset for simulating Doppler and sub-Doppler spectroscopy
experiments. The main goal is to have ready-to-use, simple-to-understand modeling toolkit with experimenters in mind.
Furthermore, it can be used as introduction to spectroscopy for people with little physics background or
students.

## Installation

To install DopplerSpectroscopyCore.jl, use the Julia package manager:

```julia
julia> using Pkg
julia> Pkg.add("DopplerSpectroscopyCore")
```

## Example

(This section is WIP)

Import module:

```julia
julia> using RabiRamseySpectroscopy
```

At first we need to create our experement setup:

1. Light source - research instrument. Red laser (wavelenght = 750 nm or approx. 8e-7 m) will fit.
We consider that there is no refracted light to enter the research object in a backward direction
by setting the last parameter to 0

```julia
julia> laser = LightSource(8e-7, 1, 0)
```

2. Gas cell or a single atom - research object. Lets say it's a <sup>87</sup>Rb atom (mass = 1.4e-25kg)
at room temperature (T = 300 K). Atom's spontaneous relaxation parameter is approx. 2π*5e+6 Hz and
optical relaxation parameter considered to be half of spontaneous in units of it's value (0.5). Other parameters
depends on a light source so we just use our **laser** as an argument

```julia
julia> atom = Quantum2Level(1.4e-25, 300, 2π*5e+6, 0.5, light)
```

Because probing time is long enough, probe pulse will be playing two roles at the same time:

1. _pump_ our atom with some probability to excited state

2. _probe_ our system to check if atom was actually pumped.

(Make a pull request or issue on package's GitHub page if you want more physics details in the intro)

Thus said, second step is to probe an atom with the laser:

```julia
julia> probe(0, atom, laser)
0.0189015858908291
```

The output indicates the probability of our atom to be in excited state at zero-detuning
(laser frequency is resonant with transition frequency of an atom).

Congrats, you performed your first spectroscopy experiment in Julia!

As a third step we'll see a relation between mentioned probability and detuning of a laser light.
For that we need to make a series of probes, varying laser detuning. It can be done by simply applying **probe**
on a range of detuning values:

```julia
julia> detun_range = LinRange(-300, 300, 100)
julia> probes = probe(detun_range, atom, laser)
```
Then you can plot this relation yourself with any provided plotting tool: Plots, PlotlyJS, Makie etc.
(maybe will add example pic later)

## Development

(This section is WIP)

If you want to help develop this package, you can do it via GitHub default instruments (pull requests,
issues etc.) and/or contact me: sciencefloppa@gmail.com.
In additon, it is highly recommended to read or modify code of DopplerSpectroscopyCore.jl with JuliaMono font 
installed. That way UTF-8 symbols will be displayed correctly.
