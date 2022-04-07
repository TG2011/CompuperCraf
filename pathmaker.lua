--[[This program is a path/field tool
    Place the turtle on the ground facing the left corner of the path or field you want to till/turn into dirt path
    after that simply launch the program with 2 arguments, first is the lenght (how far away from the front of the turtle to go)
    and then second is the width. Turtle will now move up one block and forward and start "digging". It has a test to see if there
    is a block in the way for it to till/path and then will keep digging down till it succeds. Currently it doesn't check if there is
    something blocking its path forward yet but that can be added quickly later.  ]]

args = {...}
length = args[1]
width = args[2]
columnnumber = 1

--forward Test and digger commands
function dig()
    while turtle.detect() == true do
		turtle.dig()
	end
end
function forward()
    dig()
    turtle.forward()
end
--End forward Test and digger commands
function shiftturn()
    columnnumber = columnnumber+1
    if (columnnumber % 2 == 0) then
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
    else
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
    end
end

function pathlength()
    for i=1,length-1,1 do
        while turtle.detectDown() do
            turtle.digDown()
        end
        turtle.digDown()
        turtle.forward()
    end
    turtle.digDown()
end

function makepath()
    turtle.up()
    turtle.forward()
    for y=1,width-1,1 do
        pathlength()
        shiftturn()
    end
    pathlength()
end

function returnhome()
    if (columnnumber % 2 == 0) then
        turtle.forward()
    else
        for u=1,length,1 do
            turtle.back()
        end
    end
end

makepath()
returnhome()