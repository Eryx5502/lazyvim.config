return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
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
