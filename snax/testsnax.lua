local skynet = require "skynet"
local snax = require "snax"

skynet.start(function()
	local ps = snax.newservice ("snaxserver", "hello world")
	print(ps.req.welcome("linrn"))
	print(ps.post.hello())
	print("Hotfix (i) :", snax.hotfix(ps, [[

local i
local hello

function accept.hello()
	i = i + 1
	print ("fix", i, hello)
end

function hotfix(...)
	local temp = i
	i = 100
	return temp
end

	]]))
	print(ps.post.hello())


	print(ps.post.exit("exit")) -- == snax.kill(ps, "exit")
	skynet.exit()
end)
