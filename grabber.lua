-- This program is going to take whatever item is in the first slot of the turtle and then look for it in the attached storage and then suck it out.
-- This means that you will need atleast one of the wanted item in the first slot of the turtle for it to grab them.

chestdirection = 'front'
chest = peripheral.wrap(chestdirection)

-- this function will determine the wanted item from the inventory and then print it to the screen
function finditem()
    pork = turtle.getItemDetail(1)
    --term.clear()
    term.setCursorPos(1,1)
    print("Grabbing",pork.name,"From Inventory")
end

-- this is just a sample function to that was used for reference, can be safley ignored
--[[
function test()
    for slot, item in pairs(chest.list()) do
        print(("%d x %s in slot %d"):format(item.count, item.name, slot))
    end
end
]]

--This function is where the magic actually happens. it does the searching of the inventory table and then pulls the releavent item out.
function itempuller()
    while true do
        term.setCursorPos(1,4)
    for slot, item in pairs(chest.list()) do
        --print(item.name)
        --error()
        if item.name == pork.name then
            term.clearLine()
            print("Found", item.name,", Grabbing")
            turtle.select(1)
            turtle.suck()
        else
            term.clearLine()
            print("Found ", item.name," Ignoring")
        end
    end
    end
end

--Main Function Execution
term.clear()
finditem()
itempuller()