-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap
----------------------- General Keymaps -------------------------

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- lines Move Up and Down selected lines
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Selected lines move Up" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Selected line move Down" })

-- buffer
keymap.set("n", "<leader>n", ":bnext<cr>", { desc = "Next buffer" })
keymap.set("n", "<leader>p", ":bprevious<cr>", { desc = "Previous buffer" })
keymap.set("n", "<leader>d", ":bdelete<cr>", { desc = "Delete buffer" })
-- keymap.set("n", "<leader>x", "<cmd>%bd | e#<cr>", { desc = "Close all buffer exccpet current buffer" })

-- clear search highlights
keymap.set("n", "nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "DELETE without copying" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>Sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>Sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>Se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>Sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<TAB>", ":tabnext<cr>", { desc = "Switch Tab" })
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>ts", "<C-w>T", { desc = "Convert Split buffer to Tab" }) -- split window horizontally
