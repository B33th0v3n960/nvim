local fn = vim.fn

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself

  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use("nvim-lualine/lualine.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("folke/which-key.nvim")

  -- Colorschemes
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- Cmp
  use("hrsh7th/nvim-cmp")        -- The completion plugin
  use("hrsh7th/cmp-buffer")      -- buffer completions
  use("hrsh7th/cmp-path")        -- path completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- Snippets
  use("L3MON4D3/LuaSnip")            --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use({ "neovim/nvim-lspconfig" })      -- enable LSP
  use("williamboman/mason.nvim")        -- simple to use language server installer
  use("williamboman/mason-lspconfig.nvim")
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("RRethy/vim-illuminate")

  -- Telescope
  use("nvim-telescope/telescope.nvim")

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter")

  -- Leap.nvim
  use({ "ggandor/leap.nvim", require = { "tpope/vim-repeat" } })
  use("nvim-pack/nvim-spectre")

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
