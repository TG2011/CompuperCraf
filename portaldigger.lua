args = {...}
opt1 = args[1]
opt2 = args[2]
opt3 = args[3]

function neather()
	--Starting From Bottom Left of Portal Location
	turtle.dig()
	turtle.forward()
	turtle.turnRight()
	turtle.dig()
	turtle.digUp()
	turtle.up()
	turtle.digUp()
	turtle.up()
	turtle.digUp()
	turtle.up()
	turtle.digUp()
	turtle.up()
	turtle.dig()
	turtle.forward()
	turtle.dig()
	turtle.forward()
	turtle.dig()
	turtle.forward()
	turtle.turnRight()
	turtle.turnRight()
	turtle.digDown()
	turtle.down()
	turtle.digDown()
	turtle.down()
	turtle.digDown()
	turtle.down()
	turtle.digDown()
	turtle.down()
	turtle.dig()
end

if opt1=="neathr" or opt1=="n" then
	neather()
else
	print("Please Enter n for Neather Portal Style Portals")
end
