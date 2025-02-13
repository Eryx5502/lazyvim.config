return {
  { "garymjr/nvim-snippets", enabled = false },
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
  -- {
  --   "hrsh7th/nvim-cmp",
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     local cmp = require("cmp")
  --     local luasnip = require("luasnip")
  --
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  --           cmp.select_next_item()
  --         elseif luasnip.locally_jumpable(1) then
  --           luasnip.jump(1)
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif luasnip.locally_jumpable(-1) then
  --           luasnip.jump(-1)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },
}
