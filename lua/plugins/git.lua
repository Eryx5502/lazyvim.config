return {
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gedit",
      "Gsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Glgrep",
      "Gmove",
      "GDelete",
      "GRemove",
      "GBrowse",
    },
    keys = {
      { "<leader>gl", "<cmd>G blame<CR>", desc = ":G blame" },
      { "<leader>gO", "<cmd>G difftool HEAD~1<CR>", desc = "Changes in last commit" },
    },
  },
  -- PR and Issue edit from nvim
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        enable_builtin = true,
        use_local_fs = true,
      })
      vim.cmd([[hi OctoEditable guibg=none]])
    end,
    keys = {
      { "<leader>o", "<cmd>Octo<cr>", desc = "Octo.nvim" },
    },
    cmd = { "Octo" },
  },
  -- see diffview on a nice interface
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  { "tpope/vim-rhubarb" }, -- For enabling GBrowse for github
  { "shumphrey/fugitive-gitlab.vim" }, -- For enabling GBrowse for gitlab
  -- Enable virtual text blame for current line
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      _extmark_signs = false,
    },
  },
}
