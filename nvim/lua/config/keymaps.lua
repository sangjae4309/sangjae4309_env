local map = vim.keymap.set

local function open_side_terminal(cmd)
  vim.cmd("vsplit")
  vim.cmd("terminal " .. cmd)
end

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>c", function()
  open_side_terminal("claude")
end, { desc = "Open Claude terminal" })
map("n", "<leader>x", function()
  open_side_terminal("codex")
end, { desc = "Open Codex terminal" })

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
