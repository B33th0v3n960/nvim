local capabilities = require("blink.cmp").get_lsp_capabilities()
require("lazydev").setup({})
require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "clangd",
    "jdtls",
    "json-lsp",
    "ltex-ls-plus",
    "tinymist",
    "typescript-language-server",
    "css-lsp",
    "html-lsp",
  },
})

vim.g.lazydev_enable = true

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  capabilities = capabilities,
  filetype = { "lua" },
  root_markers = { { ".luarc.json", ".luarc,jsonc" }, ".git" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      runtime = {
        version = "LuaJIT",
      },
    },
  },
})

vim.lsp.config("tinymist", {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  root_markers = { ".git" },
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onSave",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(args)
    require("jdtls.jdtls_setup").setup({})
  end,
})

vim.lsp.enable({ "lua_ls", "stylua", "clangd", "jsonls", "ltex_plus", "tinymist", "ts_ls", "cssls", "html" })
