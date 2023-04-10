#=
## Asynchronous task

**Spawn a task that runs in the background and updates the UI.**
=#
module App
using GenieFramework
@genietools

@handlers begin
    @private running = false
    @in x = 0.00
    @onchange isready begin
        if !running
            running = true
            @async begin
                println("Task started")
                while x <= 10
                    x = x + 1
                    sleep(1)
                end
            end
            running = false
        end
    end
end

function ui()
    bignumber("Counter", :x)
end

@page("/", ui)
Server.isrunning() || Server.up()
end
