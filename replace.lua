--[[This program will replace the floor with another material
You will have to set the material of the floor in the argument bellow called "flooritem".
Working on making it a table so it can compare against a list of options but for now you can use the help option
to get the current floor type name so you can edit this variable to make it quicker to switch]]

--Floot Material Name
--flooritem = ("minecraft:cobblestone_slab")
flooritem = ("minecraft:smooth_stone")
-- Arguments
args = {...}
length = args[2]
width = args[3]
direction = args[1]
columnnumber = 1
slotnum = 1
loop = 0
stock = 0

function digdirection()
    if direction == "roof" then
        turtle.digUp()
    elseif direction == "floor" then
        turtle.digDown()
    else
        print("Please State Floor or Roof")
        error()
    end
end

function inspectdirection()
    if direction == "roof" then
        turtle.inspectUp()
    elseif direction == "floor" then
        turtle.inspectDown()
    else
        print("Please State Floor or Roof")
        error()
    end
end

function placedirection()
    if direction == "roof" then
        turtle.placeUp()
    elseif direction == "floor" then
        turtle.placeDown()
    else
        print("Please State Floor or Roof")
        error()
    end
end

function defaultitem()
    turtle.select(1)
    firstslot = turtle.getItemDetail()
    flooritem = firstslot.name
end

function helper()
    if args[1] == "help" then
        local Success, Data
        Success,Data=inspectdirection()
        print("Place the turtle on the front left corner of the area to replace")
        print("Arguments")
        print("replace [floor|roof] [L] [W]")
        --print("You can use the set argument before the dimensions to use the floor material bellow the turtle to be the replacement material rather then editing the program file")
        print("")
        print("Current Floor material is "..Data.name)
        error()
    end
end
function setfloormat()
    for _, v in pairs(args) do
		if v == "set" then
    --if args[1] == "set" then
            local Success, Data
            Success,Data=inspectdirection()
            print("Would You like to use ".. Data.name .. " as you replacement material?")
            print("y/n")
            local input = read()
            if input == "y" then
                flooritem = Data.name
                --length = args[2]
                --width = args[3]
            else
                error()
            end
            return
        end
    end
end

--[[ function isJunkBlock()
    local Success, Data
    Success,Data=turtle.inspectDown()
    if Data.name == flooritem then
        print(Data.name)
    else
        print(Data.name .. "fuck")
    end
end ]]

function checkslot()
    local Data
    Data=turtle.getItemDetail(1)
    if Data.name == flooritem then
        placedirection()
    else
        print("no can do")
    end
end

function placefloor()
    for i=1,16 do
        local Data
        local loopcount = 0
        Data=turtle.getItemDetail(i)
        if Data ~= nil then
            if Data.name == flooritem then
                turtle.select(i)
                placedirection()
                break
            end
        end
    end
end

function replacetile()
    digdirection()
    placefloor()
end

function lenghrun()
    replacetile()
    for t=1,length-1 do
        while turtle.detect() do turtle.dig() end
        turtle.forward()
        replacetile()
    end
end

function shiftturn()
    columnnumber = columnnumber+1
    if (columnnumber % 2 == 0) then
        turtle.turnRight()
        while turtle.detect() do turtle.dig() end
        turtle.forward()
        turtle.turnRight()
    else
        turtle.turnLeft()
        while turtle.detect() do turtle.dig() end
        turtle.forward()
        turtle.turnLeft()
    end
end

function replacefloor()
    while turtle.detect() do turtle.dig() end
    --turtle.forward()
    for y=1,width-1,1 do
        lenghrun()
        shiftturn()
    end
    lenghrun()
end

function returnhome()
    if (columnnumber % 2 == 0) then
        --if turtle.detect() then turtle.dig() end
        print("Done")
    else
        for u=1,length-1,1 do
            turtle.back()
        end
        turtle.turnLeft()
        turtle.turnLeft()
        print("Done")
    end
end

function checkstock()
    for i=1,16 do
        local Data
        Data=turtle.getItemDetail(i)
        if Data ~= nil then
            if Data.name == flooritem then
                stock = stock+Data.count
            end
        end
    end
    if stock < length*width then
        term.clear()
        term.setCursorPos(1,1)
        print("Need more items")
        print("")
        print("Please Provide "..(length*width)-stock .. " more " .. flooritem)
        error()
    end
end

helper()
defaultitem() -- should set the floor item based on the first slot
setfloormat()
print("Area Size: " .. length*width)
checkstock()
replacefloor()
returnhome()