local skynet = require "skynet"
local cluster = require "cluster"

skynet.start(function()
    local sdb = skynet.newservice("simpledb")
	cluster.register("sdb", sdb)
    print(skynet.call("sdb", "lua", "SET", "a", "foobar"))
    print(skynet.call("sdb", "lua", "GET", "a"))
    cluster.open "db"
end)
