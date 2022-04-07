args = {...}
animal = args[1]
food = nil
bEmpty = false

if animal == nil then 
    print("Please enter a Animal")
    error()
end
if animal == "cow" then food = "minecraft:wheat" end
if animal == "sheep" then food = "minecraft:wheat" end
if animal == "pig" then food = "minecraft:carrot" end
if animal == "chicken" then food = "minecraft:wheat_seeds" end
if animal == "horse" then food = "minecraft:golden_carrot" end

function findfood()
	for i=1,16 do
		local Data
		Data=turtle.getItemDetail(i)
		if Data ~= nil then
			if Data.name == food then
				turtle.select(i)
                for u=1,24 do turtle.placeDown() end
				break
			end
		end
	end
	turtle.select(1)
end

function storage()
    freespace = 0
    for n = 1,16,1 do
        turtle.getItemSpace(n)
        freespace = freespace + turtle.getItemSpace(n)
    end
    if freespace >= 512 then
        bEmpty = true
    else
        bEmpty = false
    end
end

term.clear()
term.setCursorPos(1,1)
term.write("ITS BREEDING TIME")
term.setCursorPos(1,3)

while bEmpty == false do
    storage()
    findfood()
    sleep(500)
end
print("Out of Feed")
error()
    