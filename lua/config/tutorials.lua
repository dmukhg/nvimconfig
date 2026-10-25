-- Practice project for the tutorials in tutor/ (open them with :Tutor config-00-index).
--
-- :Playground   open the practice project in a new tab (tab-local cwd), creating it if needed
-- :Playground!  throw away the practice project and rebuild it from tutor/playground

local source = vim.fn.stdpath("config") .. "/tutor/playground"
local target = vim.fn.stdpath("data") .. "/tutor-playground"

local function git(args)
  local cmd = {
    "git",
    "-c", "init.defaultBranch=main",
    "-c", "commit.gpgsign=false",
    "-c", "core.hooksPath=/dev/null",
  }
  vim.list_extend(cmd, args)
  local res = vim.system(cmd, { cwd = target, text = true }):wait()
  if res.code ~= 0 then
    error("git " .. table.concat(args, " ") .. " failed:\n" .. res.stderr)
  end
end

local function commit(author, message)
  local name, email = author[1], author[2]
  git({ "add", "-A" })
  git({ "-c", "user.name=" .. name, "-c", "user.email=" .. email, "commit", "-q", "-m", message })
end

-- Replaces `from` with `to` in a playground file
local function edit(file, from, to)
  local path = target .. "/" .. file
  local text = table.concat(vim.fn.readfile(path), "\n")
  local start, finish = text:find(from, 1, true)
  assert(start, "playground: '" .. from .. "' not found in " .. file)
  text = text:sub(1, start - 1) .. to .. text:sub(finish + 1)
  vim.fn.writefile(vim.split(text, "\n"), path)
end

local ada = { "Ada Lovelace", "ada@example.com" }
local grace = { "Grace Hopper", "grace@example.com" }
local alan = { "Alan Turing", "alan@example.com" }

-- History used by the git tutorial:
--   main:             Initial inventory and shop (Ada) -> Raise retry limit (Grace)
--   feature/discount: + Add discount support (Alan) -> Fix typo in discount docstring (Alan)
local function build()
  vim.fn.mkdir(target, "p")
  local res = vim.system({ "cp", "-R", source .. "/.", target }):wait()
  assert(res.code == 0, "playground: copy failed: " .. (res.stderr or ""))

  git({ "init", "-q" })
  commit(ada, "Initial inventory and shop")

  edit("inventory.py", "RETRY_LIMIT = 3", "RETRY_LIMIT = 7")
  commit(grace, "Raise retry limit")

  git({ "switch", "-q", "-c", "feature/discount" })
  edit("inventory.py", "\n\ndef restock(", table.concat({
    "",
    "",
    "DISCOUNT_PERCENT = 15",
    "",
    "",
    "def discounted(price_cents: int) -> int:",
    '    """Apply the store-wide discont to a price."""',
    "    return price_cents * (100 - DISCOUNT_PERCENT) // 100",
    "",
    "",
    "def restock(",
  }, "\n"))
  commit(alan, "Add discount support")

  edit("inventory.py", "discont", "discount")
  commit(alan, "Fix typo in discount docstring")

  git({ "switch", "-q", "main" })
end

local function wipe()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf):sub(1, #target) == target then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
  vim.fn.delete(target, "rf")
end

vim.api.nvim_create_user_command("Playground", function(opts)
  if opts.bang then
    wipe()
  end
  if not vim.uv.fs_stat(target) then
    local ok, err = pcall(build)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
      return
    end
  end
  vim.cmd.tabnew()
  vim.cmd.tcd(vim.fn.fnameescape(target))
  vim.cmd.edit("shop.py")
end, { bang = true, desc = "Open the tutorial practice project (! to reset it)" })
