--I got most of the server program set up in 3 days, it's neat that it's so easy to make!
print("Loading data...")

math.randomseed(os.time())
math.random()math.random()

path = debug.getinfo(1, "S").source:sub(2,-9)
local socket = require("socket")

dofile(path.."settings/settings.lua")

print("Starting server...")
server = assert(socket.bind(servip,servport))
server:settimeout(0)

function reload()
	dofile(path.."settings/settings.lua")

	dofile(path.."helper.lua")
	dofile(path.."loop.lua")
	dofile(path.."process.lua")
end
reload()

dofile(path.."masterserver.lua")
if advertise then masterserver:connect(mservip,mservport) end

print("Server started! Now listening.")

while true do
	local suc,err = pcall(loop)
	if not suc then print("FATAL SERVER ERROR: Reloading!",err);reload() end
	
	masterserver:update()
	
	socket.sleep(rate)
end
