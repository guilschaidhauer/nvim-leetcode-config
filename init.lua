-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin installation
require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },  -- Syntax highlighting
  { "nvim-tree/nvim-tree.lua" },  -- File explorer
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },  -- Ensure this is correctly added
  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },  -- Add Rose Pine theme
  { "sainnhe/sonokai", lazy = false, priority = 1000 }  -- Sonokai theme
})

-- Enable Treesitter for syntax highlighting
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true },
})

-- Configure nvim-tree
require("nvim-tree").setup()

-- Keybindings

-- Keybinding to toggle file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Keybinding to yank whole file
vim.keymap.set("n", "yaa", "ggVG\"+y", { noremap = true, silent = true })

-- Keybinding to split window vertically
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })

-- Basic Neovim settings
vim.o.number = true          -- Show line numbers
vim.o.relativenumber = true  -- Relative line numbers
vim.o.termguicolors = true   -- Enable true color support
vim.o.expandtab = true       -- Use spaces instead of tabs
vim.o.shiftwidth = 4         -- Set indentation width
vim.o.tabstop = 4            -- Set tab width

vim.keymap.set("n", "<leader>f", "<C-w>l", { noremap = true, silent = true })

-- Colorthemes
require("tokyonight").setup({
    style = "night",  -- Options: "storm", "night", "day", "moon"
    transparent = false,  -- Enable transparency
    terminal_colors = true,  -- Apply theme colors to terminal
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
    },
})

require("rose-pine").setup({
  variant = "main",  -- Options: "main", "moon", "dawn"
  dark_variant = "main",
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  highlight_groups = {
      CursorLine = { bg = "overlay" },
      StatusLine = { fg = "love", bg = "overlay" },
  }
})

-- Sonokai theme
vim.g.sonokai_style = "andromeda"  -- Options: "default", "atlantis", "andromeda", "shusia", "maia", "espresso"
vim.g.sonokai_enable_italic = 1  -- Enable italic comments
vim.g.sonokai_disable_italic_comment = 0
vim.g.sonokai_diagnostic_text_highlight = 1  -- Enable diagnostic text highlight
vim.g.sonokai_diagnostic_line_highlight = 1  -- Enable diagnostic line highlight
vim.g.sonokai_diagnostic_virtual_text = "colored"  -- Colored virtual text
--

-- vim.cmd.colorscheme("rose-pine")  -- Apply the theme
vim.cmd.colorscheme("sonokai")  -- Sonokai