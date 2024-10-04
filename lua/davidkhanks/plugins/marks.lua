local setup, comment = pcall(require, "marks")
if not setup then
    return
end

comment.setup()
