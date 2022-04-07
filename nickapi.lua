--[[This is an api that should have all my commonly used functions.
	These are propably not going to be used in an API style use case, I am probably going
	to use this more as a repo that I can copy functions out of]]

-- This group is dig functions. They should be able to handle falling blocks. They will fail with blocks spawning like running into a natural cobblegen
function digUp()
    while turtle.detectUp() == true do
		turtle.digUp()
	end
end
function dig()
    while turtle.detect() == true do
		turtle.dig()
	end
end
function digDown()
    while turtle.detectDown() == true do
		turtle.digDown()
	end
end
-- End Dig group

-- This Function will roll through the inventory and refuel.
function fuelcheck()
	local fuelstart = turtle.getFuelLevel()
	if turtle.getFuelLevel() ~= "unlimited" then
    	if turtle.getFuelLevel() <= 100 then
			for nSlot = 1,16,1 do
				turtle.select(nSlot)
				turtle.refuel()
			end
			local fuelend = turtle.getFuelLevel()
			turtle.select(1)
			if fuelstart == fuelend then error("Out of Fuel") end
		end
	end
end
--End Fuel Function

--Functions to handle being told to movement but there is a block in the way
function forward()
	while turtle.forward() == false do
		turtle.dig()
	end
end
function up()
	while turtle.up() == false do
		turtle.digUp()
	end
end
function down()
	while turtle.down() == false do
		turtle.digDown()
	end
end
--End Blocked Movement Functions


directiondig = nil
directiondetect = nil

if args[1] == "r" then
	directiondig = turtle.digUp()
	directiondetect = turtle.detectUp()
end
if args[1] == "f" then
	directiondig = turtle.digDown()
	directiondetect = turtle.detectDown()
end