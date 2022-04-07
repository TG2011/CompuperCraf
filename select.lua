--[[Simple program to select a slot in turtle's inventory]]
args = {...}
slot = tonumber(args[1])
if slot>=17 then 
    turtle.select(1)
    print("Please select a slot between 1 and 16")
    error()
end
if args[1] == nil then turtle.select(1) else turtle.select(slot) end