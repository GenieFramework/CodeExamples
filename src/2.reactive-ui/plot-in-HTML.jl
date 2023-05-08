#=
## Plot in HTML

**Define a plot in the HTML code with PlotlyJS syntax.**

The `data` and `layout` fields of the `plotly` component are directly defined in the HTML code, with the `x` and `y` attributes in each trace bound to Julia variables.
=#
module App
using GenieFramework
@genietools

@app begin
    @out firstX = [1, 2, 3, 4, 5]
    @out firstY = [5, 0, 3, -1, 2]
    @out secondX = [1, 2, 3, 4, 5]
    @out secondY = [1, 4, 6, 4, 4]
end


@page("/", "plot-in-HTML.html")
Server.isrunning() || Server.up()
end

#=
**HTML code**

```html
:::plot-in-HTML.html:::
```
=#
