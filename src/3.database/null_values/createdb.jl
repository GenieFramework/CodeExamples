using SearchLight
using SearchLightSQLite

# edit db/connection.yml
SearchLight.Configuration.load() |> SearchLight.connect

# SearchLight.Generator.newresource("house")
SearchLight.Migrations.init()
SearchLight.Migrations.all_up!!()
