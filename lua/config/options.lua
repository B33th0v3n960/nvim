vim.g.have_nerd_font = true

local options = {
  number = true,
  relativenumber = true,
  showmode = false,
  breakindent = true,
  undofile = true,
  ignorecase = true,
  smartcase = true,
  splitright = true,
  splitbelow = true,
  cursorline = true,
  scrolloff = 10,
  sidescrolloff = 8,
  expandtab = true,
  tabstop = 4,
  shiftwidth = 4,
  signcolumn = "yes",
  swapfile = false,
  wrap = false,
  linebreak = true,
  termguicolors = true,
  textwidth = 80,
  numberwidth = 4,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.schedule(
  function()
    vim.opt.clipboard = "unnamedplus"
  end
)
