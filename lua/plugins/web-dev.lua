return {
  -- Handlebars (For FoundryVtt)
  { 'mustache/vim-mustache-handlebars' },
  -- HTML
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
