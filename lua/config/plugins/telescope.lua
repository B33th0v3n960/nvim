return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "ivy",
            hidden = true,
            no_ignore = false,
            file_ignore_patterns = { "^.git/" },
          },
        },
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      vim.lsp.handlers["textDocument/codeAction"] = require("telescope.builtin").lsp_implementations
      vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)

      vim.keymap.set("n", "<space>fh", function()
        local actions = require("telescope.actions")
        require("telescope.builtin").help_tags({
          attach_mappings = function(_, map)
            actions.select_default:replace(actions.select_vertical)
            return true
          end,
        })
      end)

      vim.keymap.set("n", "<space>en", function()
        local cwd = vim.fn.stdpath("config")
        vim.cmd("cd " .. cwd)
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)

      require("config.telescope.multigrep").setup()
    end,
  },
}
