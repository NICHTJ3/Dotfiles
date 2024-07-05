return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdomnPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
}
