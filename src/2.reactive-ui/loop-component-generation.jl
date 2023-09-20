#=
## Loop component generation
**Generate components in a loop over a list**
The `@recur` macro adds a `for` loop that iterates over the specified list. In each iteration, the nested components are evaluated with the current value of the loop variable.
=#

module App
using GenieFramework
@genietools

@app begin
    @out messages = ["msg1", "msg2", "msg3"]
end

function ui()
    row([card(style="margin: 10px;", @recur("msg in messages"), [
        p("{{msg}}")
    ]),])
end
@page("/", ui)
end
