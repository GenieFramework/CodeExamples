#=
## Multiple toggles
**Adding multiple toggles, each with its own state variable**
=#

module App
using GenieFramework
@genietools

@app begin
    @out toggle_list = ["red", "green", "yellow"]
    @out toggle_states = []
    @in toggle_name = "toggle"
    @in process = false
    @onchange process begin
        toggle_list = vcat(toggle_list, [toggle_name])
    end
end

@page("/", "multiple-toggles.html")
Server.up()
end

#=
**HTML code**

```html
:::multiple-toggles.html:::
```
=#
