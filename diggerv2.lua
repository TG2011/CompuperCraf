--[[
    This is a Wrapper for the stairs and tunneler program. The Tunneler goes by custometunneler.lua on github and is downloaded as tunneler via the install script.
]]
args = {...}
--Use for t for tunnel or s for stairs
opt1 = args[1]
--Use this as a number to indicate length for stairs/tunnel
depth = args[2]
--Unused Argument for Possible Expansion
opt3 = args[3]



if opt1=="t" or opt1=="T" then
    shell.run("tunneler",depth)
else
    if opt1=="s" or opt1=="S" then
        shell.run("stairs",depth)
    else
        print("First Arg Should be t or s for tunnel or stairs")
        print("Second Arg Should be Length/depth")
    end
end