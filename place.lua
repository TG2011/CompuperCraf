--[[Simple Place program that will let you place the item/block from the currently selected slot]]

args = {...}
if arg[1] == "down" then turtle.placeDown() end
if arg[1] == "dn" then turtle.placeDown() end
if arg[1] == "up" then turtle.placeUp() end
if arg[1] == "forward" then turtle.place() end
if arg[1] == "fd" then turtle.place() end
if arg[1] == nil then turtle.place() end