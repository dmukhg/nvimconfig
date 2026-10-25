-- A single persistent shell in a bottom split, toggled with <C-/>.
-- In the terminal, <Esc><Esc> (or <C-q>) drops to normal mode for vim-style scrollback: search, yank, motions.
-- `i` or `a` goes back to typing.

local term = { buf = nil, win = nil }

local function toggle()
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_hide(term.win)
    term.win = nil
    return
  end

  vim.cmd("botright split")
  vim.api.nvim_win_set_height(0, math.floor(vim.o.lines * 0.3))
  if term.buf and vim.api.nvim_buf_is_valid(term.buf) then
    vim.api.nvim_win_set_buf(0, term.buf)
  else
    vim.cmd.terminal()
    term.buf = vim.api.nvim_get_current_buf()
    vim.bo[term.buf].buflisted = false
  end
  term.win = vim.api.nvim_get_current_win()
  vim.cmd.startinsert()
end

-- Terminals send <C-/> as <C-_>
for _, lhs in ipairs({ "<C-/>", "<C-_>" }) do
  vim.keymap.set({ "n", "t" }, lhs, toggle, { desc = "Toggle terminal" })
end

vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Terminal: normal mode" })

local group = vim.api.nvim_create_augroup("UserTerminal", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function(args)
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
    vim.bo[args.buf].scrollback = 100000
    -- Claude Code uses <Esc><Esc> itself (edit previous message), so it only gets <C-q>
    -- Buffer names look like term://{cwd}//{pid}:{cmd}; only look at the command
    if not vim.api.nvim_buf_get_name(args.buf):match("//%d+:.*claude") then
      vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { buffer = args.buf, desc = "Terminal: normal mode" })
    end
  end,
})

-- When the shell exits, drop its buffer so the next toggle starts a fresh one
vim.api.nvim_create_autocmd("TermClose", {
  group = group,
  callback = function(args)
    if args.buf == term.buf then
      term.buf, term.win = nil, nil
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(args.buf) then
          vim.api.nvim_buf_delete(args.buf, { force = true })
        end
      end)
    end
  end,
})
