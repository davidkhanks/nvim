local status, neoscroll = pcall(require,"neoscroll")
if not status then
    print("neoscroll not installed")
    return
end

neoscroll.setup()
