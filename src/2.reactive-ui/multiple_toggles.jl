#=
Multiple toggles each with a different state variable
=#

module App
using GenieFramework
@genietools

@app begin
    @out toggle_list = []
    @in toggle_name = "toggle"
    @in process = false
    @onchange process begin
        println("Filter added")
        toggle_list = vcat(toggle_list, Dict("name" => toggle_name, "active" => false))
        @show toggle_list
    end
end


@page("/", "multiple_toggles.html")
Server.up()
end
