-- Bootstrap lazy.nvim, pinned to its stable branch.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n" .. out, "ErrorMsg" } }, true, {})
    return
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Every file in lua/plugins/ returns a list of plugin specs.
  spec = { { import = "plugins" } },
  -- Exact commits are recorded in lazy-lock.json (committed to git).
  -- Nothing updates unless you run :Lazy update; :Lazy restore rolls back to the lockfile.
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
  checker = { enabled = false },
  change_detection = { notify = false },
  install = { colorscheme = { "default" } },
  ui = { border = "rounded" },
  rocks = { enabled = false }, -- no luarocks needed; avoids a hererocks build
})
