return {
  {
    "tpope/vim-surround",
    config = function()
      vim.keymap.set("x", "gs", "<Plug>VSurround")
    end,
  },
}
