# This example illustrates how to add labels to a simple line graph, turn off grid lines, and 
# place limits on the y-axis 

# To run this example, cd to CodeExamples/src/plot_label_attributes
# run julia --project 
# enter using Genie; Genie.loadapp()

using GenieFramework

@genietools


data = PlotData(
x=[1, 2, 3],
y=[3, 1, 2],
mode = "line")

layout = PlotLayout(
    xaxis=[PlotLayoutAxis(xy="x", title="x label", showgrid=false)],
    yaxis=[PlotLayoutAxis(xy="y", title="y label", showgrid=false, range=[0, 10])])


@handlers begin
    @out data 
    @out layout

end

function ui()
[
    h1("GenieFramework 🧞 Data Vizualization 📊")
    plot(:data, layout=:layout)
]
end

@page("/", ui)

Server.isrunning() || Server.up()