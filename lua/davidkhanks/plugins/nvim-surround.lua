local status, nvim_surround = pcall(require,"nvim-surround")
if not status then
    print("nvim-surround not installed")
    return
end

nvim_surround.setup()
