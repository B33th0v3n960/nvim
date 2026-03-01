vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local map = vim.keymap.set

map("n", "<ESC>", "<cmd> nohlsearch<CR>")

map("n", "<space><space>x", "<cmd>source %<CR>")
map("n", "<space>x", ":.lua<CR>")
map("v", "<space>x", ":lua<CR>")

-- Moving between windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Lsp keymaps
map("n", "J", function() vim.diagnostic.open_float() end)
map("n", "<space>f", function() vim.lsp.buf.format() end)
map("n", "<space>a", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Moving between quickfix list
map("n", "<M-j>", "<cmd>cnext<CR>")
map("n", "<M-k>", "<cmd>cprev<CR>")

-- External package keymap
map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

local previewState = 0
local mdpreview = function()
  print(previewState)
  if previewState == 0 then
    previewState = 1
    vim.cmd("MarkdownPreview")
    print("Starting Markdown Preview")
  elseif previewState == 1 then
    previewState = 0
    vim.cmd("MarkdownPreviewStop")
    print("Closing Markdown Preview")
  end
end
map("n", "<space>m", mdpreview, { desc = "Toggle Markdown Preview" })
