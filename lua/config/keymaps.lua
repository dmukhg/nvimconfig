local map = vim.keymap.set

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Wrap toggle: when wrapping, move by display lines so long lines feel less jumpy.
-- https://vim.fandom.com/wiki/Move_cursor_by_display_lines_when_wrapping
local wrap_keys = {
  { { "n", "v" }, "<Up>", "gk" },
  { { "n", "v" }, "<Down>", "gj" },
  { { "n", "v" }, "<Home>", "g<Home>" },
  { { "n", "v" }, "<End>", "g<End>" },
  { "i", "<Up>", "<C-o>gk" },
  { "i", "<Down>", "<C-o>gj" },
  { "i", "<Home>", "<C-o>g<Home>" },
  { "i", "<End>", "<C-o>g<End>" },
}

local function toggle_wrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.o.virtualedit = "all"
    for _, k in ipairs(wrap_keys) do
      pcall(vim.keymap.del, k[1], k[2], { buffer = 0 })
    end
    vim.notify("Wrap OFF")
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.list = false
    vim.o.virtualedit = ""
    for _, k in ipairs(wrap_keys) do
      map(k[1], k[2], k[3], { buffer = 0, silent = true })
    end
    vim.notify("Wrap ON")
  end
end

map("n", "<Leader>w", toggle_wrap, { desc = "Toggle wrap" })
