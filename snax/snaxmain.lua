local skynet = require "skynet"
local snax = require "snax"


skynet.start(function()
	skynet.error("snax start")
	skynet.newservice("debug_console",8000)
        local ps = snax.newservice("snaxserver", "hello world")

end)
