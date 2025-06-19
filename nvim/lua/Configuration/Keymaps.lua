--[[    Basic Keymaps 

-- See `:help vim.keymap.set()`

--]]

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<F8>', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- LSP
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set({ 'n', 'x' }, '<A-CR>', vim.lsp.buf.code_action, { desc = 'CodeAction' })
vim.keymap.set('n', '<S-F12>', require('telescope.builtin').lsp_references, { desc = 'FindReferences' })
vim.keymap.set('n', '<F12>', require('telescope.builtin').lsp_definitions, { desc = 'GotoDefinition' })
vim.keymap.set('n', '<F12>', vim.lsp.buf.declaration, { desc = 'GotoDeclaration' })
vim.keymap.set('n', '<F12>', require('telescope.builtin').lsp_implementations, { desc = 'GotoImplementation' })
vim.keymap.set('n', 'gO', require('telescope.builtin').lsp_document_symbols, { desc = 'FindSymbols' })
vim.keymap.set('n', 'gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = 'FindSymbolsWorkspace' })
vim.keymap.set('n', 'grt', require('telescope.builtin').lsp_type_definitions, { desc = 'GotoTypeDefinition' })
vim.keymap.set('n', '<C-i-h>', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled)
end, { desc = 'ToggleInlayHints' })
