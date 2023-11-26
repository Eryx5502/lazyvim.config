return {
  -- Disabled
  -- { "echasnovski/mini.indentscope", enabled = false },
  -- Extras
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.util.project" },
  -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
      event_handlers = {
        -- Close Neotree on file opened
        {
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
        -- reset filter on open file
        -- { -- Not working, yields error
        --   event = "file_opened",
        --   handler = function(file_path)
        --     require("neo-tree.sources.filesystem").reset_search(state)
        --   end,
        -- },
      },
    },
  },
}
