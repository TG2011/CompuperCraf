local moniter = peripheral.wrap('top')
local function getTime()
   time = os.time()
   moniter.clear()
   moniter.setCursorPos(1, 3)
   moniter.write(textutils.formatTime(time, bTwentyFourHour))
end
while true do
   getTime()
   sleep(0.75)
end