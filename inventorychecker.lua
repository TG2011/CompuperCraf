--Config Options
side = "back" -- This is the side that the storage to be monitored is on
alertside = "top" -- The side to do redstone on
openspace = 5 -- number of open spaces to keep in the inventory before setting redstone output
full = false -- the setting for redstone output when the inventory is considered full
open = true -- the setting for redstone output when the inventory still has avaiable space
--Needed Variables
chest = peripheral.wrap(side)
maxsize = chest.size()


function checkstock()
    local count = 0
    for _ in pairs(chest.list()) do count = count + 1 end
    term.clearLine()
    term.setCursorPos(1,3)
    term.write(count)
    if count >= maxsize-openspace then
        redstone.setOutput(alertside,false)
    else
        redstone.setOutput(alertside,true)
    end
end

term.clear()
term.setCursorPos(1,1)
term.write("Current Number of slots Used in Inventory")
term.setCursorPos(1,3)

while true do
    checkstock()
    sleep(10)
end
