using Literate

directory = "src"
md_directory = "markdown/"
docs_site_path = "../../geniedocssite/content/4.examples/"

for (root, dirs, files) in walkdir(directory)
    for file in files
        if endswith(file, ".jl")
            filepath = joinpath(root, file)
            outputpath = joinpath(md_directory, root)
            Literate.markdown(filepath, outputpath, flavor = Literate.CommonMarkFlavor(), credit = false)
            jl_to_markdown(filepath)
        end
    end
end

`find $docs_site_path/ -type d -name "'*'.md" -exec rm -r '{''}' +` |> run
`rsync -av $md_directory/$directory/ $docs_site_path` |> run
