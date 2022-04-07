-- ORIGINAL PASTEBIN
-- https://pastebin.com/eta8RSCJ
-- Source Youtube video
-- https://www.youtube.com/watch?v=qF11NEJbt4E

term.clear()
term.setCursorPos(10,13)
print("Press Space to exit!")

--    ______   ______
--   | === || | I'm  |
--   |   /||| |gonna |   This program made by me
--   |  / |||< do it!|   all rights reserved or whatever
--   |_/___|| |______|   (for legal reasons this is a joke)

local speaker = peripheral.find("speaker")
local speaker = peripheral.find("speaker")
local music = {{8,.1}, {12,.1}, {20,.1}, {8,.1}, {12,.1}, {20,.1}, {11,.1}, {18,.1}, {23,.1},{11,.1}, {18,.1}, {23,.1}} -- Alarm tone that goes between 2 chords
local normalLore = "The fabled prize awaits at the bottom..."
local lootDrop = false --Makes alarm tone if barrel with abnormal lore found!



-- The Item Sorter
function detect()
	local hasBlock, blockData = turtle.inspect()
	local nothingLeft = false
	local suckyWorks = turtle.suck()
	item = turtle.getItemDetail(1,true)

	if item == nil then
		if suckyWorks == true then
			speaker.playSound("minecraft:entity.generic.drink")
		elseif hasBlock == true then
			turtle.dig()
		else
			nothingLeft = true
		end
		
    elseif item.displayName == "Barrel" then
	    	barrelDetected()
    else
		local x, y = string.find(item.name,":")
        print("Found a "..string.sub(item.name,x+1,-1).."!                                                      ")
        turtle.dropDown()
    end
	
	if nothingLeft == true then		
		barrelSwap()
	end
end



-- The Barrel Descerner
function barrelDetected()
	local item = turtle.getItemDetail(1,true)

    if item.lore ~= nil then
		if item.lore[1] == normalLore then
			print("Found a Bottomless Barrel!            ")
			turtle.transferTo(16)
		else
			print("FOUND SOMETHING NEW!            ")
			turtle.dropUp()
			lootDrop = true
		end
    else
        print("Found a Normal Barrel!                ")
        turtle.dropDown()
    end
end


-- Spits the Infinibarrel back out
function barrelSwap()
	turtle.select(16)
	turtle.place()
	turtle.select(1)
end



-- Noisemaker
function noiseMachine()
    while lootDrop == true do
        for i = 1,12 do 
            speaker.playNote("pling",100,music[i][1])
            os.sleep(music[i][2])
        end
    end
end



function quitEvent()
	repeat
        local _, key = os.pullEvent("key_up")
    until key == keys.space
end


-- The heart of the matter
function everythingHere()
	while true do
		if lootDrop == false then
			term.setCursorPos(2,2)
			detect()
--			sleep(1) -- enable this to something if you want to slow the process down!
		elseif lootDrop == true then
			noiseMachine()
		end
	end
end

parallel.waitForAny(everythingHere, quitEvent)
term.clear()
term.setCursorPos(1,1)
print("Barrel Filter Terminated!")
