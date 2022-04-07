args = {...}
depth = args[1]
length = args[2]
current = 1

function column()
    for i = 1, depth, 1 do
       turtle.digDown()
       turtle.down() 
    end
end
function returnup()
    for d = 1,depth,1 do 
        turtle.up()
    end
end
function returnhome()
    for h = 1,length,1 do
        turtle.back()
    end
end
function nextcolumn()
    turtle.dig()
    turtle.forward()
    current = current + 1
end
function empty()
    turtle.select(1)
    turtle.placeUp()
    for s = 2,16,1 do
        turtle.select(s)
        turtle.dropUp()
    end
    turtle.select(1)
    turtle.digUp()
end
for y = 1,length,1 do
    column()
    returnup()
    empty()
    nextcolumn()
end
returnhome()