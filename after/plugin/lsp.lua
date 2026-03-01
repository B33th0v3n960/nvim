local capabilities = require('blink.cmp').get_lsp_capabilities()
require("lazydev").setup()
vim.g.lazydev_enable = true

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  capabilities = capabilities,
  filetype = { "lua" },
  root_markers = { { ".luarc.json", ".luarc,jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      }
    }
  }
})

vim.lsp.enable("lua_ls")

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function(args)
    print("testing java")
    require('jdtls.jdtls_setup').setup({})
  end
})
