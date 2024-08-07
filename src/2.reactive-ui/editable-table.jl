#=
## Editable table

**Edit a table's content in the browser.**
=#

using Stipple, StippleUI
using Stipple.ReactiveTools
using DataFrames

@app begin
    @in data = DataTable(DataFrame(name=["Panda", "Lily"], email=["panda@chihuahua.com", "lily@merckgroup.com"], age=["", ""]))
    @in data_pagination = DataTablePagination(rows_per_page=5)
    @in show = false
    @onbutton show begin
        @show data
    end
end

function ui()
    [
        table(:data, edit=["name", "email", "age"], cell_type=["text", "text", "number"], pagination=:data_pagination),
        # set edit=true to enable editing for all columns
        #table(:data, edit=true),
        btn("show data", @click(:show))
       ]
end

@page("/", ui)
