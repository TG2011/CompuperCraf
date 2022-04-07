--Name of System or "Program" you want to have displayed while running
ProgramName = "Farming Program V1.0"
--How Long to Keep the Redstone Signal On for
ondelay = 5
--How Long of a delay to have the signal Off for
offdelay = 600
--the Side to output the signal on
side = "back"
--Run Counter
a = 0

term.clear()
term.setCursorPos(1,1)
term.write(ProgramName)
term.setCursorPos(1,3)
term.write("Press and Hold CTRL+T to End")
term.setCursorPos(1,5)
term.write("Press and Hold CTRL+R to Restart Station")
while true do
    redstone.setOutput(side,true)
    sleep(ondelay)
    redstone.setOutput(side,false)
    a=a+1
    term.setCursorPos(1,15)
    term.write("Run: ")
    term.setCursorPos(6,15)
    term.write(a)
    sleep(offdelay)
end