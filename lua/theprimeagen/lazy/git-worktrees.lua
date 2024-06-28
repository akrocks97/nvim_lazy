return {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local Worktree = require("git-worktree")
        local Job = require("plenary.job")
        -- op = Operations.Switch, Operations.Create, Operations.Delete
        -- metadata = table of useful values (structure dependent on op)
        --      Switch
        --          path = path you switched to
        --          prev_path = previous worktree path
        --      Create
        --          path = path where worktree created
        --          branch = branch name
        --          upstream = upstream remote name
        --      Delete
        --          path = path where worktree deleted

        local function updateGitSubmodules(path)
            local command = string.format(":!cd ".. path .. "&& git submodule update --init --recursive")
            vim.cmd(command)
        end

        local function createNewTmuxWindow(path)
            local command = string.format(":!sh ~/.config/tmux/scripts/tmux-windowizer.sh " .. path)
            vim.cmd(command)
        end

        Worktree.on_tree_change(function(op, metadata)
            if op == Worktree.Operations.Switch then
                print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
                createNewTmuxWindow(metadata.path)
            end
            if op == Worktree.Operations.Create then
                print("Created new worktree ")
                updateGitSubmodules(metadata.path)
            end
        end)


        vim.keymap.set("n", "<leader>gtt", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {desc='[G]it [W]orktree'})
        vim.keymap.set("n", "<leader>gta", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", {desc='[G]it [W]orktree [A]dd'})

    end
}
