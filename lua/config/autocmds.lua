local group = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Only the focused window shows a cursorline
vim.api.nvim_create_autocmd("WinEnter", {
  group = group,
  callback = function() vim.wo.cursorline = true end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = group,
  callback = function() vim.wo.cursorline = false end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function() vim.hl.on_yank() end,
})
