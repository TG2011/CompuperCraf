Full = false
args = {...}
opt1 = args[1]
storagedirection = args[2]

function storage()
    freespace = 0
    for n = 1,16,1 do
        turtle.getItemSpace(n)
        freespace = freespace + turtle.getItemSpace(n)
    end
    if freespace > 0 then
        bFull = false
    else
        bFull = true
    end
end
function unload()
    for slot = 1,16,1 do
        turtle.select(slot)
        if storagedirection == "up" then
            turtle.dropUp()
        elseif storagedirection == "down" then
            turtle.dropDown()
        else
            turtle.dropUp()
        end
    end
end
function digging()
    while bFull == false do
        storage()
        turtle.dig()
    end
end
function screensetup()
    term.clear()
    term.clear()
    term.setCursorPos(1,1)
    term.write("Block Break Mode")
    term.setCursorPos(1,3)
    term.write("Please stand back")
end
screensetup()
if opt1 == "always" then
    while true do
        digging()
        unload()
    end
else
    digging()
    term.setCursorPos(1,4)
    print("I am Full, Time to Stop")
end