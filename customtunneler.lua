args = {...}
depth = args[1]
steps = 1
torchspace = 5

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

function torch()
	if steps >= torchspace then
		for i=1,16 do
			local Data
			local loopcount = 0
			Data=turtle.getItemDetail(i)
			if Data ~= nil then
				if Data.name == "minecraft:torch" then
					turtle.select(i)
					turtle.place()
					break
				end
			end
		end
		steps = 1
		turtle.select(1)
	else
		steps = steps+1
	end
end

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
    torch() -- Should place a torch
    turtle.down()
    dig()
    turtle.down()
    dig()
    turtle.turnLeft()
    makefloor()
    fuelcheck()
end
function comeback()
    for d = 1,depth+1,1 do
        turtle.back()
    end
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

tunnelbatch()
comeback()