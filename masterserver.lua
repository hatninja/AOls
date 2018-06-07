local socket = require"socket"
masterserver = {}

function masterserver:connect(ip,port)
	print("Connecting to the master server...")
	local client = socket.connect(ip,port)
	if client then
		client:settimeout(0)
		--client:setoption('keepalive',false)
		print("Connected to master server, now advertising.")
		
		masterserver:makeHeartbeat()
		customsend(client,masterserver.heartbeat)

		masterserver.client = client
		
		masterserver.lastupdate = os.time()
		--masterserver.lastping = os.time()
	else
		print("Could not connect to master server!")
	end
end

function masterserver:update()
	local client = masterserver.client
	if not client then return end
	
	--if os.time() > masterserver.lastupdate+60*60*12 then
		--print("Listing might be removed... re-advertising.")
		--customsend(client,masterserver.heartbeat)
		--masterserver.lastupdate = os.time()
	--end
	
	--[[if os.time() >= masterserver.lastping+3 then
		customsend(client,"PING#%")
		masterserver.lastping = os.time()
	end]]
	
	local buffer = ""
	repeat
		local c,err = client:receive(1)
		--[[if c then
			buffer = buffer .. c
		end]]
		if err == "closed" and os.time() > masterserver.lastupdate+60*20 then
			print("Connection with masterserver was closed!")
			masterserver:connect(mservip,mservport)
			masterserver.lastupdate = os.time()
		end
	until not c
	
	--[[repeat
		local st,en = buffer:find("%%")
		if st then
			local subcommand = buffer:sub(1,st-1)
			
			if subcommand == "PSDD#0#" then --Heartbeat success
			elseif subcommand == "CHECK#" then --Seems to be sent often
				--customsend(client,"PING#%")
			elseif subcommand == "PONG#" then --A reply to PING#%
			elseif subcommand:find("NOSERV#") then --Apparently also a reply to PING#%
				print("Listing was removed, now re-advertising.")
				customsend(client,masterserver.heartbeat)
			else
				--print("Masterserver: "..subcommand)
			end
			
			buffer = buffer:sub(en+1,-1)
		end
	until not st]]
end

function masterserver:makeHeartbeat()
	local heartbeat = "SCC#"..mservport.."#"..servname.."#"..servdesc.."#AOls#%"
	masterserver.heartbeat = heartbeat
end