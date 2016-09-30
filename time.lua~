local skynet = require "skynet"
skynet.start(function()
    print("....begin....")

    print(skynet.now())

    print("test time")

    skynet.timeout(100, function()
        print("hello timeout wakeup!!!", skynet.now())
    end)
    print("....end....")
end)
