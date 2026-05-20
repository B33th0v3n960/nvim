return {
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.cmd.colorscheme("nord")
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#81a1c1" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#d08770" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#81a1c1" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#81a1c1" })
    end,
  },
}
