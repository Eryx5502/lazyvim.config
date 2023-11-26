local lsp_filetypes = {
  "c",
  "cpp",
  "html",
  "css",
  "json",
  "python",
  "rust",
  "solidity",
  "lua",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "yaml",
  "sql",
  "sh",
  "go",
  "gomod",
  "java",
  "r",
  "bib",
}
return {
  {
    "glepnir/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lspsaga").setup({
        border_style = "rounded",
        lightbulb = {
          enable = false,
          enable_in_insert = false,
          sign = false,
          sign_priority = 40,
          virtual_text = false,
        },
        symbol_in_winbar = {
          enable = true,
        },
      })
    end,
    ft = lsp_filetypes,
  },
}
