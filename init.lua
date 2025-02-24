vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.vscode_snippets_path = "./snippets/"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
if vim.g.neovide then
    -- Helper function for transparency formatting
    vim.g.neovide_transparency = 0.8
    vim.g.neovide_normal_opacity = 0.8
    vim.o.guifont = "JetBrainsMono Nerd Font:h14" -- text below applies for VimScript
end

vim.opt.rtp:prepend(lazypath)
local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
-- Get the current command for this project
vim.schedule(function()
    require "mappings"
end)
vim.g.neovide_transparency = 0.8
vim.g.neovide_normal_opacity = 0.8
