local util = require("lspconfig.util")

return {
  { import = "lazyvim.plugins.extras.lang.tex" },
  {
    "lervag/vimtex",
    ft = "tex",
    dependencies = "KeitaNakamura/tex-conceal.vim",
    config = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_imaps_enabled = 0
    end,
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
