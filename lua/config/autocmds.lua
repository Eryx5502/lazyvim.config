-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Set makeprg for debugging typescript on quickfix
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("tsc_makeprg"),
  pattern = { "typescript", "typescriptreact", "javascript" },
  callback = function()
    vim.opt_local.makeprg = [[npx\ tsc\ \\\|\ sed\ 's/(\\(.*\\),\\(.*\\)):/:\\1:\\2:/']]
  end,
})
