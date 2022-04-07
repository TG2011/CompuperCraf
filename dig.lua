--Because there is no stupid dig command
args = {...}
--[[ if arg[1] == "down" then
    turtle.digDown()
elseif arg[1] == "dn"  then
    turtle.digDown()
elseif arg[1] == "up" then
    turtle.digUp()
else
    turtle.dig()
end ]]

if arg[1] == "down" then turtle.digDown() end
if arg[1] == "dn" then turtle.digDown() end
if arg[1] == "up" then turtle.digUp() end
if arg[1] == "forward" then turtle.dig() end
if arg[1] == "fd" then turtle.dig() end
if arg[1] == nil then turtle.dig() end