local skynet = require "skynet"
local queue = require "skynet.queue"
local snax = require "snax"

local i = 0

function response.getOnlineUsersNum()
	print("online Users Num = ",i)
	return i
end

-- response.sleep and accept.hello share one lock

function accept.addOnlineUsersNum(iNum)
	i = iNum + 1
	print ("addOnlineUsersNum :Now Users Num=",i)

end

function accept.exit(...)
	snax.exit(...)
end

function response.error()
	error "throw an error"
end

function init( ... )
	print ("online  server start:", ...)
	snax.enablecluster()	-- enable cluster call
	-- init queue
	--lock = queue()
end

function exit(...)
	print ("online server exit:", ...)
end
