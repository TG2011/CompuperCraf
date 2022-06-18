args = {...}
dimensions = 9
height = 6
stock = 0
neededblocks = 225

function forward()
    while turtle.forward() == false do turtle.dig() end
end
function placedown()
    turtle.digDown()
    while turtle.placeDown() == false do findnextstack()  end
end

function findnextstack()
    for i=1,16 do
        turtle.select(i)
        if turtle.getItemCount(i) ~= 0 then
            break
        end
    end
end

function layer()
    for i=1,4 do
        for n = 1,dimensions-1 do
            forward()
            placedown()
        end
        turtle.turnRight()
    end
end

function checkinventory()
    for j = 1,16 do
        turtle.select(j)
        stock = stock + turtle.getItemCount()
    end
    if stock <= neededblocks then
        extrablocks = neededblocks - stock
        print("Please Provide ", extrablocks," more blocks to Build Structure")
        error()
    end
end

function moveup()
    while turtle.up() == false do turtle.digUp() end
end

function wall()
    moveup()
    for o = 1,height-1 do
        layer()
        moveup()
    end
    layer()
end
function roof()
    forward()
    turtle.turnRight()
    forward()
    for t=1,4 do
        for u=1,dimensions-3 do
            forward()
            placedown()
        end
        turtle.turnLeft()
    end
    cross = (dimensions-3)/2
    for y=1,cross do
        forward()
    end
    turtle.turnLeft()
    for u=1,dimensions-4 do
        forward()
        placedown()
    end
    turtle.back()
    turtle.back()
    turtle.turnRight()
    forward()
    forward()
    forward()
    turtle.turnRight()
    turtle.turnRight()
    for u=1,dimensions-4 do
        forward()
        placedown()
    end
    forward()
    forward()
    turtle.turnLeft()
    for p=1,dimensions-4 do
        forward()
    end
    for k=1,height do
        turtle.down()
    end
end

checkinventory()
wall()
roof()