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
      { "j-hui/fidget.nvim", opts = {} }
    },
    config = function() end,
  },
  {
    "mfussenegger/nvim-jdtls"
  }
}
