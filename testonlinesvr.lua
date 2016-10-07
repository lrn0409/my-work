local skynet = require "skynet"
local snax = require "snax"

skynet.start(function()
	local ps = snax.newservice ("snaxsvrtest", "hello online service")
	print(ps.req.getOnlineUsersNum("foobar"))
	print(ps.post.addOnlineUsersNum(100))
	--print(pcall(ps.req.error))
	print("Hotfix (i) :", snax.hotfix(ps, [[

local i

function response.getOnlineUsersNum()
	print("fix :::::: online Users Num = ",i)
	return i
end

function hotfix(...)
	local temp = i
	i = 1000
	return temp
end

	]]))
	print(ps.req.getOnlineUsersNum())

	local info = skynet.call(ps.handle, "debug", "INFO")

	for name,v in pairs(info) do
		print(string.format("%s\tcount:%d time:%f", name, v.count, v.time))
	end

	print(ps.post.exit("exit")) -- == snax.kill(ps, "exit")
	skynet.exit()
end)
