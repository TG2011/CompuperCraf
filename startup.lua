function addpath()
  if string.find(shell.path(),"nickprog") then
    print("Already added to Path")
  else
    shell.setPath(shell.path() .. ":/nickprog")
    --print("Updated System Path")
  end
end
function runprogram()
  shell.run("NAME OF PROGRAM")
end
function autostart()
  if fs.exists("/autostart") then
    shell.run("autostart")
  end
end

addpath()
autostart()