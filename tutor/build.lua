-- Generates the <lesson>.tutor.json files that :Tutor uses to check answers.
-- :Tutor matches answers by line number, so rerun this after editing a lesson:
--
--   nvim -l tutor/build.lua
--
-- Each question is a line ending in "____". The key below is that line's text before "____".

local answers = {
  ["config-01-lsp"] = {
    ["    secret word: "] = "lighthouse",
    ["    RETRY_LIMIT is: "] = "7",
    ["    undefined name: "] = "total_valu",
  },
  ["config-02-find"] = {
    ["    codename: "] = "marmalade",
    ["    treasure: "] = "compass",
    ["    sibling folder: "] = "september",
  },
  ["config-03-git"] = {
    ["    retry limit changed by: "] = "Grace Hopper",
    ["    original retry limit: "] = "3",
    ["    discount percent: "] = "15",
    ["    newest commit: "] = "Add discount support",
  },
  ["config-04-terminal"] = {
    ["    terminal output: "] = "tutor-42",
  },
}

local dir = vim.fs.dirname(vim.fs.normalize(arg[0]))

for lesson, questions in pairs(answers) do
  local lines = vim.fn.readfile(dir .. "/" .. lesson .. ".tutor")
  local expect, found = {}, {}

  for lnum, line in ipairs(lines) do
    local prefix = line:match("^(.-)____$")
    if prefix then
      local answer = questions[prefix]
      assert(answer, ("%s:%d: no answer for %q"):format(lesson, lnum, line))
      assert(not found[prefix], ("%s: question %q appears twice"):format(lesson, prefix))
      found[prefix] = true
      expect[tostring(lnum)] = prefix .. answer
    end
  end

  for prefix in pairs(questions) do
    assert(found[prefix], ("%s: question %q not found"):format(lesson, prefix))
  end

  local path = dir .. "/" .. lesson .. ".tutor.json"
  vim.fn.writefile({ vim.json.encode({ expect = expect }) }, path)
  print(("%s: %d questions"):format(path, vim.tbl_count(expect)))
end
