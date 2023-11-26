M = {}

function M.load_snippets(filetype)
  local ls = require("luasnip")
  local snips = require("snippets." .. filetype)
  ls.add_snippets(filetype, snips.snippets, { type = "snippets" })
  ls.add_snippets(filetype, snips.autosnippets, { type = "autosnippets" })
  return ls
end

function M.ismath()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

function M.regex_cap_group(groupNumber)
  return function(args, snip) return snip.captures[groupNumber] end
end

return M
