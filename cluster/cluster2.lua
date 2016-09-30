local skynet = require "skynet"
local cluster = require "cluster"

skynet.start(function()
    local proxy = cluster.proxy("db",".simpledb")
    print(skynet.call(proxy, "lua", "GET", "a"))
end)
