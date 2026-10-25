-- Claude Code IDE integration: Claude sees your open file and selection, and proposed edits open as nvim diffs.
return {
  {
    "coder/claudecode.nvim",
    cmd = {
      "ClaudeCode", "ClaudeCodeFocus", "ClaudeCodeSelectModel", "ClaudeCodeAdd", "ClaudeCodeSend",
      "ClaudeCodeTreeAdd", "ClaudeCodeStatus", "ClaudeCodeStart", "ClaudeCodeStop", "ClaudeCodeOpen",
      "ClaudeCodeClose", "ClaudeCodeDiffAccept", "ClaudeCodeDiffDeny", "ClaudeCodeCloseAllDiffs",
    },
    keys = {
      { "<Leader>ac", "<cmd>ClaudeCode<CR>", desc = "Toggle Claude" },
      { "<Leader>af", "<cmd>ClaudeCodeFocus<CR>", desc = "Focus Claude" },
      { "<Leader>ar", "<cmd>ClaudeCode --resume<CR>", desc = "Resume a session" },
      { "<Leader>aC", "<cmd>ClaudeCode --continue<CR>", desc = "Continue last session" },
      { "<Leader>am", "<cmd>ClaudeCodeSelectModel<CR>", desc = "Select model" },
      { "<Leader>ab", "<cmd>ClaudeCodeAdd %<CR>", desc = "Add current file" },
      { "<Leader>as", "<cmd>ClaudeCodeSend<CR>", mode = "v", desc = "Send selection" },
      { "<Leader>as", "<cmd>ClaudeCodeTreeAdd<CR>", desc = "Add file from tree", ft = { "NvimTree" } },
      { "<Leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>", desc = "Accept diff" },
      { "<Leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>", desc = "Reject diff" },
    },
    opts = {
      terminal = {
        provider = "native",
        split_side = "right",
        split_width_percentage = 0.35,
      },
    },
  },
}
