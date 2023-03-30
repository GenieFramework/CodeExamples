using SearchLight
using SearchLightSQLite
include("app/resources/houses/Houses.jl")
using .Houses

# edit db/connection.yml
SearchLight.Configuration.load() |> SearchLight.connect

h = House(street="Barcelona", size=100, rooms=nothing)
save(h)
