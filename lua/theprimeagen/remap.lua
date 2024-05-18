vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set({ "n", "v" }, "<leader>f", function() vim.lsp.buf.format({ formatting_options = { tabSize = 4, insertSpaces = true } }) end )

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


vim.keymap.set("n", "tp", ":tabprev<CR>", { desc = "[T]ab [P]rev" })
vim.keymap.set("n", "tn", ":tabnext<CR>", { desc = "[T]ab [N]ext" })
vim.keymap.set("n", "<leader><C-n>", ":NERDTreeToggle<CR>", { desc = "NERD Tree Toggle" })


-- Remaps to open and close the qflist
vim.keymap.set("n", "<leader>co", ":copen<CR>", { desc = "[C][O]pen" })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "[C][C]lose" })
vim.keymap.set("n", "<leader>fw", ":Telescope grep_string default_text=" .. vim.fn.expand("<cword>") .. "<CR>",
    { desc = '[F]ind [W]ord' })

local FormatFile =  function()
    vim.command(":'<,'>pyf /opt/homebrew/Cellar/clang-format/18.1.3/share/clang/clang-format.py")
end

local format = function()
    vim.cmd(":'<,'>pyf /opt/homebrew/Cellar/clang-format/18.1.3/share/clang/clang-format.py")
    vim.api.nvim_feedkeys("=", 'm', "<CR>")
end
vim.keymap.set({"n", "v"}, "<leader>f2",
    string.format(":pyf /opt/homebrew/Cellar/clang-format/18.1.3/share/clang/clang-format_2.py") ,
    { desc = "Format Selected Lines"})
vim.keymap.set({"n", "v"}, "<leader>f4",
    string.format(":pyf /opt/homebrew/Cellar/clang-format/18.1.3/share/clang/clang-format_4.py") ,
    { desc = "Format Selected Lines"})
