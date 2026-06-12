-- 1. Maintain your legacy Vim settings
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd("source ~/.vimrc")

-- 2. Bootstrap lazy.nvim (automatically download it if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- auto-refresh if file was changed and unmodified
-- Fast update time (500ms instead of 4000ms)
vim.opt.updatetime = 500
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})
-- Notify when file changes
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File reloaded: " .. vim.fn.expand("%"), vim.log.levels.INFO)
  end,
})
-- end auto-refresh

-- 3. Configure your plugins
-- This is where you list the plugins you want to install.
require("lazy").setup({
  -- You can add Neovim-specific plugins here!
  -- Take a look at these popular examples:

  -- Fuzzy finder (Telescope)
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Better syntax highlighting (Treesitter)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  -- fzf - Fuzzy Finder
  { 'junegunn/fzf', build = './install --bin' },
  { 'junegunn/fzf.vim' },
  -- Color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load this first
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require("lint")

      -- 1. Assign Vale to your desired filetypes
      lint.linters_by_ft = {
        markdown = { "vale" },
        text = { "vale" },
        tex = { "vale" }, -- LaTeX support if you use it
      }

      -- 2. Create an autocmd to trigger linting automatically
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
})
