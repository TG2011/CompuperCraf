--[[This is Simply a launcher for the other two replace programs. It will decide and then launch
    the relavent program for the job based on the arguments provided]]

--Floot Material Name
--flooritem = ("minecraft:cobblestone_slab")
flooritem = ("minecraft:smooth_stone")
-- Arguments
args = {...}
direction = args[1]
length = args[2]
width = args[3]
columnnumber = 1
slotnum = 1
loop = 0
stock = 0


function args_checker()
    if args == null then
        term.clear()
        print("Please Enter an Argument")
        print("For instructions please use help or h")
        error()
    end
    if args[1] == "help" then instructions() end
    if args[1] == "h" then instructions() end
end
--instructions
function instructions()
    term.clear()
    print("To use this program")
    print("replace [floor/roof] [Length] [Width] Set")
    print("         Direction                 Optional")
end
function softpicker()
    if direction == "roof" or "r" then
        shell.run("replaceroof",length,width,args[3])
    elseif direction == "floor" or "f" then
        shell.run("replacefloor",length,width,args[3])
    else
        print("Please State Floor or Roof")
        error()
    end
end