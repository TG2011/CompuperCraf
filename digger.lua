args = {...}
--Use for t for tunnel or s for stairs
opt1 = args[1]
--Use this as a number to indicate length for stairs/tunnel
depth = args[2]
--Unused Argument for Possible Expansion
opt3 = args[3]


--SubFunctions
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
    if turtle.getFuelLevel() <= 100 then
		for j = 1,16,1 do
			turtle.select(j)
			turtle.refuel()
		end
	end
end

--stairs functions
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
	fuelcheck()
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
	fuelcheck()
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
	fuelcheck()
end
--main fucntions
function stairs()
    depth = depth - 3
    forward()
    fourhigh()
    forward()
    fivehigh()
    forward()
    if depth <= 0 then
        error()
    else
        for n = 1,depth,1 do
            sixhigh()
            forward()
        end
        sixhigh()
    end
end

--tunneler functions

function tunnel()
    --left column
    turtle.turnLeft()
    dig()
    digUp()
    turtle.up()
    dig()
    digUp()
    turtle.up()
    dig()
    --right column
    turtle.turnRight()
    turtle.turnRight()
    dig()
    turtle.down()
    dig()
    turtle.down()
    dig()
    turtle.turnLeft()
    makefloor()
    fuelcheck()
end

function tunnelbatch()
    forward()
    depth = depth - 1
    for p = 1,depth,1 do
        tunnel()
        forward()
    end
    tunnel()
end



--actual program for doing the things
if opt1=="t" or opt1=="T" then
		tunnelbatch()
	else
		if opt1=="s" or opt1=="S" then
			stairs()
		else
			print("First Arg Should be t or s for tunnel or stairs")
			print("Second Arg Should be Length/depth")
	end
end