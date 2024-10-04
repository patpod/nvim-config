-- [[ Basic Keymaps ]]
-- Disable default behavior of space because it is used as our leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Save file
vim.keymap.set({"i", "x", "n", "s"}, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
