#=
## Plot events

**Detect mouse events on a plot.**
=#

module App
using GenieFramework, PlotlyBase, StipplePlotly
@genietools

trace1 = scatter(; x=1:4, y=[0, 2, 3, 5], fill="tozeroy")
trace2 = scatter(; x=1:4, y=[3, 5, 1, 7], fill="tonexty")

@app EventsModel begin
    @out plotdata = [trace1, trace2]
    @out plotlayout = PlotlyBase.Layout(title="Filled line chart")
    @mixin data::PlotlyEvents
    @onchange data_click begin
        @show data_click
    end
    @onchange data_hover begin
        @show data_hover
    end
    @onchange data_selected begin
        @show data_selected
    end
    @onchange data_relayout begin
        @show data_relayout
    end
end

@mounted EventsModel watchplots()

ui() = plot(:plotdata, layout=:plotlayout, syncevents = true)

route("/") do
    global model
    model = EventsModel |> init |> handlers
    page(model, ui()) |> html
end

Server.isrunning() || Server.up()
end

