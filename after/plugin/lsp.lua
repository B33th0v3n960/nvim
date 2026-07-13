local capabilities = require("blink.cmp").get_lsp_capabilities()
require("lazydev").setup({})
require("mason").setup()

require("mason-tool-installer").setup({
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "clangd",
    "clang-format",
    "jdtls",
    "json-lsp",
    "ltex-ls-plus",
    "tinymist",
    "typescript-language-server",
    "css-lsp",
    "html-lsp",
    "pyright",
    "isort",
    "black",
    "prettierd",
    "eslint_d",
    "stylelint",
    "astro-language-server",
    "emmet-language-server",
  },
})

vim.g.lazydev_enable = true

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("clangd", { capabilities = capabilities, cmd = { "clangd", "--background-index" } })

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
  capabilities = capabilities,
  filetypes = { "typst" },
  root_markers = { ".git" },
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onSave",
  },
})

vim.lsp.config("astro", {
  capabilities = capabilities,
  init_options = {
    typescript = {
      tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
    },
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(args)
    require("jdtls.jdtls_setup").setup({})
  end,
})

vim.lsp.enable({
  "lua_ls",
  "stylua",
  "clangd",
  "jsonls",
  "ltex_plus",
  "tinymist",
  "ts_ls",
  "cssls",
  "html",
  "pyright",
  "astro",
  "emmet_language_server",
  -- "rust_analyzer",
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    json = { "prettierd", "prettier", stop_after_first = true },
    typst = { "typstyle", lsp_format = "prefer" },
    c = { "clang_format", lsp_format = "fallback" },
    cpp = { "clang_format", lsp_format = "fallback" },

    html = { "prettierd" },
    css = { "prettierd", "stylelint" },
    scss = { "prettierd", "stylelint" },
    markdown = { "prettierd", lsp_format = "fallback" },

    javascript = { "prettierd", "eslint_d", stop_after_first = true },
    typescript = { "prettierd", "eslint_d", stop_after_first = true },
    javascriptreact = { "prettierd", "eslint_d" },
    typescriptreact = { "prettierd", "eslint_d" },

    astro = { "prettierd" }, -- requires prettier-plugin-astro
  },
})
