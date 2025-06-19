-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

--[[    Install `lazy.nvim` plugin manager 
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
--]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

--[[ Configure and install plugins --]]
require('lazy').setup({
  require 'Plugins.mason',
  require 'Plugins.telescope',
  require 'Plugins.treesitter',
  require 'Plugins.neo-tree',
  require 'Plugins.gitsigns',
  require 'Plugins.which-key',
  require 'Plugins.todo-comments',
  require 'Plugins.guess-indent',
  require 'Plugins.lazydev',
  require 'Plugins.conform',
  require 'Plugins.mini',
  require 'Plugins.blink',
  require 'Plugins.debug',

  -- require 'Plugins.indent_line',
  -- require 'Plugins.lint',
  -- require 'Plugins.autopairs',
  --[[ Colorschemes --]]
  require 'Plugins.gruvbox',
  -- require 'Plugins.tokyonight',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
require 'Configuration.AutoCommands'
require 'Configuration.Keymaps'
require 'Configuration.Options'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
