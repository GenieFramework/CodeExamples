using Literate

src_directory = "src"
sections = ["2.reactive-ui"]
md_directory = "markdown/"
docs_site_path = "../../geniedocssite/content/4.examples/"


function add_frontmatter(content)
    title_pattern = r"## (.*)"
    titles = eachmatch(title_pattern, content)
    title = first(titles).captures[1]
    desc_pattern = r"\*\*(.*)\*\*"
    desc_list = eachmatch(desc_pattern, content)
    description = first(desc_list).captures[1]
    content = """
    ---
    title: $title
    description: $description
    meta:
        - name: 'og:title'
        - content: '$title - Genie Cloud Resource Hub'
    ---

    $content
    """
    return content
end

# Add a link to the source code at the bottom of the page
function add_source(content)
    content = content * "\n[source]($source)"
    return content
end

# Find all tags of the form :::tag_content::: in a string and extract their contents
function find_tags(input_str::String)
    tag_pattern = r":::([\w\s\._-]+(?:\.[\w]+)?):::"
    tags = eachmatch(tag_pattern, input_str)
    tag_contents = [tag.captures[1] for tag in tags]
    return tag_contents
end

function add_file_contents(content)
    root = joinpath(split(filepath, "/")[1:end-1]) * "/"
    file_list = find_tags(content)
    for file_name in file_list
        @show file_name
        file = open(root * file_name, "r")
        code = read(file, String)
        @show code
        close(file)
        content = replace(content, ":::$file_name:::" => code)
    end
    return content
end

function pipeline(content)
    content |> add_file_contents |> add_source |> add_frontmatter
end

for section in sections
    directory = joinpath(src_directory, section)
    for (root, dirs, files) in walkdir(directory)
        for file in files
            if endswith(file, ".jl")
                global filepath = joinpath(root, file)
                outputpath = joinpath(md_directory, root)
                @show filepath
                global source = "https://github.com/GenieFramework/CodeExamples/blob/main/src/$section/$file"
                Literate.markdown(filepath, outputpath, flavor=Literate.CommonMarkFlavor(), credit=false, postprocess=pipeline)
            end
        end
    end
end

`rm -rf $md_directory/'*'` |> run
`find $docs_site_path/ -type d -name "'*'.md" -exec rm -r '{''}' +` |> run
`rsync -av $md_directory/$src_directory/ $docs_site_path` |> run
