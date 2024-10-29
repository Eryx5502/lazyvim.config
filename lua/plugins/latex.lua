local util = require("lspconfig.util")

return {
  { import = "lazyvim.plugins.extras.lang.tex" },
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.tex_flavor = "latex"
      if (vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1) and vim.fn.executable("sioyek.exe") then
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
        vim.g.vimtex_callback_progpath = "wsl -e bash -lic nvim"
      else
        vim.g.vimtex_view_method = "zathura"
      end
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_imaps_enabled = 0
    end,
    cmd = {
      "VimtexInverseSearch",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          root_dir = util.root_pattern(".git"),
        },
      },
    },
  },
}
