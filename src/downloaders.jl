function download_concept_set(
    IDs;
    progress_bar::Bool = true,
    output_dir::String = pwd(),
    deflate::Bool = true
)

    p = progress_bar ?
    Progress(
        length(IDs);
        dt=0.1,
        barglyphs=BarGlyphs("[=> ]"),
        barlen=40,
        color=:yellow
    ) :
    nothing

    download_paths = []
    for id in IDs
        cohort_resp = get_cohortdefinition(id)
        if cohort_resp.status != 200
            @warn "Failed to download concept set for cohort ID: $id"
            continue
        end

        try
            r = OHDSIAPI.get_cohortdefinition_export_conceptset(id)
            fname = split(r.headers[1][2], r"filename=")[2] |> x -> replace(x, "\"" => "")
            path = joinpath(output_dir, fname)

            open(path, "w") do f
                write(f, r.body)
            end

            @info "Downloaded conceptset for cohort ID: $id."
            if progress_bar
                next!(p; showvalues=[("Downloaded cohort", "$id")])
            end

            push!(download_paths, path)
        catch e
            @warn "Error downloading cohort ID $id: $e"
            continue
        end
    end

    paths = []
    if deflate
        for p in download_paths
            @info "Deflating $p."
            zarchive = ZipFile.Reader(p)

            for f in zarchive.files
                fpath = replace(p, "export.zip" => "")
                fpath = joinpath(output_dir, fpath * f.name)
                write(fpath, read(f))
                push!(paths, fpath)
            end

            close(zarchive)
            rm(p)
        end
        
    end

    return !isempty(paths) ? paths : download_paths 
end

export get_cohort_definition
export download_concept_set
