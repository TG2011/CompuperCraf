local arguments = {...}
gate = peripheral.find("basic_interface")
homesymbol = 0
--This finds some interface connected to the
--computer network, but since that one is the only
--one connected, it will always be that one near the gate

function dial(address)
--Milky Way Stargate is a special case when it comes
--to dialing
    
    local addressLength = #address
    --You don't really need to have this variable,
    --I just like to use lots of variables with
    --names to make everything immediately clear
    
    local start = gate.getChevronsEngaged() + 1
    --This is a helpful variable we'll be using to
    --make resuming dialing easier.
    --Basically what this does is it makes the computer
    --check how many chevrons are engaged and start from
    --the next one (that's why there's a +1)
    
    for chevron = start,addressLength,1
    do
        --This is a loop that will go through all the
        --symbols in an address
        
        local symbol = address[chevron]
        
        if chevron % 2 == 0 then
            gate.rotateClockwise(symbol)
        else
            gate.rotateAntiClockwise(symbol)
        end
        --Here we're basically making sure the gate ring
        --rotates clockwise when the number of chevrons
        --engaged is even and counter-clockwise when odd
        
        while(not gate.isCurrentSymbol(symbol)) do
            sleep(0)
        end
        --This effectively ensures the program doesn't
        --do anything else and lets the dialing finish
        --rotating to the correct symbol
        
        sleep(1)
        --We want to wait 1 second before we
        --engage the chevron
        gate.raiseChevron() --This raises the chevron
        sleep(1)
        gate.lowerChevron() -- and this lowers it
        sleep(1)
        
        --Note that from many of the functions here,
        --you can get Stargate Feedback
        
        --For example, the raiseChevron() function will output
        --a number corresponding to some feedback value which you'll
        --be able to find in the video description
        
    end 
end

--Now that we've got a function, this is how we'll run it

--But first we want some addresses

abydosAddress = {26,6,14,31,11,29,0}
chulakAddress = {8,1,22,14,36,19,0}
lanteaAddress = {18,20,1,15,14,7,19}
overworld = {27,25,4,35,10,28,0}
testdirect = {27,1,12,10,9,16,29,35,0}
spawngate = {3,15,33,20,26,14,27,35,0}
citygate = {17,19,18,25,4,11,12,27,0}

--Now let's write the actual part of the program
--that will start the dialing

function ui()
    print("Avaiting input:")
    print("1 = Abydos")
    print("2 = Chulak")
    print("3 = Lantea")
    print("4 = Overworld")
    print("5 = Direct")
    print("6 = Spawn Gate")
    print("7 = City Gate")

    input = tonumber(io.read())
    sleep(0)

    if input == 1 then
        dial(abydosAddress) --We're using the function we wrote earlier
    elseif input == 2 then
        dial(chulakAddress)
    elseif input == 3 then
        dial(lanteaAddress)
    elseif input == 4 then
        dial(overworld)
    elseif input == 5 then
        dial(testdirect)
    elseif input == 6 then
        dial(spawngate)
    elseif input == 7 then
        dial(citygate)
    else
        print("Invalid input")
    end
end

function manualdial()
    function convertTableToNumbers(inputTable)
        outputTable = {}
        for _, value in ipairs(inputTable) do
            numberValue = tonumber(value)
            if numberValue then
                table.insert(outputTable, numberValue)
            end
        end
        return outputTable
    end
    numbersTable = convertTableToNumbers(arguments)
    -- table.insert(arguments, num)
    table.insert(numbersTable,homesymbol)
    manualaddress = numbersTable
    dial(manualaddress)
    -- print(numbersTable)
end


if #arguments > 1 then
    manualdial()
    return
else
    ui()
end