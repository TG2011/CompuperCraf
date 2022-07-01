-- Will compare the item in slot 1 to what is infront of the turtle and if it matches then it will break it
while true do
    turtle.select(1)
    if turtle.compare() == true then
        turtle.dig()
    end
end