function string.split(input,delimit)
	local t = {}
	local string = tostring(input)
	local delimiter = tostring(delimit) or ""
	if delimiter and delimiter ~= "" then
		while string:find(delimiter) do
			local beginning, ending = string:find(delimiter)
			table.insert(t,string:sub(1,beginning-1))
			string = string:sub(ending+1)
		end
		if not string:find(delimiter) then
			if string ~= "" then
				table.insert(t,string)
			end
		end
	else
		for i = 1, #string do
			table.insert(t,string:sub(i,i))
		end
	end

	return t
end

function table.count(t)
	if t then
		local count = 0
		for k,v in pairs(t) do
			count=count+1
		end
		return count
	end
end
function table.find(t,val)
	if t then
		for k,v in pairs(t) do
			if val == v then
				return k
			end
		end
	end
end
function firstempty(t)
	for i=1,#t+1 do
		if not t[i] then
			return i
		end
	end
end

function loadlist(dir)
	local t = {}
	local file = io.open(dir)
	if file then
		for line in file:lines() do
			table.insert(t,line)
		end
	end
	return t
end

function savelist(list,dir)
	local file = io.open(dir,"w")
	for i=1,#list do local v = list[i]
		if v then
			file:write(v.."\n")
		end
	end
	file:close()
end


function escapeChat(str)
	local e=str or ""
	e=e:gsub("%#","<pound>");
	e=e:gsub("%&","<and>");
	e=e:gsub("%%","<percent>");
	e=e:gsub("%$","<dollar>");
	e=e:gsub("%#","<num>");
	return e
end
function unescapeChat(str)
	local e=str or ""
	e=e:gsub("<pound>","%#");
	e=e:gsub("<and>","%&");
	e=e:gsub("<percent>","%%");
	e=e:gsub("<dollar>","%$");
	e=e:gsub("<num>","%#");
	return e
end


function hexToString(hex)
	local str = ""
	for i=1,#hex,2 do
		str = str .. string.char( tonumber(hex:sub(i,i+1),16) )
	end
	return str
end

--Fantacrypt algorithm.
local bit = require "bit"
local C1 = 53761
local C2 = 32618
function decryptStr(str, key)
	local k = key
	local final = ""
	for i=1,#str do
		local char = string.byte(str:sub(i,i))
		final = final..string.char( bit.bxor( char, bit.rshift(k,8) ) % 256 )
		k = math.floor((char + k) * C1) + C2
	end
	return final
end

function customsend(socket,msg)
	socket:send(msg,1,#msg)
end
function botmessage(socket,message)
	buffersend(socket,"CT#"..escapeChat(serverooc).."#"..escapeChat(message).."#%")
end

function getbytes(str)
	local t = {}
	for i=1,#str do
		table.insert(t,string.byte(str:sub(i,i)))
	end
	return unpack(t)
end

function wspayloaddecode(dat)
	if dat == "" or not dat then return nil end
	local p = 0
	
	local byteA,byteB = getbytes(dat:sub(p+1,p+2))
	--local byteB = string.byte(dat:sub(p+2,p+2))
	local FIN = bit.band(byteA,0x80) ~= 0
	local OPCODE = bit.band(byteA,0x0F)
	local MASKED = bit.band(byteB,0x80) ~= 0
	local LENGTH = bit.band(byteB,0x7F)
	p = p + 2
	if LENGTH == 126 then
		local a,b = getbytes(dat:sub(p+1,p+2))
		LENGTH = bit.bor(bit.lshift(a,8),b)
		p = p + 2
	elseif LENGTH == 127 then

		local a,b,c,d,e,f,g,h = getbytes(dat:sub(p+1,p+8))
		--Lua doesn't support 64-bit integers.
		LENGTH = bit.bor(bit.lshift(e,24),bit.lshift(f,16),bit.lshift(g,8),h)
		p = p + 8
	end
	local MASKKEY
	if MASKED then
		local a,b,c,d = getbytes(dat:sub(p+1,p+4))
		MASKKEY = {a,b,c,d}
		--MASKKEY = bit.bor(bit.lshift(a,24),bit.lshift(b,16),bit.lshift(c,8),d)
		p = p + 4
	end
	local PAYLOAD = dat:sub(p+1,p+LENGTH)
	
	local data = ""
	if MASKED then
		for i=1,LENGTH do
			local j = (i-1) % 4 + 1
			local byte = string.byte(PAYLOAD:sub(i,i))
			if byte then
				data = data .. string.char(bit.bxor(byte,MASKKEY[j]))
			end
		end
	else
		data = PAYLOAD
	end
	return data,OPCODE,MASKED,FIN
end

function wspayloadencode(dat,opcode,masked,fin)
	local encoded = ""
	
	local OPCODE = opcode or 1
	local byteA = OPCODE
	if fin then byteA = bit.bor(byteA,0x80) end
	encoded = encoded .. string.char(byteA)
	
	local byteB = 0
	local bytes = {}
	if masked then byteB = bit.bor(byteB,0x80) end
	
	if #dat < 126 then
		byteB = bit.bor(byteB,#dat)
	elseif #dat < 0xFFFF then
		byteB = bit.bor(byteB,126)
		table.insert(bytes,bit.rshift(#dat,8))
		table.insert(bytes,bit.band(#dat,0xFF))
	else
		byteB = bit.bor(byteB,127)
		table.insert(bytes,bit.band(bit.rshift(#dat,24),0xFF))
		table.insert(bytes,bit.band(bit.rshift(#dat,16),0xFF))
		table.insert(bytes,bit.band(bit.rshift(#dat,8),0xFF))
		table.insert(bytes,bit.band(#dat,0xFF))
	end

	local bytechars = ""
	for i=1,#bytes do bytechars = bytechars .. string.char(bytes[i]) end
	encoded = encoded .. string.char(byteB) .. bytechars
	
	if masked then
		local data = ""
		local MASKKEY = {math.random(0,0xFF),math.random(0,0xFF),math.random(0,0xFF),math.random(0,0xFF)}
		for i=1,#MASKKEY do
			encoded = encoded .. string.char(MASKKEY[i])
		end
		for i=1,#dat do
			local j = (i-1) % 4 + 1
			data = data .. string.char(bit.bxor(string.byte(dat:sub(i,i)),MASKKEY[j]))
		end
		encoded = encoded..data
	else
		encoded = encoded..dat
	end
	
	return encoded
end