#=
## Keypress detection

Detect a key press event and display a message
=#

module App
using GenieFramework
@genietools

@app begin
    @event :keypress begin
        println("The Enter key has been pressed")
    end
end

ui() =  textfield(class = "q-my-md", "Input", :input, hint = "Please enter some words", @on("keyup.enter", :keypress))

@page("/", ui)
Server.up()
end
