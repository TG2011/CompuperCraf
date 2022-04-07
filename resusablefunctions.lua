--These are difference dig commands that should account for falling blocks when digging
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
--This is a forward command that will make use of the faliig block protection to dig into the next block space before moving forward.
function forward()
    dig()
    turtle.forward()
end
--this function needs work but basically is supposed to be used for only attempting a place block if the space below it is empty.
--technically not needed due to the commands being run fast enough that a failed block place is not going to  slow the turtle down at all
function makefloor()
    if turtle.detectDown() == false then
        turtle.select(1)
        turtle.placeDown()
    end
end
--simple fuel checking function
function fuelcheck()
    if turtle.getFuelLevel() <= 100 then
		for j = 1,16,1 do
			turtle.select(j)
			turtle.refuel()
		end
	end
end
--DEMO FUNCTION TO TEST API SHIT
function dink()
    term.clear()
    term.setCursorPos(1,1)
    print("Fucky Wucky with that Buldgy Wuldgy")
end