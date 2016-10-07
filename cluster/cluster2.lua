local skynet = require "skynet"
local cluster = require "cluster"

skynet.start(function()
	local sdb = cluster.query("db", "sdb")	
    local proxy = cluster.proxy("db",sdb)
	--print(cluster.call("db", sdb, "GET", "a"))    
    print(skynet.call(proxy, "lua", "GET", "a"))
end)
