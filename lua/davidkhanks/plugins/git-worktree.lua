local status, git_worktree = pcall(require,"git-worktree")
if not status then
    print("git-worktree not installed")
    return
end

git_worktree.setup()
