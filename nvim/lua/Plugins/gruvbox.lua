return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        italic = { strings = false, emphasis = false, comments = false, operators = false, folds = false },
        contrast = 'hard',
      }
      -- 'light' or 'dark'
      vim.o.background = 'dark'
      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
