local status, lualine = pcall(require,"lualine")
if not status then
    print("lualine not installed")
    return
end

lualine.setup({
    sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        }
    },
})
