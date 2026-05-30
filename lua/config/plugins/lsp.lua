return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function() end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    cmd = "Mason",
    opts = {
      PATH = "append",
    },
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
