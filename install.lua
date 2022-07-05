--[[Installs all my programs

    Updated to handle being instlled from a floppy disk. will also update the install on the floppy disk if it is detected running there.
    This way the installer on the disk is also always at the lastest version.

    For initial install run the following, this will commit the initial installer for use on the computers
    wget https://raw.githubusercontent.com/Chessehead17/ComputerCraft/main/install.lua install
]]

--Setup variables
args = {...}
mydir = "/nickprog" --this is the local directory that will have the programs installed to
root = "/"
ext = ".lua"
disk = "disk" --name of the directory that is the disk, here for future proofing if this name changes
github = "https://raw.githubusercontent.com/Chessehead17/ComputerCraft/main/" -- the base url for git so it doesn't need to be repeated

function help()
    term.clear()
    term.setCursorPos(1,1)
    print("Running install will download My programs and some thirdpart software from the internet to the local.")
    print("You can use the Following Arguments:")
    print("offline: install from in-world disk")
    print("disk: same as normal but instals to disk")
    error()
end

function portablinstall()
    fs.delete("/disk/install")
    fs.delete("/disk/" .. mydir)
    fs.copy(mydir,"/disk")
    fs.copy("/install","/disk/install")
    error()
end

function localinstall()
    term.clear()
    term.setCursorPos(1,1)
    print("Installing from Local Disk....")
    print("Please Wait...")
    print("")
    fs.delete("/install")
    fs.delete(mydir)
    fs.copy("/disk" .. mydir,"/")
    fs.copy("/disk/install","/install")
    print("Offline Install Complete....")
    error()
end

function MyPrograms()
    fs.delete(mydir) -- this will delte my install directory to prepare for redownload of software
    shell.run("wget",github .. "diggerv2" .. ext,mydir .. "/digger")
    shell.run("wget",github .. "stairs" .. ext,mydir .. "/stairs")
    shell.run("wget",github .. "customtunneler" .. ext,mydir .. "/tunneler")
    shell.run("wget",github .. "portaldigger" .. ext,mydir .. "/portaldigger")
    shell.run("wget",github .. "Bridge" .. ext,mydir .. "/bridge")
    shell.run("wget",github .. "dig" .. ext,mydir .. "/dig")
    shell.run("wget",github .. "BlockBreaker" .. ext,mydir .. "/blockbreak")
    shell.run("wget",github .. "ChunkQuarryFixer" .. ext,mydir .. "/fix")
    shell.run("wget",github .. "stairsv2" .. ext,mydir .. "/teststairs")
    shell.run("wget",github .. "pathmaker" .. ext,mydir .. "/pathmaker")
    shell.run("wget",github .. "inventorychecker" .. ext,mydir .. "/inventoryred")
    --shell.run("wget",github .. "replacefloor.lua",mydir .. "/replacefloor") -- has been superseded by replace
    --shell.run("wget",github .. "replaceroof.lua",mydir .. "/replaceroof") -- has been superseded by replace
    shell.run("wget",github .. "replace" .. ext,mydir .. "/replace")
    shell.run("wget",github .. "select" .. ext,mydir .. "/select")
    shell.run("wget",github .. "place" .. ext,mydir .. "/place")
    shell.run("wget",github .. "9x9" .. ext,mydir .. "/9x9")
    shell.run("wget",github .. "grabber" .. ext,mydir .. "/grabber")
    shell.run("wget",github .. "clock" .. ext,mydir .. "/clock")
    shell.run("wget",github .. "grabber" .. ext,mydir .. "/sucker")
    shell.run("wget",github .. "pickyblockbreak" .. ext,mydir .. "/pickyblockbreak")
    fs.delete("/startup") -- delete startup to replace it
    shell.run("wget",github .. "startup.lua /startup") -- download startup
    --Third Party Software
    FrequentlyUsedPrograms()
end

function FrequentlyUsedPrograms()
    --Use the Below template to add programs that you always want downloaded.
    --shell.run("wget","URL","LOCALNAME")
    shell.run("wget",github .. "thirdparty/boxcutter.lua",mydir .. "/boxcutter")
    shell.run("pastebin get https://pastebin.com/E5hWZGNd "..mydir.."/vMiner")
end

function update()
    --this will update the install file in the current running dir, should make it more versitile
    fs.delete(shell.getRunningProgram())
    shell.run("wget",github .. "install.lua install")
    error()
end

if args[1] == "update" then update() end
if args[1] == "help" then help() end
if args[1] == "offline" then localinstall() end
if args[1] == nil then MyPrograms() end
os.reboot() --this is only needed due to install of a startup file, can be removed if startup is not dowloaded anymore