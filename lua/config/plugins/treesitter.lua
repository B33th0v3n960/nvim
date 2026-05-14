return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
      "c",
      "cpp",
      "make",
      "cmake",
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "markdown",
      "markdown_inline",
      "python",
      "yaml",
      "toml",
      "html",
      "css",
      "javascript",
      "json",
      "tsx",
      "rust",
      "typst",
      "latex",
      "go",
      "java",
    })
    -- main no longer auto-enables anything. Turn on highlighting per filetype.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if lang and pcall(vim.treesitter.language.add, lang) then
          pcall(vim.treesitter.start, args.buf, lang)
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldmethod = "expr"
        end
      end,
    })
  end,
}
