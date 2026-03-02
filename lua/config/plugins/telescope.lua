return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
      require("telescope").setup {
        pickers    = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        }
      }

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      vim.lsp.handlers["textDocument/codeAction"] = require("telescope.builtin").lsp_implementations
      vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
      vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)
      vim.keymap.set("n", "<space>en", function()
        require("telescope.builtin").find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
    end
  }
}
