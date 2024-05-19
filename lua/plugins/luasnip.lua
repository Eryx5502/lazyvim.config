return {
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      enable_autosnippets = true,
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/lazyvim/lua/snippets/snips" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
