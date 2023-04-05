using Literate

src_directory = "src"
sections = ["2.reactive-ui"]
md_directory = "markdown/"
docs_site_path = "../../geniedocssite/content/4.examples/"

function add_source(content)
    content = content * "\n[source]($source)"
    return content
end

for section in sections
    directory = joinpath(src_directory, section)
    for (root, dirs, files) in walkdir(directory)
        for file in files
            if endswith(file, ".jl")
                filepath = joinpath(root, file)
                outputpath = joinpath(md_directory, root)
                @show filepath
                global source = "https://github.com/GenieFramework/CodeExamples/blob/main/src/$section/$file"
                Literate.markdown(filepath, outputpath, flavor=Literate.CommonMarkFlavor(), credit=false, postprocess=add_source)
            end
        end
    end
end

`rm -rf $md_directory/'*'` |> run
`find $docs_site_path/ -type d -name "'*'.md" -exec rm -r '{''}' +` |> run
`rsync -av $md_directory/$src_directory/ $docs_site_path` |> run
