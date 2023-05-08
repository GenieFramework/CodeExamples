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
