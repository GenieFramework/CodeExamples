#=
Inserting objects that have fields with `nothing` value results in a DB record with `NULL` value.
=#
using SearchLight
using SearchLightSQLite
include("app/resources/houses/Houses.jl")
using .Houses
# Find will convert the record field to the type of the default value in the struct.
# We need to extend `convert` so that non-null fields are not converted to nothing.
Base.convert(t::Type{Nothing}, x::Int64) = x

SearchLight.Configuration.load() |> SearchLight.connect

h = House(street="Barcelona", size=400, rooms=nothing)
save(h)
h = House(street="Barcelona 2", size=400, rooms=4)
save(h)

@show find(House, SQLWhereExpression("street ==? AND size == ?", "Barcelona", 400))
@show find(House, SQLWhereExpression("street ==? AND size == ?", "Barcelona 2", 400))
