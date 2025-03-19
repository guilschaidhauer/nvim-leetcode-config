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
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 }  -- Ensure this is correctly added
})

-- Enable Treesitter for syntax highlighting
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true },
})

-- Configure nvim-tree
require("nvim-tree").setup()

-- Keybinding to toggle file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

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
vim.cmd.colorscheme("tokyonight-night")  -- Apply the theme