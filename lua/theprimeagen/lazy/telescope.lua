return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                layout_config = {
                    vertical = { width = 0.8 }
                },
                layout_strategy = 'vertical'
            }

        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>frw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles'})
        vim.keymap.set('n', '<C-p>',function()
            builtin.git_files({ git_command = {"git", "ls-files", "--recurse-submodules"}})
        end, {desc="Telescope git files"})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = '[P]roject [S]earch'})
        vim.keymap.set("n", '<leader>ts', builtin.treesitter, {desc='[T]ree[S]itter'})
        vim.keymap.set("n", '<leader>lg', builtin.live_grep, {desc='[L]ive[G]rep'})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {desc='[V]im [H]elp'})
        vim.keymap.set('n', '<leader>tl', builtin.buffers, {desc='[T]ab [L]ist'})

        function search_word_and_populate_quickfix()
            local word_under_cursor = vim.fn.expand("<cword>")
            print("Word under cursor is", word_under_cursor)
            if word_under_cursor ~= "" then
                vim.cmd("vimgrep " .. word_under_cursor .. " % | copen")
            end
        end

        vim.keymap.set("n", "<leader>gw", ":lua search_word_and_populate_quickfix()<CR>", { noremap = true, silent = true, desc="[G]rep [W]ord under cursor" })

    end
}

