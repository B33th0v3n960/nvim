local map = vim.keymap.set

map("n", "<space>tj", require("jdtls").pick_test, { desc = "Java Unit Tests" })
