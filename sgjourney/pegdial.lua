gate = peripheral.find("basic_interface")
--This finds some interface connected to the
--computer network, but since that one is the only
--one connected, it will always be that one near the gate

function dial(address)
    local addressLength = #address
    local start = gate.getChevronsEngaged() + 1
    for chevron = start,addressLength,1
    do
        local symbol = address[chevron]
        -- if chevron % 2 == 0 then
        --     gate.rotateClockwise(symbol)
        -- else
        --     gate.rotateAntiClockwise(symbol)
        -- end
        -- while(not gate.isCurrentSymbol(symbol))
        -- do
        --     sleep(0)
        -- end
        -- sleep(1)
        -- gate.raiseChevron() --This raises the chevron
        -- sleep(1)
        -- gate.lowerChevron() -- and this lowers it
        -- sleep(1)
        gate.engageSymbol(symbol)
    end
end

abydosAddress = {26,6,14,31,11,29,0}
chulakAddress = {8,1,22,14,36,19,0}
lanteaAddress = {18,20,1,15,14,7,19}
overworld = {27,25,4,35,10,28}

print("Avaiting input:")
print("1 = Abydos")
print("2 = Chulak")
print("3 = Lantea")
print("4 = Overworld")

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
else
    print("Invalid input")
end
