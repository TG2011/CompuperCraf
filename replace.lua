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
columnnumber = 1
slotnum = 1
loop = 0
stock = 0

if args[1] == "r" or "roof" or "up" then
    direction = "up"
elseif args[1] == "f" or "floor" or "down" then
    direction = "down"
else
    print("Usage is:")
    print("replace <direction> <length> <width>")
    error()
end

function helper()
    if args[1] == "help" then
        local Success, Data
        Success,Data=turtle.inspectDown()
        print("Place the turtle on the front left corner of the area to replace the floor")
        print("Arguments (help/set) Length Width")
        print("You can use the set argument before the dimensions to use the floor material bellow the turtle to be the replacement material rather then editing the program file")
        print("")
        print("Current Floor material is "..Data.name)
        error()
    end
end
function setfloormat()
    local Success, Data
    Success,Data=directioninspect()
    --print("Would You like to use ".. Data.name .. " as you replacement material?")
    --print("y/n")
    --local input = read()
    --if input == "y" then
        flooritem = Data.name
        length = args[3]
        width = args[4]
    --else
        --error()
    --end
end

function directionplace()
    if direction == "up" then
        turtle.placeUp()
    elseif direction == "down" then
        turtle.placeDown()
    else
        print('No Direction Selected')
        error()
    end
end
function directiondig()
    if direction == "up" then
        turtle.digUp()
    elseif direction == "down" then
        turtle.digDown()
    else
        print('No Direction Selected')
        error()
    end
end
function directioninspect()
    if direction == "up" then
        turtle.inspectUp()
    elseif direction == "down" then
        turtle.inspectDown()
    else
        print('No Direction Selected')
        error()
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
        directionplace()
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
                directionplace()
                break
            end
        end
    end
end

function replacetile()
    directiondig()
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
    turtle.forward()
    for y=1,width-1,1 do
        lenghrun()
        shiftturn()
    end
    lenghrun()
end

function returnhome()
    if (columnnumber % 2 == 0) then
        if turtle.detect() then turtle.dig() end
        print("Done")
    else
        for u=1,length-1,1 do
            turtle.back()
            print("Done")
        end
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
setfloormat()
print("Floor Size: " .. length*width)
checkstock()
replacefloor()
returnhome()