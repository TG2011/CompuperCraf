--Rebuilding my stairs program as its own program for now. might re integrate it back into digger later

args = {...}
depth = args[1]

--subfunctions

function digUp()
    while turtle.detectUp() == true do
		turtle.digUp()
	end
end
function dig()
    while turtle.detect() == true do
		turtle.dig()
	end
end
function digDown()
    while turtle.detectDown() == true do
		turtle.digDown()
	end
end
function forward()
    dig()
    turtle.forward()
end
function makefloor()
    if turtle.detectDown() == false then
        turtle.select(1)
        turtle.placeDown()
    end
end
function fuelcheck()
    if turtle.getFuelLevel() == "unlimited" then
        sleep(0.1)
    elseif turtle.getFuelLevel() <= 100 then
        for j = 1,16,1 do
            turtle.select(j)
            turtle.refuel()
        end
    else
        sleep(0.1)
    end
end

--actual functions

function fourhigh()
    turtle.turnLeft()
    --left side
    dig()
    digUp()
    digDown()
    turtle.up()
    dig()
    digUp()
    turtle.up()
    dig()
    --turn around
    turtle.turnRight()
    turtle.turnRight()
    --right side
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    --last block
    turtle.turnLeft()
    turtle.turnLeft()
    dig()
    turtle.turnRight()
    makefloor()
end
function fivehigh()
    turtle.turnLeft()
    --left side
    dig()
    digUp()
    digDown()
    turtle.up()
    dig()
    digUp()
    turtle.up()
    dig()
    digUp()
    turtle.up()
    dig()
    --turn around
    turtle.turnRight()
    turtle.turnRight()
    --right side
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    --last block
    turtle.turnLeft()
    turtle.turnLeft()
    dig()
    turtle.turnRight()
    makefloor()
end
function sixhigh()
    turtle.turnLeft()
    --left side
    dig()
    digUp()
    digDown()
    turtle.up()
    dig()
    digUp()
    turtle.up()
    dig()
    digUp()
    turtle.up()
    dig()
    digUp()
    turtle.up()
    dig()
    --turn around
    turtle.turnRight()
    turtle.turnRight()
    --right side
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    --last block
    turtle.turnLeft()
    turtle.turnLeft()
    dig()
    turtle.turnRight()
    makefloor()
end
--main fucntions
function stairs()
    depth = depth - 3
    forward()
    fourhigh()
    forward()
    fivehigh()
    forward()
    if depth <= 3 then
        error()
    else
        for n = 1,depth,1 do
            sixhigh()
            forward()
            fuelcheck()
        end
        sixhigh()
    end
end

stairs()