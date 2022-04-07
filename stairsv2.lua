--Attempting to make the stairs program more modular
--will work on this one slowly

args = {...}
depth = args[1]
height = args[2]
--subfunctions
function checkheight()
    if args[1] == "help" or "man" then
        stairshelp()
    elseif height == nil or height == "" then
        height = 6
    elseif height <=2 then
        error("Height is Too Low Please Enter a a Height of 3 or more")
    end
end
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
function flip()
    turtle.turnLeft()
    turtle.turnLeft()
end
function sidemidlayer()
    dig()
    digUp()
end
function leftsidebottom()
    turtle.turnLeft()
    turtle.turnLeft()
    dig()
    turtle.turnRight()
end
function tunnelfullheight()
    turtle.turnLeft()
    heightmod = height - 2
    for a=1,heightmod,1 do
        dig()
        digUp()
        turtle.up()
    end
    dig()
    flip()
    hightmod = height - 1
    for a=1,heightmod,1 do
        dig()
        digDown()
        turtle.down()
    end
    dig()
    flip()
    dig()
    turtle.turnRight()
end
function first2layers()
    --First Layer
    turtle.turnLeft()
    heightmodfirst = height - 4
    for a=1,heightmodfirst,1 do
        dig()
        digUp()
        turtle.up()
    end
    dig()
    flip()
    hightmodfirst = height - 3
    for a=1,heightmodfirst,1 do
        dig()
        digDown()
        turtle.down()
    end
    dig()
    flip()
    dig()
    turtle.turnRight()
    --Second Layer
    turtle.turnLeft()
    heightmodsecond = height - 3
    for a=1,heightmodsecond,1 do
        dig()
        digUp()
        turtle.up()
    end
    dig()
    flip()
    hightmodsecond = height - 2
    for a=1,heightmodsecond,1 do
        dig()
        digDown()
        turtle.down()
    end
    dig()
    flip()
    dig()
    turtle.turnRight()
end
function stairdown()
    depth = depth - 2
    if depth <= 2 then
        first2layers()
    else
        first2layers()
        depth = depth - 1
        for y = 1,depth,1 do
            tunnelfullheight()
            forward()
        end
        tunnelfullheight()
    end
end
function stairshelp()
        print("Welcome to Stairs")
        print("This Program will build a custom 3 wide staircase.")
        print("Please Enter run the program with depth and Height as arguments")
        print("Example:")
        print("stairs 20 6")
        print("This will make a stair case with a")
        print("Width of 3")
        print("Height of 6")
        print("Going 20 blocks into the Ground")
        return
end

--Main Program Logic
--stairshelp()
checkheight()
stairdown()