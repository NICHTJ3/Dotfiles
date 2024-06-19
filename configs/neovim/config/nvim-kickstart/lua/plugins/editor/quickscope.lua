return {
  'unblevable/quick-scope',
  keys = {
    'f',
    'F',
    't',
    'T',
  },
  init = function()
    vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    vim.g.qs_max_chars = 150
    vim.g.qs_lazy_highlight = 1
  end,
}
