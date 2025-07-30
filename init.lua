
-- this goes in another file
vim.g.mapleader = " "
vim.keymap.set('n', "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true


vim.opt.scrolloff = 8

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "100" require('config.lazy')

-- MOVE TO A REMAP FILE

-- Allow to move around highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move line below to the end of the current line but keep the cursor in the position

vim.keymap.set("n", "J", "mzJ`z")


--Keep the screen centered when jump half of the page

vim.keymap.set("n","<C-d>", "<C-d>zz")
vim.keymap.set("n","<C-u>", "<C-u>zz")


-- Keep the screen centered when searching
vim.keymap.set("n","n", "nzzzv")
vim.keymap.set("n","n", "Nzzzv")

-- Keep the current yank buffer when paste
vim.keymap.set("n", "<leader>p", "\"_dP")


--Copy content on the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

--Delete content avoiding clipboard
vim.keymap.set("n", "<leader>d", "\"+_d")
vim.keymap.set("v", "<leader>d", "\"+_d")



require("config.lazy")
