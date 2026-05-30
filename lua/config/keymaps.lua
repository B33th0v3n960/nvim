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
map("n", "J", vim.diagnostic.open_float)
-- map("n", "<space>f", vim.lsp.buf.format)
-- map("n", "<space>a", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Moving between quickfix list
map("n", "<M-j>", "<cmd>cnext<CR>")
map("n", "<M-k>", "<cmd>cprev<CR>")

-- Toggle Inlay Hints
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
  callback = function(event)
    map("n", "<space>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
    end, { buffer = event.buf, desc = "LSP: [T]oggle Inlay [H]ints" })

    map("n", "<space>f", function()
      require("conform").format({ bufnr = event.buf })
    end, { buffer = event.buf, desc = "[F]ormat Code" })
  end,
})

-- External package keymap
map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
map("n", "<space>m", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })
