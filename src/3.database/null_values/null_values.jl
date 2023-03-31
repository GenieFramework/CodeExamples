using SearchLight
using SearchLightSQLite
include("app/resources/houses/Houses.jl")
using .Houses

SearchLight.Configuration.load() |> SearchLight.connect

h = House(street="Barcelona", size=200, rooms=nothing)
save(h)
find(House, SQLWhereExpression("size == ?", 200))
