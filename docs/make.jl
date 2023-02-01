using OHDSIAPI
using Documenter

makedocs(;
    modules = [OHDSIAPI],
    authors = "Jacob Zelko (aka TheCedarPrince) <jacobszelko@gmail.com> and contributors",
    repo = "https://github.com/JuliaHealth/OHDSIAPI.jl/blob/{commit}{path}#L{line}",
    sitename = "OHDSIAPI.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://JuliaHealth.github.io/OHDSIAPI.jl",
        assets = String[],
        edit_link = "dev",
	footer = "Created by [Jacob Zelko](https://jacobzelko.com) & [Georgia Tech Research Institute](https://www.gtri.gatech.edu). [License](https://github.com/JuliaHealth/OHDSIAPI.jl/blob/main/LICENSE)"
    ),
    pages = [
        "Home" => "index.md"
    ],
)

deploydocs(;
    repo = "github.com/JuliaHealth/OHDSIAPI.jl",
    push_preview = true,
    devbranch = "main",
)