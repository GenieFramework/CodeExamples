using SearchLight
using SearchLightSQLite
include("app/resources/houses/Houses.jl")
using .Houses

SearchLight.Configuration.load() |> SearchLight.connect

h = House(street="Barcelona", size=400, rooms=missing)
save(h)
h = House(street="Barcelona 2", size=400, rooms=nothing)
save(h)
h = House(street="Barcelona 3", size=400, rooms=4)
save(h)
# find(House, SQLWhereExpression("size == ?", 400))
