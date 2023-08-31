using DopplerSpectroscopyCore
using Documenter

DocMeta.setdocmeta!(DopplerSpectroscopyCore, :DocTestSetup, :(using DopplerSpectroscopyCore); recursive=true)

makedocs(;
    modules=[DopplerSpectroscopyCore],
    authors="Maksim Radchenko",
    repo="https://github.com/m0Cey/DopplerSpectroscopyCore.jl/blob/{commit}{path}#{line}",
    sitename="DopplerSpectroscopyCore.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://m0Cey.github.io/DopplerSpectroscopyCore.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/m0Cey/DopplerSpectroscopyCore.jl",
    devbranch="main",
)
